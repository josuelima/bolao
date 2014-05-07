require Rails.root.join('lib', 'rails_admin_rank_updater.rb')

RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do |controller|
    unless current_user.try(:admin?)
      flash[:error] = "You are not an admin"
      redirect_to main_app.root_path
    end
  end

  config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  # Register the rank updater
  module RailsAdmin
    module Config
      module Actions
        class RankUpdater < RailsAdmin::Config::Actions::Base
          RailsAdmin::Config::Actions.register(self)
        end
      end
    end
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new

    rank_updater
    
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end

  # Its not fair to the admin to see other user guesses =p
  config.excluded_models << 'Guess'

  config.model 'Match' do
    field :id
    field :datetime
    field :group
    field :team_a
    field :goals_a
    field :team_b
    field :goals_b
  end

  config.model 'User' do
    list do
      field :id
      field :position
      field :score
      field :name
      field :email
      field :admin
    end
  end
end