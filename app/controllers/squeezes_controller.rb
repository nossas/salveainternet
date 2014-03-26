class SqueezesController < InheritedResources::Base
  before_filter only: [:create] { params[:squeeze][:ip] = request.remote_ip }

  def create
    squeeze = Squeeze.find_by_email(params[:squeeze][:email])

    if squeeze.nil?
      squeeze = Squeeze.create(squeeze_params)
    end

    SqueezeMailer.delay.dont_let_them_limit_our_access_to_the_internet(squeeze)
    SqueezeMailer.delay.you_cant_negotiate_the_neutrality_of_the_internet(squeeze)
    redirect_to root_path(anchor: "share")
  end

  def squeeze_params
    params.require(:squeeze).permit(:first_name, :last_name, :email, :ip)
  end
end
