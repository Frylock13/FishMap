namespace :cities do
  desc "TODO"
  task seed: :environment do
    City.delete_all
    Country.all.each do |country|
      country.regions.each do |region|
        cities_seed(country.id, country.name, region.id, region.name, 0)
      end
    end
  end

  private

  def cities_seed(country_id, country_name, region_id, region_name, per_page)
    cities = Api::Vk::Cities::ListGetService.new(country_id, region_id, per_page).call

    unless cities.empty?
      cities.each do |city|
        City.create!(id: city.cid, country_id: country_id, region_id: region_id, name: city.title)
        puts "#{city.title} | Done!".light_blue
      end

      cities_seed(country_id, country_name, region_id, region_name, per_page + 100)
      sleep 10
    else
      puts "All cities of #{region_name} of #{country_name} seeded!".green
    end
  end
end
