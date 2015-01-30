class UvpsController < ApplicationController

  before_action :signed_in_user, only: [:index, :edit, :show, :update]
  before_action :correct_user,   only: [:show, :edit, :update]

  def index
    @uvps = Uvp.order("created_at DESC")
  end

  def show
    @uvp = Uvp.find(params[:id])
  end

  def new
    @uvp = Uvp.new
  end

  def create
    @uvp = current_user.uvps.build(uvp_params)
    @uvp.preface=""
    if @uvp.save
      flash[:success] = "Unterrichtsverlaufsplan 
                            erfolgreich erstellt!"
      redirect_to user_uvp_path(current_user, @uvp ) 
    else
      render 'user/show'
    end
  end

  def edit
    @uvp = Uvp.find(params[:id])
  end

  def update
    @uvp = Uvp.find(params[:id])
    if @uvp.update_attributes(article_params)
      redirect_to uvps_path, notice: "The uvp has been successfully updated."
    else
      render action: "edit"
    end
  end

  def update_inline_content
    @uvp = Uvp.find(uvp_params[:uvp_id])
    @uvp.preface = uvp_params[:preface]
    @uvp.save
    flash[:success] = "Erfolg!"

    # this is a post action, updates sent via ajax, no view rendered
    render nothing: true 
  end

  def destroy
    Uvp.find(params[:id]).destroy
    flash[:success, dismissible: true] = "Unterrichtsplan gelöscht."
    redirect_to users_url
  end

private

  def uvp_params
    params.require(:uvp).permit(:uvp_id, :title, :preface, :abstract)
  end

   def correct_user
      @user = User.find(params[:user_id]) 
      unless current_user?(@user)
        redirect_to root_url, notice: "Access denied!"
      end
    end


end