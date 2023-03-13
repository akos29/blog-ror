require "application_system_test_case"

class PostTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit posts_url

    assert_selector "h1", text: "Posts List"
  end

  test "creating a Post" do
    visit posts_url
    click_on "New Post"

    fill_in "Author", with: @post.author_id
    fill_in "Text", with: @post.text
    fill_in "Title", with: @post.title
    click_on "Create Post"

    assert_text "Post was successfully created"
    click_on "Back"
  end

  test "updating a Post" do
    visit posts_url
    click_on "Edit", match: :first

    fill_in "Author", with: @post.author_id
    fill_in "Text", with: @post.text
    fill_in "Title", with: @post.title
    click_on "Update Post"

    assert_text "Post was successfully updated"
    click_on "Back"
  end

  test "destroying a Post" do
    visit posts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Post was successfully destroyed"
  endn
end