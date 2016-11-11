class ChangeDescriptionTypeInDoses < ActiveRecord::Migration[5.0]
  def change
    change_column :doses, :description, :string
  end
end
