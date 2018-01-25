require 'test_helper'

class TestTest < ActiveSupport::TestCase
  test "shouldn't allow save test without signature year" do
    test = Test.new(note_to_approve: 7)

    assert_not test.save
  end

  test "should allow save test with signature year" do
    test = Test.new(signature_year: signature_years(:one), note_to_approve: 7)

    assert test.save
  end
end
