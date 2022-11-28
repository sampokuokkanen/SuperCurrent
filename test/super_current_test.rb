require "test_helper"

class SuperCurrentControllerTest < ActiveSupport::TestCase
  test "it has a version number" do
    assert SuperCurrent::VERSION
  end

  test "if not set the class name of Current is Current" do
    assert_equal "Current", SuperCurrent.current_class_name
  end

  test "it is possible to set attributes to Current" do
    Current.foo = "bar"
    assert_equal "bar", Current.foo
  end

  test "responds to missing methods" do
    assert_respond_to Current, :foo=
  end

  test "it is possible to use [] accessors" do
    Current[:foo] = "bar"
    assert_equal "bar", Current[:foo]
  end

  test "it is possible to use nested [] accessors without errors" do
    Current[:hoge][:bar] = "baz"
    assert_equal "baz", Current[:hoge][:bar]
  end

  test "katakana keys are ok" do
    Current.ホゲ = "ほげ"
    assert_equal "ほげ", Current.ホゲ
  end

  test "Chinese keys are ok" do
    Current.阿里山國家風景區 = "Alishan National Scenic Area"
    assert_equal "Alishan National Scenic Area", Current.阿里山國家風景區
  end

  test "responds to missing properly" do
    assert_equal Current.respond_to?(:cat), false
    Current.cat = true
    assert_equal Current.respond_to?(:cat), true
  end

  test "does not respond to ? methods" do
    assert_equal Current.respond_to?(:cat?), false
  end

  test "raises if not yet defined" do
    assert_raises(NoMethodError) { Current.dog }
  end
end
