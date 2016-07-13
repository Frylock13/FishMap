namespace :regions do
  desc "TODO"
  task seed: :environment do
    Region.delete_all
    City.delete_all
    Country.all.each do |country|
      regions_seed(country.id, country.name, 0)
    end
  end

  private

  def regions_seed(country_id, country_name, per_page)
    regions = Api::Vk::Regions::ListGetService.new(country_id, per_page).call

    unless regions.empty?
      regions.each do |region|
        Region.create!(id: region.region_id, country_id: country_id, name: region.title)
        puts "#{region.title}".light_blue
        sleep 0.05
      end

      regions_seed(country_id, country_name, per_page + 100)
      sleep 3
    else
      puts "All regions of #{country_name} seeded!".green
    end
  end
end
