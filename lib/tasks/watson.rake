namespace :'watson-api-for-bot' do
  desc 'To crawl EthNews Website'

  task :get_data => :environment do
    require "json"
    require "ibm_watson/discovery_v1"
    include IBMWatson

    discovery = DiscoveryV1.new(
        version: "2018-12-03",
        iam_apikey: "asUu1QyWQblBH0J8XdJp04Mrh92Y_wnfbSUlRKuJQ1Bj",
        url: "https://gateway-tok.watsonplatform.net/discovery/api"
    )

    # tweets.rake taskにて作ったjsonファイルを読み込む
    File.open("./doc.json") do |file_info|
      add_doc = discovery.add_document(
          environment_id: "09e0c203-3118-4197-867f-c9b97bd21eaa",
          collection_id: "8292cff9-1469-4038-a4fd-cfe55a1b37b3",
          file: file_info
      )

      $translated_text = JSON.pretty_generate(add_doc.result)

    end
  end
end
