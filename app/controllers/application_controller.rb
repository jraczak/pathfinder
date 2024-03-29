class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def facebook_sign_in_and_redirect(resource_or_scope, *args)
    options  = args.extract_options!
    scope    = Devise::Mapping.find_scope!(resource_or_scope)
    resource = args.last || resource_or_scope
    sign_in(scope, resource, options)
    redirect_to confirmation_url(resource, :confirmation_token => resource.confirmation_token)
  end
  
end
