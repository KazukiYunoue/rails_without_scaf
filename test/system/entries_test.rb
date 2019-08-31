require 'application_system_test_case'

class EntriesTest < ApplicationSystemTestCase
  setup do
    @blog = blogs(:one)
    @entry = entries(:one)
  end

  test 'visiting the index' do
    visit blogs_url
    click_on @blog.title, match: :first
    assert_selector 'h2', text: 'Listing entries'
  end

  test 'creating a Entry' do
    visit blog_entries_url(@blog)
    click_on 'New Entry'

    fill_in 'Body', with: @entry.body
    fill_in 'Title', with: @entry.title
    click_on 'Create Entry'

    assert_text 'Entry was successfully created'
    click_on 'Back'
  end

  test 'updating a Entry' do
    visit blog_entries_url(@blog)
    click_on "edit_entry_#{@entry.id}"

    fill_in 'Body', with: @entry.body
    fill_in 'Title', with: @entry.title
    click_on 'Update Entry'

    assert_text 'Entry was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Entry' do
    visit blog_entries_url(@blog)
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Entry was successfully destroyed'
  end
end