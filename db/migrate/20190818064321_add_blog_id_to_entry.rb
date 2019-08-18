class AddBlogIdToEntry < ActiveRecord::Migration[6.0]
  def change
    add_reference :entries, :blog
  end
end
