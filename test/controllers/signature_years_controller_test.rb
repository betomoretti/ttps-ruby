require 'test_helper'

class SignatureYearsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @signature_year = signature_years(:one)
  end

  test "should get index" do
    get signature_years_url
    assert_response :success
  end

  test "should get new" do
    get new_signature_year_url
    assert_response :success
  end

  test "should create signature_year" do
    assert_difference('SignatureYear.count') do
      post signature_years_url, params: { signature_year: { year: @signature_year.year } }
    end

    assert_redirected_to signature_year_url(SignatureYear.last)
  end

  test "should show signature_year" do
    get signature_year_url(@signature_year)
    assert_response :success
  end

  test "should get edit" do
    get edit_signature_year_url(@signature_year)
    assert_response :success
  end

  test "should update signature_year" do
    patch signature_year_url(@signature_year), params: { signature_year: { year: @signature_year.year } }
    assert_redirected_to signature_year_url(@signature_year)
  end

  test "should destroy signature_year" do
    assert_difference('SignatureYear.count', -1) do
      delete signature_year_url(@signature_year)
    end

    assert_redirected_to signature_years_url
  end
end
