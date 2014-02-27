class SqueezesController < InheritedResources::Base
  def create
    create! do |success|
      success.html do
        session[:squeeze_id] = resource.id
        redirect_to root_path
      end
    end
  end

  def permitted_params
    {:squeeze => params.fetch(:squeeze, {}).permit(:first_name, :last_name, :email)}
  end
end
