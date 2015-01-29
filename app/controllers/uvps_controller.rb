class UvpsController < ApplicationController
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

private

  def uvp_params
    params.require(:uvp).permit(:title, :preface)
  end


end