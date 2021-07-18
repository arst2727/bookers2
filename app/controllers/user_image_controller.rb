class UserImageController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:success] = 'User Info was successfully updated.'
      # 詳細画面へリクエスト
      redirect_to user_path(@user.id)
    else # 更新失敗
      @user = User.find(params[:id])
      render :edit
    end
  end

  def destroy
  end
end
