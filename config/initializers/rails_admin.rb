RailsAdmin.config do |config|

  config.main_app_name = ['COURSE SELECTION SYSTEM', "Control Panel"]

  config.included_models = ['Student', 'Teacher', 'Course', 'Department']

  ### Popular gems integration

  config.model 'Student' do
    list do
      exclude_fields :password_digest, :reset_digest, :reset_sent_at,
                     :remember_digest, :email_activation_digest, :email_activated, :email_activated_at,
                     :created_at, :updated_at, :courses, :select_relationships
      items_per_page 50
    end

  end

  config.model 'Teacher' do
    list do
      exclude_fields :password_digest, :reset_digest, :reset_sent_at,
                     :remember_digest, :email_activation_digest, :email_activated, :email_activated_at,
                     :created_at, :updated_at, :teach_relationships, :courses
    end
  end

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

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
end
