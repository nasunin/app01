class CreateEventAvatars < ActiveRecord::Migration
  def change
    create_table :event_avatars do |t|
      t.string :eventcd     , null: false                 # イベントコード
      t.string :usercd      , null: false                 # ユーザーコード
      t.integer :branchnum  , null: false                 # ユーザーコード枝番
      t.boolean :f_delete   , null: false, default: false # 削除フラグ

      t.timestamps
    end

    add_index :event_avatars, [:eventcd, :usercd], unique: true
  end
end
