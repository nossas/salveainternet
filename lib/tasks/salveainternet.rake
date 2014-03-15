namespace :salveainternet do
  task :renew_tokens => :environment do
    Authorization.where("? >= expires_at", Time.now + 1.day).each do |authorization|
      authorization.delay.renew_token!
    end
  end
end
