class ChangeBirthdayDatatype < ActiveRecord::Migration
  def change
  	change_column(:users, :birthday, :date)
  	change_column(:derived_usesrs, :birthday, :date)
  end
end
