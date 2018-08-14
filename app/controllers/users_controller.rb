class UsersController < ApplicationController
  def show
   @user = User.find(params[:id])
   if @user.is_registrated_user_detail?
    redirect_to "/users/#{@user.id}/edit"
   end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(get_user_detail_params)
      redirect_to user_path
    else
      render root_url
    end
  end

  private

  def get_user_detail_params
    params.require(:user).permit(:first_name, :last_name, :nick_name, :age, :gender)
  end
end
