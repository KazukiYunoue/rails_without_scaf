require 'application_system_test_case'

class CommentsTest < ApplicationSystemTestCase
  # TODO: it might not be best solution to solve system test error
  # if without include sentence, it will be happened:
  # NoMethodError: undefined method `assert_emails'
  include ActionMailer::TestHelper

  setup do
    @entry = entries(:one)
    @comment = comments(:one)
  end

  test 'visiting the index' do
    visit entry_url(@entry)
    assert_selector 'h3', text: 'Comments'
    assert_no_text 'MyComment'
  end

  test 'creating a Comment' do
    visit entry_url(@entry)
    fill_in 'comment_body', with: @comment.body
    click_on 'Save'

    assert_text 'Comment was successfully created'
  end

  test 'sending email to ask approval' do
    visit entry_url(@entry)
    fill_in 'comment_body', with: @comment.body

    assert_emails 1 do
      click_on 'Save'
    end
  end

  test 'destroying a Comment' do
    visit entry_url(@entry)
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end
  end

  test 'approving a Comment' do
    visit entry_url(@entry)
    assert_no_text 'MyComment'

    click_on 'Approve', match: :first

    assert_text 'Comment was successfully approved'
    assert_text 'MyComment'
  end
end