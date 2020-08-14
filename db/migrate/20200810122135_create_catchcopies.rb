class CreateCatchcopies < ActiveRecord::Migration[6.0]
  def change
    create_table :catchcopies do |t|
      t.integer :book_id, index: true, foreign_key: true
      t.string :content

      t.timestamps
    end
    add_index :catchcopies, [:book_id, :created_at]
  end
end
