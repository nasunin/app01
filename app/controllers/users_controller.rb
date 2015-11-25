class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  #すべてのユーザを表示　routesのusers_path
  def index
    #will_pagenateメソッド
    @users = User.paginate(page: params[:page])
  end

  #特定のユーザを表示　routesのuser_path(user)
  def show
    @user = User.find(params[:id])
  end

  #ユーザ登録　viewsあり
  def new
    #new.html.erbに対応する@user変数をコントローラのアクションで定義する必要あり
    #新しいユーザーを作成するので、単にUser.newとする
		@user = User.new
  end

  #ユーザを作成するアクション
  def create
    #Strong Parametersを使用してパラメータを渡す
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Sample App"
      redirect_to @user
    else
      render 'new'
    end
  end

  #ユーザ編集　viewsあり
  #before_action :signed_in_userでサインインチェックとサインインしてない場合のサインイン促す処理
  #編集するユーザはbefore_action :correct_userで指定してる
  def edit
  end

  #ユーザを更新するアクション
  #before_action :signed_in_userでサインインチェックとサインインしてない場合のサインイン促す処理
  #編集するユーザはbefore_action :correct_userで指定してる
  def update
    #update_attributesメソッドは属性のハッシュを受け取り、成功時には更新と保存を続けて同時に行う
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  #ユーザを削除するアクション
  #before_action :admin_userでアドミンチェック
  def destroy
    #idでユーザを取得し、削除も１行で行う
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  private
    def user_params
      params.require(:user).permit(:email_for_index, :email, :password, :password_confirmation,
      		:remember_token, :name, :imageid, :f_address, :prefecturecd, :city,
      		:f_sex, :sex, :f_year, :f_birthday, :birthday, :blood, :f_origin_place,
      		:origin_place, :f_hobby, :hobby1, :hobby2, :hobby3, :hobby4, :hobby5,
      		:f_occupation, :occupation, :f_genus, :genus, :introduction)
    end

    def correct_user
      #idを元にユーザインスタンスを取得
      @user = User.find(params[:id])
      #指定したユーザがカレントユーザかチェックし、違う場合はルートに移動
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      #たぶん、セッションヘルパーの「クッキーを元にカレントユーザを取得設定」しadmin項目をチェックする
      redirect_to(root_path) unless current_user.admin?
    end
end
