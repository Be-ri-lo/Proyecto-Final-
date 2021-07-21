require "application_system_test_case"

class RatedsTest < ApplicationSystemTestCase
  setup do
    @rated = rateds(:one)
  end

  test "visiting the index" do
    visit rateds_url
    assert_selector "h1", text: "Rateds"
  end

  test "creating a Rated" do
    visit rateds_url
    click_on "New Rated"

    click_on "Create Rated"

    assert_text "Rated was successfully created"
    click_on "Back"
  end

  test "updating a Rated" do
    visit rateds_url
    click_on "Edit", match: :first

    click_on "Update Rated"

    assert_text "Rated was successfully updated"
    click_on "Back"
  end

  test "destroying a Rated" do
    visit rateds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rated was successfully destroyed"
  end
end
