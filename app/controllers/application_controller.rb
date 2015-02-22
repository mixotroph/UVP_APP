class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  include SessionsHelper

  def update_content(id, column, data)
    @uvp = Uvp.find(id)
    @uvp.update({  column => data})
    flash[:success] = "Erfolg!"
  end

  def update_row_content(id, column, data, cke_id)
    temp = id.to_i - cke_id.to_i
    @uvp_row = UvpRow.find(temp)
    @uvp_row.update({  column => data})
    flash[:success] = "Erfolg!"
  end

end
