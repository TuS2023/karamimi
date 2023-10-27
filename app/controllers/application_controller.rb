class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_admin!, if: :admin_url
  protected
#デバイスでは初期設定でメールアドレスとパスワードしか許されていない。ここを編集することでユーザーネームなどを入れることができる。
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
  #/adminが含まれている全てのページは、adminでログインしないと見れない
    def admin_url
      request.fullpath.include?("/admin")
    end
end