RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)
  config.authorize_with do
    #if !Customer.find_by(user_id:current_user.id).nil?
	 if current_user.admin == true
      #to slow, problem of security
      ActiveRecord::Base.descendants.each do |imodel|
        config.model "#{imodel.name}" do
          visible true
        end
      end
	  
      config.model "Dwhlead" do
        visible true
      end
      config.model "Dwhcustomer" do
        visible true
      end
      config.model "Dwhquote" do
        visible true
      end
      else
      ActiveRecord::Base.descendants.each do |imodel|
        config.model "#{imodel.name}" do
          visible false
        end
      end
      config.model "Dwhlead" do
        visible true
      end
      config.model "Dwhcustomer" do
        visible true
      end
      config.model "Dwhquote" do
        visible true
      end
    end
    redirect_to main_app.root_path unless current_user.admin == true || !Customer.find_by(user_id:current_user.id).nil?
  end
  config.main_app_name = ["Rocket Elevator", "BackOffice"]
  # or something more dynamic
  config.main_app_name = Proc.new { |controller| [ "Rocket Elevator", "BackOffice - #{controller.params[:action].try(:titleize)}" ] }
  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true


#config.excluded_models= ['Dwhquote','Dwhcustomer','Dwhlead']



  config.current_user_method(&:current_user)
  config.actions do
    dashboard  do
    except ['Dwhquote','Dwhcustomer','Dwhlead']
  end                    # mandatory
    index                         # mandatory
    new do
    except ['Dwhquote','Dwhcustomer','Dwhlead']
  end
    export do
    except ['Dwhquote','Dwhcustomer','Dwhlead']
  end
    bulk_delete
    show
    edit do
    except ['Dwhquote','Dwhcustomer','Dwhlead']
  end
    delete do
    except ['Dwhquote','Dwhcustomer','Dwhlead']
  end
    show_in_app do
    except ['Dwhquote','Dwhcustomer','Dwhlead']
  end
	charts
    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
