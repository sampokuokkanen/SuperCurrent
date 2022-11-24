# frozen_string_literal: true

require "test_helper"

class SuperCurrentTest < ActionDispatch::IntegrationTest
  test "it will show the contents of Current but not on the next request" do
    get "/?foo=bar"
    assert_select "h1", "bar"
    get "/"
    assert_select "h1", ""
  end

  test "[hoge][hoge] will also get reset" do
    get "/?hoge=hoge"
    assert_select "h2", "hoge"
    get "/"
    assert_select "h2", ""
  end
end
