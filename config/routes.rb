Rails.application.routes.draw do

  namespace :api do
    namespace :twitter_data do
      get '/:id', action: 'index'
    end

    namespace :watson_data do
      get '/:id', action: 'index'
    end
  end

end
