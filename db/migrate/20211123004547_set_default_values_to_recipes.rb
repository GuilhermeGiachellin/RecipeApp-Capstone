class SetDefaultValuesToRecipes < ActiveRecord::Migration[6.1]
  def change
    change_column :recipes, :preparation_time, :float, default: 0
    change_column :recipes, :cooking_time, :float, default: 0
    change_column :recipes, :public, :boolean, default: false
  end
end
