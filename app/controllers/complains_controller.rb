class ComplainsController < ApplicationController

  def create
    Complain.create(complainable_id: params[:id], complainable_type: params[:type])
    flash[:success] = 'Жалоба отправлена'
    redirect_to :back
  end
end
