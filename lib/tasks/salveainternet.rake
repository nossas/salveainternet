namespace :salveainternet do
  task :renew_tokens => :environment do
    Authorization.where("? >= expires_at", Time.now + 1.day).each do |authorization|
      authorization.delay.renew_token!
    end
  end

  task :share => :environment do
    Authorization.all.each do |authorization|
      puts authorization.inspect
      begin
        authorization.share
      rescue Exception => e
        puts e.message
      end
    end
  end
end
