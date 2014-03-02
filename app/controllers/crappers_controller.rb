class CrappersController < ApplicationController
  # before_action :set_crapper, only: [:show, :edit, :update, :destroy]
  def index
    @crappers = Crapper.all
    render :json => @crappers.to_json
  end
  
  def show
  end

  def new
    @crapper = Crapper.new
  end

  def edit
  end
  
  def create
    @crapper = Crapper.new(create_params)
    if @crapper.save
      redirect_to @crapper
    else
      render action: 'new'
    end
  end
  
  def update
    if @crapper.update(update_params)
      redirect_to @crapper
    else
      render action: 'edit'
    end
  end

  def destroy
    @crapper.destroy
    respond_to do |format|
      format.html { redirect_to crapper_url }
      format.json { head :no_content }
    end
  end
  

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crapper
      @crapper = Crapper.find(params[:id])
    end
    
    def update_params
      params.require(:crapper).permit(:city, :division, :address, :name)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def create_params
      params.require(:crapper).permit(:city, :division, :address, :name)
    end
end
