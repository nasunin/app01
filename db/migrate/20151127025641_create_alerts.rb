class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.string :usercd          , null: false # ユーザーコード
      t.string :eventcd         , null: false # イベントコード
      t.string :alertusercd     , null: false # ユーザーコード
      t.integer :alertbranchnum , null: false # ユーザーコード枝番
      t.string :eventcd         , null: false # イベントコード

      t.timestamps
    end

    add_index :alerts, :usercd, :alertusercd, :alertbranchnum, unique: true
  end
end
