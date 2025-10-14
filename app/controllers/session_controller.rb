class SessionController < ApplicationController
  before_action :redirect_if_signed_in, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: user_params[:email].downcase)
    if @user && @user.authenticate(user_params[:password])
      sign_in(@user)
      redirect_to root_path, notice: 'ログインしました'
    else
      @user = User.new(email: user_params[:email].downcase)
      render :new, status: :unprocessable_content
    end
  end

  def destroy
    sign_out if signed_in?
    redirect_to root_path, notice: 'ログアウトしました'
  end

  private

  def user_params
    params.expect(user: %i[email password])
  end

  def redirect_if_signed_in
    redirect_to root_path if signed_in?
  end
end
