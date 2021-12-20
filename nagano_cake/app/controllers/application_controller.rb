class ApplicationController < ActionController::Base
    

    def after_sign_in_path_for(resource)
      if current_customer
        flash[:notice] = "ログインに成功しました"
        customer_homes_top_path  # 好きなパスにしてください（まだ画像が投稿されてないのでtopページが表示できないです）
      else
        flash[:notice] = "新規登録完了しました。次に名前を入力してください"
        customer_homes_top_path # 好きなパスにしてください（まだ画像が投稿されてないのでtopページが表示できないです）
      end
    end

end
