class ChangeFlgNullfalseNt < ActiveRecord::Migration
  def change
  	change_column(:derived_usesrs, :f_address, :boolean, default: true )
  	change_column(:derived_usesrs, :f_sex, :boolean, default: true )
  	change_column(:derived_usesrs, :f_year, :boolean, default: true )
  	change_column(:derived_usesrs, :f_birthday, :boolean, default: true )
  	change_column(:derived_usesrs, :f_origin_place, :boolean, default: true )
  	change_column(:derived_usesrs, :f_hobby, :boolean, default: true )
  	change_column(:derived_usesrs, :f_occupation, :boolean, default: true )
  	change_column(:derived_usesrs, :f_genus, :boolean, default: true )
  	change_column(:derived_usesrs, :f_delete, :boolean, default: false )
  	change_column(:event_avatars, :f_delete, :boolean, default: false )
  	change_column(:event_comments, :f_delete, :boolean, default: false )
  	change_column(:users, :f_address, :boolean, default: true )
  	change_column(:users, :f_sex, :boolean, default: true )
  	change_column(:users, :f_year, :boolean, default: true )
  	change_column(:users, :f_birthday, :boolean, default: true )
  	change_column(:users, :f_origin_place, :boolean, default: true )
  	change_column(:users, :f_hobby, :boolean, default: true )
  	change_column(:users, :f_occupation, :boolean, default: true )
  	change_column(:users, :f_genus, :boolean, default: true )
  end
end
