require "application_system_test_case"

class SecuritiesTest < ApplicationSystemTestCase
  setup do
    @security = securities(:one)
  end

  test "visiting the index" do
    visit securities_url
    assert_selector "h1", text: "Securities"
  end

  test "should create security" do
    visit securities_url
    click_on "New security"

    fill_in "Color", with: @security.color
    fill_in "Description", with: @security.description
    fill_in "Exchange", with: @security.exchange_id
    fill_in "Legal name", with: @security.legal_name
    fill_in "Links", with: @security.links
    fill_in "Name", with: @security.name
    fill_in "Symbol", with: @security.symbol
    click_on "Create Security"

    assert_text "Security was successfully created"
    click_on "Back"
  end

  test "should update Security" do
    visit security_url(@security)
    click_on "Edit this security", match: :first

    fill_in "Color", with: @security.color
    fill_in "Description", with: @security.description
    fill_in "Exchange", with: @security.exchange_id
    fill_in "Legal name", with: @security.legal_name
    fill_in "Links", with: @security.links
    fill_in "Name", with: @security.name
    fill_in "Symbol", with: @security.symbol
    click_on "Update Security"

    assert_text "Security was successfully updated"
    click_on "Back"
  end

  test "should destroy Security" do
    visit security_url(@security)
    click_on "Destroy this security", match: :first

    assert_text "Security was successfully destroyed"
  end
end
