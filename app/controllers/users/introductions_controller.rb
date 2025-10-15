class Users::IntroductionsController < Users::ApplicationController
  def show
  end

  def edit
  end

  def update
    if current_user.update(user_introduction_params)
      redirect_to users_introduction_path, notice: '自己紹介を更新しました'
    else
      render :edit, status: :unprocessable_content, alert: '自己紹介の更新に失敗しました'
    end
  end

  private

  def user_introduction_params
    params.expect(user: %i[name introduction])
  end
end
