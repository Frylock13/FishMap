class PagesController < ApplicationController

  def show
    @page = Page.find_by(slug: params[:page])
  end
end
