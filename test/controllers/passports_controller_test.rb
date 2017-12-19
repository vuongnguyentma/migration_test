require 'test_helper'

class PassportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @passport = passports(:one)
  end

  test "should get index" do
    get passports_url
    assert_response :success
  end

  test "should get new" do
    get new_passport_url
    assert_response :success
  end

  test "should create passport" do
    assert_difference('Passport.count') do
      post passports_url, params: { passport: { dob: @passport.dob, email: @passport.email, name: @passport.name, passport: @passport.passport } }
    end

    assert_redirected_to passport_url(Passport.last)
  end

  test "should show passport" do
    get passport_url(@passport)
    assert_response :success
  end

  test "should get edit" do
    get edit_passport_url(@passport)
    assert_response :success
  end

  test "should update passport" do
    patch passport_url(@passport), params: { passport: { dob: @passport.dob, email: @passport.email, name: @passport.name, passport: @passport.passport } }
    assert_redirected_to passport_url(@passport)
  end

  test "should destroy passport" do
    assert_difference('Passport.count', -1) do
      delete passport_url(@passport)
    end

    assert_redirected_to passports_url
  end
end
