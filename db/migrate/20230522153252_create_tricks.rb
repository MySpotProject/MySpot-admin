class CreateTricks < ActiveRecord::Migration[7.0]
  def change
    create_table :tricks do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
