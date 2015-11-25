class SessionsController < ApplicationController
  # メニューのサインインから呼ばれる(routes.rb）
  def new
  end

  # /sessionsへのPOSTリクエストはcreateアクションに送られます
  # createアクションでフォーム送信を受け取り、Sessions.newを使用して新しいセッションオブジェクトを作成し、セッションを保存
  def create
  	user = User.find_by(email: params[:email].downcase)
    # パスワードと一致することを確認（has_secure_passwordがauthenticateメソッドを提供）
  	if user && user.authenticate(params[:password])
      # セッションヘルパーのサインインメソッド
  		sign_in user
      # セッションヘルパーのフレンドリーフォワーディングを実装したメソッド
  		redirect_back_or user
  	else
  		flash.now[:error] = 'Invalid email/password combination'
  		render 'new'
  	end
  end

  # メニューのサインアウトから呼ばれる(routes.rb）
  def destroy
  	sign_out
  	redirect_to root_url
  end
end
