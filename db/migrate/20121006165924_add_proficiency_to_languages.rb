class AddProficiencyToLanguages < ActiveRecord::Migration
  def change
    add_column :languages, :proficiency, :integer
  end
end
