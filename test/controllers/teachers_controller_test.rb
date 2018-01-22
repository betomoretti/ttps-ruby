require 'test_helper'

class TeachersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teacher = {email: "email@email.com", password: "123456"}
    sign_in teachers(:one)
  end

  test "should get index" do
    get teachers_url
    assert_response :success
  end

  test "should get new" do
    get new_teacher_url
    assert_response :success
  end

  test "should create teacher" do
    assert_difference('Teacher.count') do
      post teachers_url, params: { teacher: @teacher }
    end

    assert_redirected_to teacher_url(Teacher.last)
  end

  test "should show teacher" do
    @teacher = teachers(:one)
    get teacher_url(@teacher)
    assert_response :success
  end

  test "should get edit" do
    @teacher = teachers(:one)
    get edit_teacher_url(@teacher)
    assert_response :success
  end

  test "should update teacher" do
    @teacher = teachers(:one)
    patch teacher_url(@teacher), params: { teacher: { email: @teacher.email } }
    assert_redirected_to teacher_url(@teacher)
  end

  test "should destroy teacher" do
    @teacher = teachers(:one)
    assert_difference('Teacher.count', -1) do
      delete teacher_url(@teacher)
    end

    assert_redirected_to teachers_url
  end
end
