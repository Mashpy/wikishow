class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.string :name
      t.datetime :dateborn
      t.timestamps
    end
  end
end
