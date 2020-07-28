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
		employee = Employee.find_by(user_id: current_user.id)
File.open("app/assets/audios/audio.mp3", "wb") do |audio_file|
  response = text_to_speech.synthesize(
    text: "Hello #{employee.firstName} #{employee.lastName}. There are currently #{Elevator.count} elevators deployed in the #{Building.count} buildings of your #{Customer.count} customers.Currently, #{Elevator.where(status: 1).count} elevators are not in Running Status and are being serviced. You currently have #{Quote.where(open: 1).count} quotes awaiting processing.You currently have #{Lead.count} leads in your contact requests. #{Battery.count} Batteries are deployed across #{Address.pluck(:city).uniq.count} cities
",
    accept: "audio/mp3",
    voice: "en-US_AllisonVoice"
  ).result
  audio_file.write(response)
end
		
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