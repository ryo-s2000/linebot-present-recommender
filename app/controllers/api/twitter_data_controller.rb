require 'rake'

class Api::TwitterDataController < ApplicationController
  def index
    $twitter_id = params[:id]
    Rails.application.load_tasks
    Rake::Task['twitter:get_data'].execute
    @twitter_data = { "data":$user_timeline }
    Rake::Task['twitter:get_data'].clear

    render 'index', formats: 'json', handlers: 'jbuilder'
  end
end
