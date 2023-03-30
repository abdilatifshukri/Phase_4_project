class CreateDirectors < ActiveRecord::Migration[7.0]
  def change
    create_table :directors do |t|
      t.string :name
      t.integer :age
      t.references :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
