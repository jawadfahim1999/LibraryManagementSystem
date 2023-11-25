class AddEmailToPatrons < ActiveRecord::Migration[7.0]
  def change
    add_column :patrons, :email, :string
  end
end
