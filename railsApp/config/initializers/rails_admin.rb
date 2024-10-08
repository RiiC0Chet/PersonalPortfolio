RailsAdmin.config do |config|
  config.asset_source = :importmap

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/railsadminteam/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  config.authorize_with do
    redirect_to main_app.root_path unless current_user.email == 'jlricoramos@gmail.com'
  end
  
  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
  config.model 'Project' do
    list do
      field :title
      field :description
      field :technologies do
        formatted_value do
          value.join(', ') if value.present?
        end
      end
      field :features do
        formatted_value do
          value.join(', ') if value.present?
        end
      end
      field :github
      field :user
      field :experience
      field :avatar
    end

    edit do
      field :title
      field :description
      field :technologies, :serialized do
        help 'Array of technologies (comma separated)'
      end
      field :features, :serialized do
        help 'Array of features (comma separated)'
      end
      field :github
      field :avatar
      field :user
      field :experience
    end

    show do
      field :title
      field :description
      field :technologies do
        formatted_value do
          value.join(', ') if value.present?
        end
      end
      field :features do
        formatted_value do
          value.join(', ') if value.present?
        end
      end
      field :github
      field :avatar
      field :user
      field :experience
    end
  end

end
