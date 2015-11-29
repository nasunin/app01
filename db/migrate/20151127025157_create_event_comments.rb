class CreateEventComments < ActiveRecord::Migration
  def change
    create_table :event_comments do |t|
      t.string :eventcd     , null: false                 # イベントコード
      t.integer :seq        , null: false                 # コメント連番
      t.string :comment                                   # コメント
      t.string :usercd      , null: false                 # ユーザーコード
      t.integer :branchnum  , null: false                 # ユーザーコード枝番
      t.boolean :f_delete   , null: false, default: false # 削除フラグ

      t.timestamps
    end
    add_index :event_comments, [:eventcd, :seq], unique: true
  end
end
