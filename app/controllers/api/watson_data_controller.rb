require 'rake'

class Api::WatsonDataController < ApplicationController
  def index
    $twitter_id = params[:id]
    Rails.application.load_tasks
    Rake::Task['tweets:search'].execute
    Rake::Task['watson-api-for-bot:get_data'].execute
    Rake::Task['tweets:search'].clear
    @watson_data = { "data":$translated_text }
    Rake::Task['watson-api-for-bot:get_data'].clear

    render 'index', formats: 'json', handlers: 'jbuilder'
  end
end
