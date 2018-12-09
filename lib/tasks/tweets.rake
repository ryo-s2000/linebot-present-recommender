namespace :tweets do
  desc 'To crawl EthNews Website'

  task :search => :environment do

        require 'twitter'
        require 'pry'

        client = Twitter::REST::Client.new do |config|
          config.consumer_key         = "SQYuV0tQs780OXjhjw6qoKq5L"
          config.consumer_secret      = "X1Q1opkBPoM1lH9pODDwbfn0Mx9KNDG12hq4WAqFcICt0XMPDD"
          config.access_token    = '1059743685712068608-hLaGwZ7DDBb7jmMsZBqUz3EFMrlonZ'
          config.access_token_secret = 'QJ37MkqjgYdErvnq5hVEV3LADg4xj5V0SwbSHNr5DZzjo'
        end
# binding.pry
    $user_timeline = client.user_timeline($twitter_id).map(&:text)
    # binding.pry
    File.open("./doc.json", "w") do |f|
      f.puts($user_timeline)
    end

    end

end
