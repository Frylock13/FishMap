class PageRouter
  def self.load
    Fishmap::Application.routes.draw do
      Page.active.each do |page|
        get "/#{page.slug}", :to => "pages#show", defaults: { slug: page.slug }
      end
    end
  end

  def self.reload
    Fishmap::Application.routes_reloader.reload!
  end
end