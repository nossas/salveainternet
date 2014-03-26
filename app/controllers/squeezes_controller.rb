class SqueezesController < InheritedResources::Base
  before_filter only: [:create] { params[:squeeze][:ip] = request.remote_ip }

  def create
    create! do
      resource.delay.send_mail
      redirect_to root_path(anchor: "share")
    end
  end

  def permitted_params
    {:squeeze => params.fetch(:squeeze, {}).permit(:first_name, :last_name, :email, :ip)}
  end
end
