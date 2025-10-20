class Users::ApplicationController < ApplicationController
  before_action :authenticate_user!

  private

  def authenticate_user!
    unless signed_in?
      redirect_to sign_in_path, alert: 'ログインしてください'
    end
  end
end
