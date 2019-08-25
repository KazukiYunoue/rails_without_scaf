class AddDefaultValueToStatusOfComment < ActiveRecord::Migration[6.0]
  def change
    change_column_default :comments, :status, 'unapproved'
  end
end
