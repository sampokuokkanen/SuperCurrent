# frozen_string_literal: true

require 'super_current/version'
require 'super_current/railtie'
require 'dry-configurable'

# SuperCurrent makes it easier to use ActiveSupport::CurrentAttributes
module SuperCurrent
  extend Dry::Configurable

  setting :current_class_name, default: 'Current', reader: true

  # The class that actually has the CurrentAttributes as parent class
  # Named SuperSuperCurrent to avoid conflicts with the SuperCurrent module
  class SuperSuperCurrent < ActiveSupport::CurrentAttributes
    attribute :__current_hash

    def self.[](key)
      self.__current_hash ||= {}
      self.__current_hash[key] || self.__current_hash[key] = {}
    end

    def self.[]=(key, value)
      self.__current_hash ||= {}
      self.__current_hash[key] = value
    end

    def self.method_missing(method, *args)
      return unless method.to_s.end_with?('=')

      attribute_name = method.to_s.chomp('=')
      attribute_value = args.first

      class_eval { attribute attribute_name.to_sym }
      public_send "#{attribute_name}=", attribute_value
    end

    def self.respond_to_missing?(method, include_private = false)
      method.to_s.end_with?('=') || super
    end
  end
end

Object.const_set(SuperCurrent.config.current_class_name, SuperCurrent::SuperSuperCurrent)
