require "application_system_test_case"

class GamelistsTest < ApplicationSystemTestCase
  setup do
    @gamelist = gamelists(:one)
  end

  test "visiting the index" do
    visit gamelists_url
    assert_selector "h1", text: "Gamelists"
  end

  test "creating a Gamelist" do
    visit gamelists_url
    click_on "New Gamelist"

    click_on "Create Gamelist"

    assert_text "Gamelist was successfully created"
    click_on "Back"
  end

  test "updating a Gamelist" do
    visit gamelists_url
    click_on "Edit", match: :first

    click_on "Update Gamelist"

    assert_text "Gamelist was successfully updated"
    click_on "Back"
  end

  test "destroying a Gamelist" do
    visit gamelists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Gamelist was successfully destroyed"
  end
end
