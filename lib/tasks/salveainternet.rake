namespace :salveainternet do
  task :renew_tokens => :environment do
    Authorization.all.each do |authorization|
      authorization.delay.renew_token!
    end
  end

  task :share => :environment do
    Authorization.where("facebook_post_id IS NULL").all.each do |authorization|
      puts authorization.email
      begin
        authorization.share
      rescue Exception => e
        puts e.message
      end
    end
  end
end
