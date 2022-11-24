class CurrentsController < ApplicationController
  def index
    Current.bar = params[:foo]
    Current[:hoge][:hoge] = params[:hoge]
  end
end
