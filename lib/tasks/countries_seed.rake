namespace :locations do
  desc "TODO"
  task countries_seed: :environment do
    Country.delete_all
    seed(0)
  end

  private

  def seed(per_page)
    service = Api::Vk::Countries::ListGetService.new(per_page)
    countries = service.call

    unless countries.empty?
      countries.each do |country|
        Country.create!(id: country.cid, name: country.title)
        puts "#{country.title} | Done!".light_blue
      end

      seed(per_page + 100)
    else
      puts "All countries seeded!".green
    end
  end
end
