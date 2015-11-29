class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :usercd         , null: false                 # ユーザーコード
      t.string  :email_for_index, null: false                 # メールアドレスインデックス
      t.string  :email          , null: false                 # メールアドレス
      t.string  :password_digest                              # パスワード
      t.string  :remember_token                               # 
      t.string  :name           , null: false                 # 登録名
      t.string  :imageid                                      # イメージ写真
      t.boolean :f_address      , null: false, default: true  # 住所公開フラグ
      t.string  :prefecturecd   , null: false                 # 住所　都道府県コード
      t.string  :city                                         # 　　　　市区町村
      t.boolean :f_sex          , null: false, default: true  # 性別公開フラグ
      t.string  :sex            , null: false                 # 性別
      t.boolean :f_year         , null: false, default: true  # 生年公開フラグ
      t.boolean :f_birthday     , null: false, default: true  # 生年月日公開フラグ
      t.date    :birthday       , null: false                 # 生年月日
      t.string  :blood                                        # 血液型
      t.boolean :f_origin_place , null: false, default: true  # 出身地公開フラグ
      t.string  :origin_place                                 # 出身地
      t.boolean :f_hobby        , null: false, default: true  # 趣味公開フラグ
      t.string  :hobby1                                       # 趣味１
      t.string  :hobby2                                       # 趣味２
      t.string  :hobby3                                       # 趣味３
      t.string  :hobby4                                       # 趣味４
      t.string  :hobby5                                       # 趣味５
      t.boolean :f_occupation   , null: false, default: true  # 職業公開フラグ
      t.string  :occupation                                   # 職業
      t.boolean :f_genus        , null: false, default: true  # 所属公開フラグ
      t.string  :genus                                        # 所属
      t.string  :introduction                                 # 自己紹介
      t.boolean :admin          ,              default: false # 権限

      t.timestamps
    end

    add_index :users, :usercd, unique: true
    add_index :users, :email_for_index, unique: true
    add_index :users, :remember_token
  end
end
