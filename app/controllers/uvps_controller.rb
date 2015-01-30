class UvpsController < ApplicationController

  def index
    @uvps = Uvp.order("created_at DESC")
  end

  def show
    @user = current_user
    @uvp = Uvp.find(params[:id])
  end

  def new
    @uvp = Uvp.new
  end

  def create
    @uvp = current_user.uvps.build(uvp_params)
    if @uvp.save
      flash[:success] = "Unterrichtsverlaufsplan 
                            erfolgreich erstellt!"
      redirect_to current_user
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

private

  def uvp_params
    params.require(:uvp).permit(:uvp_id, :title, :preface)
  end


end