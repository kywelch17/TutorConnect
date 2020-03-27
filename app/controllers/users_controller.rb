class UsersController < ApplicationController

  def create
      user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to "/pre_dashboard#{user_params[:is_tutor]}"
    else
      flash[:register_errors] = @current_user.errors.full_messages
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :is_tutor)
    end
end