class SqueezesController < InheritedResources::Base
  def permitted_params
    {:squeeze => params.fetch(:squeeze, {}).permit(:first_name, :last_name, :email)}
  end
end
