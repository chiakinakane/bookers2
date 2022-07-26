class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top, :about]#ログイン認証が成功していないとトップページ以外の画面（ログインと新規登録は除く）は表示できない仕様
  before_action :configure_permitted_parameters, if: :devise_controller?
  

  def after_sign_in_path_for(resource)
   user_path(current_user.id) #routes passを使う
  end
  
  def after_sign_out_path_for(resource)
    root_path#routes passを使う　これが名前付きルート？
  end
  
 
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
