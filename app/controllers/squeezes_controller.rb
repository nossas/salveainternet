class SqueezesController < InheritedResources::Base
  before_filter only: [:create] { params[:squeeze][:ip] = request.remote_ip }

  def create
    begin
      SqueezeMailer.delay.dont_let_them_limit_our_access_to_the_internet(@squeeze)
      SqueezeMailer.delay.you_cant_negotiate_the_neutrality_of_the_internet(@squeeze)
    rescue Exception => e
      Rails.logger.error e
    end

    create! do |success, failure|
      success.html { redirect_to root_path(anchor: "share") }
      failure.html { redirect_to root_path(anchor: "share") }
    end
  end

  def permitted_params
    {:squeeze => params.fetch(:squeeze, {}).permit(:first_name, :last_name, :email, :ip)}
  end
end
