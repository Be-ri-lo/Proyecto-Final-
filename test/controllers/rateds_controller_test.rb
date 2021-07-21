require "test_helper"

class RatedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rated = rateds(:one)
  end

  test "should get index" do
    get rateds_url
    assert_response :success
  end

  test "should get new" do
    get new_rated_url
    assert_response :success
  end

  test "should create rated" do
    assert_difference('Rated.count') do
      post rateds_url, params: { rated: {  } }
    end

    assert_redirected_to rated_url(Rated.last)
  end

  test "should show rated" do
    get rated_url(@rated)
    assert_response :success
  end

  test "should get edit" do
    get edit_rated_url(@rated)
    assert_response :success
  end

  test "should update rated" do
    patch rated_url(@rated), params: { rated: {  } }
    assert_redirected_to rated_url(@rated)
  end

  test "should destroy rated" do
    assert_difference('Rated.count', -1) do
      delete rated_url(@rated)
    end

    assert_redirected_to rateds_url
  end
end
