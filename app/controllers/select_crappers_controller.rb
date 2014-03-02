class SelectCrappersController < ApplicationController
  def create
    # @crapper = Crapper.find_by_city(params[:city])
    @crappers = Crapper.find(:all, :conditions => {:city => [params[:city]],:division => [params[:division]]})
      render :json => @crappers.to_json
  end
end
