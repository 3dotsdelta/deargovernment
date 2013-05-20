class CreateConcerns < ActiveRecord::Migration
  def change
    create_table :concerns do |t|
      t.string :name
      t.text :description
      t.string :reference_code
      t.string :location
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
