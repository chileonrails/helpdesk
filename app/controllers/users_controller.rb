class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create, :activate]
  before_filter :require_user, :only => [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save_without_session_maintenance
      @user.reset_perishable_token!
      Notifier.deliver_activation_instructions(@user)
      flash[:notice] = "Your account has been created. Please check your e-mail for your account activation instructions!."
      redirect_to login_url
    else
      render :action => :new
    end
  end

  def show
    @user = @current_user
  end

  def edit
    @user = @current_user
  end

  def update
    @user = @current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to root_url
    else
      render :action => :edit
    end
  end

  def activate
    @user = User.find_using_perishable_token(params[:activation_code], 1.week)

    if @user.activate!
      Notifier.deliver_activation_confirmation(@user)
      flash[:notice] = "Your account has been activated."
      redirect_to root_url
    else
      render :new
    end
  end

end

