require 'test_helper'

class ProjectControllerTest < ActionDispatch::IntegrationTest
  test "should get _form" do
    get project__form_url
    assert_response :success
  end

  test "should get edit" do
    get project_edit_url
    assert_response :success
  end

  test "should get index" do
    get project_index_url
    assert_response :success
  end

  test "should get new" do
    get project_new_url
    assert_response :success
  end

  test "should get show" do
    get project_show_url
    assert_response :success
  end

end
