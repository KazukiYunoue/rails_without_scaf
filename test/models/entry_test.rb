class EntryTest < ActiveSupport::TestCase
  setup do
    @entry = entries(:one)
  end

  test 'valid entry' do
    assert @entry.valid?
  end

  test 'invalid without title' do
    @entry.title = ''
    assert_not @entry.valid?
  end

  test 'title should less than 140' do
    @entry.title = '0123456789' * 15
    assert_not @entry.valid?
  end
end