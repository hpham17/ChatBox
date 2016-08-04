class AddTagToRecords < ActiveRecord::Migration
  def change
    add_column :records, :tag, :string
  end
end
