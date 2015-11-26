class AddUserIdToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :userId, :integer
  end
end
