require 'test_helper'

class ApplyJobsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get apply_jobs_index_url
    assert_response :success
  end

  test "should get show" do
    get apply_jobs_show_url
    assert_response :success
  end

  test "should get create" do
    get apply_jobs_create_url
    assert_response :success
  end

  test "should get new" do
    get apply_jobs_new_url
    assert_response :success
  end

end
