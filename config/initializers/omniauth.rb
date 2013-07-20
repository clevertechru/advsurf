Rails.application.config.middleware.use OmniAuth::Builder do
  #show setting in initializers/devise.rb
  #provider :developer unless Rails.env.production?
  #provider :twitter, ENV['API_TWITTER_KEY'], ENV['API_TWITTER_SECRET']
  #provider :github, ENV['API_GITHUB_KEY'], ENV['API_GITHUB_SECRET']
  #provider :vkontakte, ENV['API_VK_KEY'], ENV['API_VK_SECRET']
end
OmniAuth.config.logger = Rails.logger