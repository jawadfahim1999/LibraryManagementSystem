class CreateCheckouts < ActiveRecord::Migration[7.0]
  def change
    create_table :checkouts do |t|
      t.references :book, null: false, foreign_key: true
      t.references :patron, null: false, foreign_key: true
      t.datetime :checked_out_at
      t.datetime :due_date
      t.datetime :returned_at

      t.timestamps
    end
  end
end
