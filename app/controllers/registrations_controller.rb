class RegistrationsController < Devise::RegistrationsController

  def after_sign_up_path_for(resource)
    if resource.provider == "facebook"
      '/users/confirmation?confirmation_token=#{confirmation_token}'
    else
      after_sign_in_path_for(resource)
    end
  end

end