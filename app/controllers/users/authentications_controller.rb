class Users::AuthenticationsController < Users::ApplicationController
  def edit
  end

  def update
    if current_user.update(user_authentication_params)
      redirect_to root_path, notice: 'ログイン情報を更新しました'
    else
      render :edit, status: :unprocessable_content, alert: 'ログイン情報の更新に失敗しました'
    end
  end

  private

  def user_authentication_params
    params.expect(user: %i[email current_password password password_confirmation])
  end
end
