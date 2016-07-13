namespace :locations do
  desc "TODO"
  task regions_seed: :environment do
    Region.delete_all
    Country.ids.sort.each do |country_id|
      seed(country_id, 0)
    end
  end

  private

  def seed(country_id, per_page)
    country = Country.find(country_id)
    service = Api::Vk::Regions::ListGetService.new(country_id, per_page)
    regions = service.call

    unless regions.empty?
      regions.each do |region|
        Region.create!(id: region.id, country_id: country_id, name: region.title)
        puts "#{region.title} | Done!".light_blue
      end

      seed(country_id, per_page + 100)
      sleep 10
    else
      puts "All regions of #{country.name} seeded!".green
    end
  end
end
