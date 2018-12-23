require 'test_helper'

class Admin::LessonsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_lesson = admin_lessons(:one)
  end

  test "should get index" do
    get admin_lessons_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_lesson_url
    assert_response :success
  end

  test "should create admin_lesson" do
    assert_difference('Admin::Lesson.count') do
      post admin_lessons_url, params: { admin_lesson: {  } }
    end

    assert_redirected_to admin_lesson_url(Admin::Lesson.last)
  end

  test "should show admin_lesson" do
    get admin_lesson_url(@admin_lesson)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_lesson_url(@admin_lesson)
    assert_response :success
  end

  test "should update admin_lesson" do
    patch admin_lesson_url(@admin_lesson), params: { admin_lesson: {  } }
    assert_redirected_to admin_lesson_url(@admin_lesson)
  end

  test "should destroy admin_lesson" do
    assert_difference('Admin::Lesson.count', -1) do
      delete admin_lesson_url(@admin_lesson)
    end

    assert_redirected_to admin_lessons_url
  end
end
