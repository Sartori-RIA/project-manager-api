class AddCollunsToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :progress, :decimal, default: 0.0
    add_column :projects, :delayed, :boolean, default: false
    add_column :projects, :finished, :boolean, default: false
  end
end
