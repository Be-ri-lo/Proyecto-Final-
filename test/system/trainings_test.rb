require "application_system_test_case"

class TrainingsTest < ApplicationSystemTestCase
  setup do
    @training = trainings(:one)
  end

  test "visiting the index" do
    visit trainings_url
    assert_selector "h1", text: "Trainings"
  end

  test "creating a Training" do
    visit trainings_url
    click_on "New Training"

    check "Active" if @training.active
    fill_in "Date", with: @training.date
    fill_in "Level", with: @training.level
    fill_in "Name", with: @training.name
    fill_in "Place", with: @training.place_id
    fill_in "Sport", with: @training.sport
    fill_in "User", with: @training.user_id
    click_on "Create Training"

    assert_text "Training was successfully created"
    click_on "Back"
  end

  test "updating a Training" do
    visit trainings_url
    click_on "Edit", match: :first

    check "Active" if @training.active
    fill_in "Date", with: @training.date
    fill_in "Level", with: @training.level
    fill_in "Name", with: @training.name
    fill_in "Place", with: @training.place_id
    fill_in "Sport", with: @training.sport
    fill_in "User", with: @training.user_id
    click_on "Update Training"

    assert_text "Training was successfully updated"
    click_on "Back"
  end

  test "destroying a Training" do
    visit trainings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Training was successfully destroyed"
  end
end
