class CreateImServices < ActiveRecord::Migration
  def change
    create_table :im_services do |t|
      t.string :name

      t.timestamps
    end
  end
end
