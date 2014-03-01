class AddCrappers < ActiveRecord::Migration
  def change
    create_table :crappers do |t|
      t.string :city
      t.string :division
      t.string :address
      t.string :name
    end
  end
end
