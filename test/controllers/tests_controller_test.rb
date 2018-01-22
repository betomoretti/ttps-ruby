require 'test_helper'

class TestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test = tests(:one)
    sign_in teachers(:one)
  end

  test "should get index" do
    get tests_url
    assert_response :success
  end

  test "should get new" do
    get new_test_url
    assert_response :success
  end

  test "should create test" do
    assert_difference('Test.count') do
      post tests_url, params: { test: { due_date: @test.due_date, note_to_approve: @test.note_to_approve, title: @test.title, signature_year_id: @test.signature_year.id } }
    end

    assert_redirected_to test_url(Test.last)
  end

  test "should show test" do
    get test_url(@test)
    assert_response :success
  end

  test "should get edit" do
    get edit_test_url(@test)
    assert_response :success
  end

  test "should update test" do
    patch test_url(@test), params: { test: { due_date: @test.due_date, note_to_approve: @test.note_to_approve, title: @test.title } }
    assert_redirected_to test_url(@test)
  end

  test "should destroy test" do
    assert_difference('Test.count', -1) do
      delete test_url(@test)
    end

    assert_redirected_to tests_url
  end
end
