class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.string :status
      t.references :entry

      t.timestamps
    end
  end
end
