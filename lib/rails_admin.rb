module RailsAdmin
  module Config
    module Actions
      class Dashboard < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)
	
	require "ibm_watson/authenticators"
  require "ibm_watson/text_to_speech_v1"
  require "http"
	include IBMWatson
        register_instance_option :root? do
          true
        end

        register_instance_option :breadcrumb_parent do
          nil
        end

        register_instance_option :controller do
          proc do
		#if current_user.admin == true
			authenticator = Authenticators::IamAuthenticator.new(
				apikey: ENV['WATSON']
			)
		
			text_to_speech = IBMWatson::TextToSpeechV1.new(
				authenticator: authenticator
			)
			text_to_speech.service_url = ENV['WATSON_URL']
			employee = Employee.find_by(user_id: current_user.id)
			File.open("app/assets/audios/audio.mp3", "wb") do |audio_file|
				response = text_to_speech.synthesize(
					text: "Hello #{employee.firstName} #{employee.lastName}. There are currently #{Elevator.count} elevators deployed in the #{Building.count} buildings of your #{Customer.count} customers.Currently, #{Elevator.where(status: 1).count} elevators are not in Running Status and are being serviced, You currently have #{Quote.where(status: true).count} quotes awaiting processing, You currently have #{Lead.count} leads in your contact requests, #{Battery.count} Batteries are deployed across #{Address.pluck(:city).uniq.count} cities
					",
					accept: "audio/mp3",
					voice: "en-US_AllisonVoice"
				).result
			audio_file.write(response)
			end
			
			people = rand(1..60)
			c = rand(1..8)
			
			json = JSON.parse(HTTP.get("https://swapi.dev/api/people/#{people}/").body)
			phrase = ""
			case c
			when 1
				phrase = "#{json['name']} weighing #{json['mass ']} kilograms"
			when 2
				phrase = "#{json['name']} play in #{json['films'].count} films"
			when 3
				phrase = "#{json['name']} birth in #{json['birth_year']}"
			when 4
				phrase = "the eyes of #{json['name']} is #{json['eye_color']}"
			when 5
				phrase = "the gender of #{json['name']} is #{json['gender']}"
			when 6
				if json['vehicles'].count > 0
					vehicles = JSON.parse(HTTP.get(json['vehicles'][rand(json['vehicles'].count)]).body)
					phrase = "#{json['name']} drive #{vehicles['name']}"
				else
					phrase = "#{json['name']} never drive a vehicles"
				end
			when 7..8
				if json['starships'].count > 0
					starships = JSON.parse(HTTP.get(json['starships'][rand(json['starships'].count)]).body)
					if c ==7
					phrase = "#{json['name']} drive #{starships['name']}"
					else
						phrase = "the cost of #{starships['name']} is #{starships['cpst_in_credits']}"
					end
				else
					phrase = "#{json['name']} never drive a starships"
				end
			end
      
			File.open("app/assets/audios/star_wars.mp3", "wb") do |audio_file|
				response = text_to_speech.synthesize(
					text: phrase,
					accept: "audio/mp3",
					voice: "en-US_AllisonVoice"
				).result
			audio_file.write(response)
			end
		
			
		#end
		
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