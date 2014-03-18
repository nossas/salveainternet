namespace :salveainternet do
  task :renew_tokens => :environment do
    Authorization.where("? >= expires_at", Time.now + 1.day).each do |authorization|
      authorization.delay.renew_token!
    end
  end

  task :share do
    Authorization.all.each do |authorization|
      puts authorization.inspect
      authorization.delay.share
    end
  end
end
