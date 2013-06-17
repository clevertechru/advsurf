Rails.application.config.middleware.use OmniAuth::Builder do
  #show setting in initializers/devise.rb
  #provider :developer unless Rails.env.production?
  #provider :twitter, ENV['OMNIAUTH_PROVIDER_KEY'], ENV['OMNIAUTH_PROVIDER_SECRET']
  #provider :github, "5af25f65807caa9aac50", "d8eb8ce114a34dc113554efcdaf000b0f2f8079e"
  #provider :vkontakte, ENV['API_KEY'], ENV['API_SECRET']
end
OmniAuth.config.logger = Rails.logger