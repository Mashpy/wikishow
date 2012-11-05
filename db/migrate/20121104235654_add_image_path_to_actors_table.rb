class AddImagePathToActorsTable < ActiveRecord::Migration
  def change
  	add_column :actors, :image_path, :string
  end
end
