namespace :countries do
  desc "TODO"
  task seed: :environment do
    City.delete_all
    Region.delete_all
    Country.delete_all
    countries_seed(0)
  end

  def countries_seed(per_page)
    countries = Api::Vk::Countries::ListGetService.new(per_page).call

    unless countries.empty?
      countries.each do |country|
        Country.create!(id: country.cid, name: country.title)
        puts "#{country.title} | Done!".light_blue
      end

      countries_seed(per_page + 100)
    else
      puts "All countries seeded!".green
    end
  end
end
