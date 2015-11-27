class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :eventcd       , null: false # イベントコード
      t.string :subject                     # 件名
      t.string :description                 # イベント説明
      t.date :limit_date      , null: false # 期限
      t.integer :type         , null: false # 種別
      t.string :key1                        # キーワード１
      t.string :key2                        # キーワード２
      t.string :key3                        # キーワード３
      t.string :key4                        # キーワード４
      t.string :key5                        # キーワード５
      t.string :usercd        , null: false # 管理ユーザコード
      t.integer :branchnum    , null: false # 管理ユーザコード枝番
      t.string :imageid                     # イメージ写真
      t.date :public_date     , null: false # 公開日時
      t.date :end_date        , null: false # 終了日時
      t.string :prefecturecd                # 都道府県コード

      t.timestamps
    end

    add_index :events, :eventcd, unique: true
  end
end
