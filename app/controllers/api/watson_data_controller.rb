require 'rake'

class Api::WatsonDataController < ApplicationController
  def index
    $twitter_id = params[:id]
    # :idから受け取ったTwitterID
    Rails.application.load_tasks
    Rake::Task['tweets:search'].execute
    # Twitterからデータをとってくるraketask
    # /lib/tasks/tweets.rb
    Rake::Task['watson-api-for-bot:get_data'].execute
    # Watsonにデータを入れるraketask
    # /lib/tasks/watson.rb
    Rake::Task['tweets:search'].clear
    # /views/api/watson_data へ@watson_dataを送る
    # $translated_textは Rake::Task['tweets:search'].execute でとってきたTwitterのデータです。
    @watson_data = { "data":$translated_text }
    Rake::Task['watson-api-for-bot:get_data'].clear

    render 'index', formats: 'json', handlers: 'jbuilder'
  end
end
