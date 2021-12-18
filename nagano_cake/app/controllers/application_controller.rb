class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
      if current_customer
        flash[:notice] = "ログインに成功しました"
        customer_homes_top_path  # 好きなパスにしてください（まだ画像が投稿されてないのでtopページが表示できないです）
      else
        flash[:notice] = "新規登録完了しました。次に名前を入力してください"
        customer_homes_top_path # 好きなパスにしてください（まだ画像が投稿されてないのでtopページが表示できないです）
      end
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name])
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:kana_first_name])
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:kana_last_name])
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:address])
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:postcode])
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:phone_number])
    end
end
