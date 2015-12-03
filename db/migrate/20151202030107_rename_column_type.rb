class RenameColumnType < ActiveRecord::Migration
  def change
  	remove_column(:events, :type)
  	add_column(:events,    :typeno, :integer )
  end
end
