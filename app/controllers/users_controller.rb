class UsersController < ApplicationController
 
  def show # 追加
   @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user # ここを修正
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if current_user.update(user_params)
      redirect_to edit_user_path , notice: 'プロフィールを編集しました'
    else
      render 'edit'
    end
  end

  private



  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation,:place)
  end
end