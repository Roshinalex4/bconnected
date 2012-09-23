class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :company_name
      t.string :company_website
      t.integer :industry_id
      t.string :title
      t.string :location
      t.string :from_month
      t.string :to_month
      t.integer :from_year
      t.integer :to_year
      t.boolean :currently_work
      t.text :description

      t.timestamps
    end
  end
end
