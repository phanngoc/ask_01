class Admin::UsersController < AdminController

  def index
    @users = Kaminari.paginate_array(User.order("created_at desc"))
      .page(params[:page]).per(Settings.admin.per_page);
  end

  def edit
    @user = User.find_by id: params[:id]
    unless @user
      flash[:danger] = t "flash.admin.user.not_found"
      redirect_to admin_topics_path
    end
  end

  def update
    @user = User.find_by slug: params[:id]
    unless @user
      flash[:danger] = t "flash.admin.user.not_found"
      redirect_to admin_topics_path
    end
    if @user.update_attributes user_params
      flash[:success] = t "flash.admin.user.update.success"
      redirect_to admin_users_path
    else
      flash[:danger] = t "flash.admin.user.update.failed"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :story, :avatar, :role
  end

end
