class ConfirmationsController < Devise::ConfirmationsController
  def new
    super
  end

  def create
    super
  end

  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])

    # if resource.errors.empty?
    #   set_flash_message(:notice, :confirmed) if is_navigational_format?
    #   sign_in(resource_name, resource)
    #   respond_with_navigational(resource){ redirect_to root_path }
    # else
    #   respond_with_navigational(resource.errors, :status => :unprocessable_entity){ render_with_scope :new }
    # end
    if resource.errors.empty?
      set_flash_message(:notice, :confirmed) if is_flashing_format?
      respond_with_navigational(resource){ redirect_to after_confirmation_path_for(resource_name) }
    else
      respond_with_navigational(resource.errors, status: :unprocessable_entity){ render :new }
    end
  end

  protected
    # The path used after confirmation.
  def after_confirmation_path_for(resource_name)
    if signed_in?(resource_name)
      signed_in_root_path('/')
    else
      new_session_path(resource_name)
    end
  end
end
