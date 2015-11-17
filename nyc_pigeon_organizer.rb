def nyc_pigeon_organizer(data)
  
  sorted_pigeons = {}
  
  data.each do |attrb, qualities|
    qualities.each do |quality, pigeons|
      pigeons.each do |pigeon|
        if sorted_pigeons.has_key?(pigeon) == false
          sorted_pigeons[pigeon] = { color: [], gender: [], lives: [] }
          sorted_pigeons[pigeon][attrb] << quality.to_s
        else
          sorted_pigeons[pigeon][attrb] << quality.to_s
        end
      end
    end
  end

  sorted_pigeons
  
end