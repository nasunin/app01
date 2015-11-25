module SessionsHelper
  def sign_in(user)
    # 1) トークンを新規作成する。
    remember_token = User.new_remember_token
    # 2) 暗号化されていないトークンをブラウザのcookiesに保存する。
    cookies.permanent[:remember_token] = remember_token
    # 3) 暗号化したトークンをデータベースに保存する。
    user.update_attribute(:remember_token, User.encrypt(remember_token))
    # 4) 与えられたユーザーを現在のユーザーに設定する
    self.current_user = user
  end

  #セッションに現在のユーザが設定されているかチェック
  def signed_in?
    !current_user.nil?
  end

  #指定したユーザをカレントユーザに設定
  def current_user=(user)
    @current_user = user
  end

  #クッキーを元にカレントユーザを取得設定
  def current_user
    #encryptはUserモデルで定義
    remember_token = User.encrypt(cookies[:remember_token])
    #@current_userが未定義の場合にのみ、@current_userインスタンス変数に記憶トークンを設定
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  #指定したユーザがカレントユーザかチェック
  def current_user?(user)
    user == current_user
  end

	def signed_in_user
		unless signed_in?     #サインインしてない場合
			store_location      #リクエストされたURLをセッションに保存
			redirect_to signin_url, notice: "Please sign in."
		end
	end

	def sign_out
		self.current_user = nil
		cookies.delete(:remember_token)
	end

  # :return_toセッションのURLが存在する場合はそこにリダイレクトし、ない場合はdefaultのURLにリダイレクト
  # :return_toセッションは削除
	def redirect_back_or(default)
		redirect_to(session[:return_to] || default)
		session.delete(:return_to)
	end

  #リクエストされたURLをセッションに保存
  def store_location
    session[:return_to] = request.url
  end
end
