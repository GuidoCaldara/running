class UsersController < ApplicationController

  def complete_profile
    @user = current_user
  end

  def save_user_profile
    @user = current_user
    @user.username = params[:user][:username]
    @user.location = params[:user][:location]
    if @user.save
      redirect_to races_path
      flash[:success] = "Il tuo profilo è completo! Da questo momento puoi aggiungere gare, scrivere recensioni e condividere le tue fotografie!"
    end

  end
  def user_dashboard
    @user = current_user
  end
end
