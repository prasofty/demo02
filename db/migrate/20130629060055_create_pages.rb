class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :book_id
      t.integer :page_no
      t.string  :page_info

      t.timestamps
    end
  end
end
