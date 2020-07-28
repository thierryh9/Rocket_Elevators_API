module RailsAdmin
  module Config
    module Actions
      class Dashboard < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)
	
	require "ibm_watson/authenticators"
	require "ibm_watson/text_to_speech_v1"
	include IBMWatson
        register_instance_option :root? do
          true
        end

        register_instance_option :breadcrumb_parent do
          nil
        end

        register_instance_option :controller do
          proc do

		authenticator = Authenticators::IamAuthenticator.new(
		apikey: "JNMLSpZIi2rt81EClYqg0iYFOcCDurtJA7N2Z5EcnnLx"
		)
		
		text_to_speech = IBMWatson::TextToSpeechV1.new(
  authenticator: authenticator
)
		text_to_speech.service_url = "https://api.us-south.text-to-speech.watson.cloud.ibm.com/instances/27d6b4ce-149e-4509-9b0e-79278c9338da"

File.open("app/assets/audios/audio.mp3", "wb") do |audio_file|
  response = text_to_speech.synthesize(
    text: "Hello world!",
    accept: "audio/mp3",
    voice: "en-US_AllisonVoice"
  ).result
  audio_file.write(response)
end
		
            #You can specify flash messages
            flash.now[:danger] = "Some type of danger message here."

            #After you're done processing everything, render the new dashboard
            render @action.template_name, status: 200
          end
        end

        register_instance_option :route_fragment do
          ''
        end

        register_instance_option :link_icon do
          'icon-home'
        end

        register_instance_option :statistics? do
          true
        end
      end
    end
  end
end