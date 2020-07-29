# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
	return unless user && (user.admin == true || !Customer.find_by(user_id:user.id).nil?|| !Employee.find_by(user_id:user.id).nil?)
	if user.admin == true
		can :manage, :all
	elsif !Employee.find_by(user_id:user.id).nil?
		can :access, :rails_admin
		can :read, :dashboard  
		can :index, Dwhquote
		can :charts, Dwhquote
		can :index, Dwhlead
		can :charts, Dwhlead
		can :index, Dwhcustomer
		can :charts, Dwhcustomer
		can :manage, User,["id = ?", user.id] do |user|
        user.present?
		end
		can :manage, Employee,["id = ?", Employee.find_by(user_id:user.id).id] do |user|
        user.present?
		end
		can :manage, Battery,["employee_id = ?", Employee.find_by(user_id:user.id).id] do |user|
			user.present?
		end
		can :manage, Column,["battery_id = ?", Battery.find_by(employee_id: Employee.find_by(user_id:user.id).id).id] do |user|
			user.present?
		end
		can :manage, Elevator,["column_id = ?", Column.find_by(battery_id: Battery.find_by(employee_id: Employee.find_by(user_id:user.id).id).id).id] do |user|
			user.present?
		end
		can :read, Type
		can :read, Category
	else
		can :access, :rails_admin
		can :read, :dashboard  
		can :index, Dwhquote
		can :charts, Dwhquote
		can :index, Dwhlead
		can :charts, Dwhlead
		can :index, Dwhcustomer
		can :charts, Dwhcustomer
		can :manage, User,["id = ?", user.id] do |user|
        user.present?
		end
		can :read, Customer,["id = ?", Customer.find_by(user_id:user.id).id] do |user|
        user.present?
		end
		can :manage, Address,["id = ?", Customer.find_by(user_id:user.id).address] do |user|
        user.present?
		end
		can :read, Building,["customer_id = ?", Customer.find_by(user_id:user.id).id] do |user|
        user.present?
		end
		can :read, BuildingDetail,["building_id = ?", Customer.find_by(user_id:user.id).building.ids] do |user|
        user.present?
		end
		can :read, Battery,["building_id = ?", Customer.find_by(user_id:user.id).building.ids] do |user|
        user.present?
		end
		can :read, Type
	end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
	
	
  end
end
