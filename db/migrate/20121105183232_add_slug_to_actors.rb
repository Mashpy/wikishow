class AddSlugToActors < ActiveRecord::Migration
  def change
    add_column :actors, :slug, :string
    add_index :actors, :slug
  end
end
