class AddInventoriesToItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :inventory, foreign_key: true
  end
end
