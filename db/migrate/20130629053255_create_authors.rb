class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|

      t.integer :book_id
      t.string  :author_name

      t.timestamps
    end
  end
end
