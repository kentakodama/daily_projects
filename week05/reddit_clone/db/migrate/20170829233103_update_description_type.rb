class UpdateDescriptionType < ActiveRecord::Migration[5.1]
  def change
    remove_column :subs, :description
    add_column :subs, :description, :string 
  end
end
