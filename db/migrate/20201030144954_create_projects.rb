class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :projects, :deleted_at
  end
end
