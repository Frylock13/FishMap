class PagesController < ApplicationController

  def show
    @page = Page.unscoped.find_by(slug: params[:slug])
  end
end
