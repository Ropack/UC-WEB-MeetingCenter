require 'test_helper'

class Admin::TeachersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_teacher = admin_teachers(:one)
  end

  test "should get index" do
    get admin_teachers_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_teacher_url
    assert_response :success
  end

  test "should create admin_teacher" do
    assert_difference('Admin::Teacher.count') do
      post admin_teachers_url, params: { admin_teacher: {  } }
    end

    assert_redirected_to admin_teacher_url(Admin::Teacher.last)
  end

  test "should show admin_teacher" do
    get admin_teacher_url(@admin_teacher)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_teacher_url(@admin_teacher)
    assert_response :success
  end

  test "should update admin_teacher" do
    patch admin_teacher_url(@admin_teacher), params: { admin_teacher: {  } }
    assert_redirected_to admin_teacher_url(@admin_teacher)
  end

  test "should destroy admin_teacher" do
    assert_difference('Admin::Teacher.count', -1) do
      delete admin_teacher_url(@admin_teacher)
    end

    assert_redirected_to admin_teachers_url
  end
end
