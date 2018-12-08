class Watson
  def get_data
    require "pry"
    require "ibm_watson"

    speech_to_text = IBMWatson::SpeechToTextV1.new(
        username: "privmikiya9812@gmail.com",
        password: "Login2525"
    )

    audio_file = File.open("./resources/mp3.mp3")
    future = speech_to_text.await.recognize(
        audio: audio_file
    )
    output = future.value
    p output
  end
end

Watson.new.get_data
