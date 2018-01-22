require 'test_helper'

class TestNotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test_note = test_notes(:one)
    sign_in teachers(:one)
  end

  test "should get index" do
    get test_notes_url
    assert_response :success
  end

  test "should get new" do
    get new_test_note_url
    assert_response :success
  end

  test "should create test_note" do
    assert_difference('TestNote.count') do
      post test_notes_url, params: { test_note: { note: @test_note.note, test_id: @test_note.test.id, student_id: @test_note.student.id } }
    end

    assert_redirected_to test_note_url(TestNote.last)
  end

  test "should show test_note" do
    get test_note_url(@test_note)
    assert_response :success
  end

  test "should get edit" do
    get edit_test_note_url(@test_note)
    assert_response :success
  end

  test "should update test_note" do
    patch test_note_url(@test_note), params: { test_note: { note: @test_note.note } }
    assert_redirected_to test_note_url(@test_note)
  end

  test "should destroy test_note" do
    assert_difference('TestNote.count', -1) do
      delete test_note_url(@test_note)
    end

    assert_redirected_to test_notes_url
  end
end
