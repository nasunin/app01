class CreateEventTypes < ActiveRecord::Migration
  def change
    create_table :event_types do |t|
      t.integer :seq		, null: false # 連番
      t.string :typenm								# 種別名

      t.timestamps
    end

    add_index :event_types, :seq, unique: true
  end
end
