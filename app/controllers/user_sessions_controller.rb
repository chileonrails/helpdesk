class UserSessionsController < ApplicationController
  before_filter :load_user_using_perishable_token, :only => [:change_password, :update_password]

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Successfully logged in."
      redirect_back_or_default root_url
    else
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "Successfully logged out."
    redirect_back_or_default login_url
  end

  def reset_password
    @user = User.find_by_email(params[:email])
    if @user
      @user.deliver_password_reset_instructions!
      flash[:notice] = "Instructions to reset your password have been emailed to you. Please check your email."
      redirect_to login_url
    else
      flash[:notice] = "No user was found with that email address."
      render :action => :forgot_password
    end
  end

  def change_password
  end

  def update_password
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      flash[:notice] = "Password successfully updated."
      redirect_to root_url
    else
      render :action => :edit_password
    end
  end

  private

  def load_user_using_perishable_token
    @user = User.find_using_perishable_token(params[:change_code])
    unless @user
      flash[:notice] = "We're sorry, but we could not locate your account. " +
        "If you are having issues try copying and pasting the URL " +
        "from your email into your browser or restarting the " +
        "reset password process."
      redirect_to root_url
    end
  end

end

