class CreateQualifications < ActiveRecord::Migration
  def change
    create_table :qualifications do |t|
      t.string :name
      t.string :specialisation
      t.integer :from_year
      t.integer :to_year
      t.string :institution

      t.timestamps
    end
  end
end
