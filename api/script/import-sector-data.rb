require 'json'

dir_name = "script/sectors"

def get_safe_feature_name(feature)
    name = feature['properties']['Name']
    return name.gsub("\n", "").gsub("-sector", "")
end

def is_sector(feature)
    return feature['properties']['Name'] =~ /[a-z][0-9]-sector/ || feature['geometry']['type'] == 'Polygon'
end

def create_sector(sector)
    sector_name = get_safe_feature_name(sector)

    if sector.empty?
        puts 'sector not found'
        return 
    elsif Sector.find_by(name:sector_name).present?
        puts 'sector already exists'
        return
    else Sector.create(
            name: sector_name,
            coordinates: sector['geometry']['coordinates'],
            geojson_string: sector.to_s)
            puts 'sector created, starting plant loop'
    end
end



Dir.children(dir_name).each do |file_name|
    failed = []
    cultivar_names_to_add = []

    puts 'READING SECTOR FILE', file_name

    # FIRST: create the sector, if it doesn't exist
    data = JSON.parse(File.read(File.join(dir_name, file_name)))
    sector = data['features'].select {|feature| is_sector(feature)}[0]
    
    create_sector(sector)

    sector_name = get_safe_feature_name(sector)
  
    # SECOND: create plant entries for each plant in the sector
    data['features'].each do |feature| 

        puts 'PROCESSING FEATURE', feature['properties']['Name']

        # skip if the feature is a sector
        puts "Feature is a sector, skipping"
        next if is_sector(feature)

        plant_name = get_safe_feature_name(feature)

        cultivar = Cultivar.where("name ILIKE ?", "%#{plant_name}%").first
        sector_id = Sector.find_by(name: sector_name).id


        if cultivar.nil?
            puts "Cultivar not found for #{plant_name} -- creating entry in PlantFailures table"
            
            if PlantFailure.find_by(latitude: feature['geometry']['coordinates'][1], longitude: feature['geometry']['coordinates'][0]).present?
              puts "PLANTFAILURE ALREADY EXISTS, SKIPPING #{plant_name}"
              next 
            end

            PlantFailure.create(
                name: plant_name,
                longitude: feature['geometry']['coordinates'][0],
                latitude: feature['geometry']['coordinates'][1],
                sector_id: sector_id
            )    
            next 
        end 

        cultivar_id = cultivar.id

        # if the plant already exists (same lat and long), skip it
        if Plant.find_by(latitude: feature['geometry']['coordinates'][1], longitude: feature['geometry']['coordinates'][0]).present?
           puts "PLANT ALREADY EXISTS, SKIPPING #{plant_name}"
           next 
        end

        puts "Creating plant #{plant_name}"

        Plant.create(
            cultivar_id: cultivar_id,
            latitude: feature['geometry']['coordinates'][1],
            longitude: feature['geometry']['coordinates'][0],
            sector_id: sector_id
        )
    end
end

