# README

全体的な処理の流れ

①[present-line-bot](https://github.com/ryo-s2000/present-line-bot)からリクエストを受ける [/config/routes.rb](https://github.com/ryo-s2000/linebot-present-recommender/blob/master/config/routes.rb)
②controllerにてrakeタスクを実行し必要なデータを取得す [/app/controllers/api/watson_data_controller.rb](https://github.com/ryo-s2000/linebot-present-recommender/blob/master/app/controllers/api/watson_data_controller.rb)
③データを返す [/app/views/api/watson_data/index.json.jbuilder](https://github.com/ryo-s2000/linebot-present-recommender/blob/master/app/views/api/watson_data/index.json.jbuilder)
