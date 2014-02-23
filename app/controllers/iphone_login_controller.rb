class IphoneLoginController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      # Sign in
      sign_in(@user) #helper
      render :json => @user.to_json
    else
      flash.now[:warning] = "Invalid email/password combination"
      render :text => "Login faild"
      # render :json => @user.to_json
    end    
    # @edition = User.find(params[:id])
  end

  def destroy
    sign_out
    redirect_to root_path    
  end
end
