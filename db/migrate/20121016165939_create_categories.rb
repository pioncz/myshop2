class CreateCategories < ActiveRecord::Migration
  def up
    create_table :categories do |t|
      t.string :name
    end
  end
    add_column :products, :category, :string
  def down
  	remove_column :products, :category
    drop_table :categories
  end
end