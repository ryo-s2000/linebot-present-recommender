Rails.application.routes.draw do

  # ここでの指定で URL/api/watson_data/:id のリクエストを受けます
  # この:idはTwitterIDを受け取っています。

  namespace :api do
    namespace :watson_data do
      get '/:id', action: 'index'
    end
  end

  # この次は /controller/api/watson_data_controller.rb へ処理が移ります

end
