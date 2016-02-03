require 'pry'

pigeon_data = {
  :color => {
    :purple => ["Theo", "Peter Jr.", "Lucky"],
    :grey => ["Theo", "Peter Jr.", "Ms. K"],
    :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
    :brown => ["Queenie", "Alex"]
  },
  :gender => {
    :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
    :female => ["Queenie", "Ms. K"]
  },
  :lives => {
    "Subway" => ["Theo", "Queenie"],
    "Central Park" => ["Alex", "Ms. K", "Lucky"],
    "Library" => ["Peter Jr."],
    "City Hall" => ["Andrew"]
  }
}

def empty_pigeon_hash(pigeon_data)
  names = pigeon_data[:gender].values.flatten
  pigeons = names.each_with_object({}) { |name, hash| hash[name] = { color: [], gender: [], lives: [] } }
end

def nyc_pigeon_organizer(pigeon_data)
  sorted_pigeons = empty_pigeon_hash(pigeon_data)

  # iterate into lowest level of unsorted pigeon data: pigeon names
  pigeon_data.each do |category, options|
    options.each do |option, pigeons|
      pigeons.each { |pigeon| sorted_pigeons[pigeon][category] << option.to_s }
    end
  end

  sorted_pigeons
end

  # sorted_pigeons = {}
  #
  # data.each do |attrb, qualities|
  #   qualities.each do |quality, pigeons|
  #     pigeons.each do |pigeon|
  #       if sorted_pigeons.has_key?(pigeon) == false
  #         sorted_pigeons[pigeon] = { color: [], gender: [], lives: [] }
  #         sorted_pigeons[pigeon][attrb] << quality.to_s
  #       else
  #         sorted_pigeons[pigeon][attrb] << quality.to_s
  #       end
  #     end
  #   end
  # end
  #
  # sorted_pigeons
