class UsersController < ApplicationController
  
  before_action :signed_in_user, only: [:index, :edit, :update]
  before_action :correct_user,   only: [:show, :edit, :update]
  before_action :admin_user,     only: [:destroy]

  def index
    @users = User.paginate(page: params[:page],:per_page => 3)
  end

  def show
    @user = User.find(params[:id])
    @uvps = @user.uvps.paginate(page: params[:page], 
      :per_page => 3 )
    #@microposts = Micropost.rank(:swimming_order).all
    @microposts = @user.microposts.rank(:row_order)

  end

  def update_row_order

    @micropost = Micropost.find(micropost_params[:micropost_id])
    @micropost.row_order_position = micropost_params[:row_order_position]
    @micropost.save

    render nothing: true # this is a post action, updates sent via ajax, no view rendered
  end
  
  def new
  	@user = User.new
  end

   def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the UVP-Manager!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile aktualisiert"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :surname, :email, :password,
                                   :password_confirmation)
    end
    
    #def uvp_params
    #  params.require(:uvp).permit(:uvp_id, :title, :preface)
    #end


    # Before filters

    def correct_user
      @user = User.find(params[:id]) 
      unless current_user?(@user)
        redirect_to root_url, notice: "Access denied!"
      end
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
