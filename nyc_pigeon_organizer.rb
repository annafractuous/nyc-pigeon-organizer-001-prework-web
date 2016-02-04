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

def names(pigeon_data)
  names = pigeon_data.fetch(:gender).values.flatten
end

def properties(pigeon_data)
  pigeon_data.keys
end

def initial_structure(pigeon_names)
  pigeons = pigeon_names.each_with_object({}) { |name, hash| hash[name] = { color: [], gender: [], lives: [] } }
end

def populate(initial_structure, names, data)
  names.each_with_object(initial_structure) do |name, initial_structure|
    properties(data).each do |property|
      initial_structure[name][property] = find_pigeon_value(name, data, property).compact
    end
  end
end

def find_pigeon_value(name, data, value)
  data.fetch(value).collect { |characteristic, pigeons| characteristic.to_s if pigeons.include?(name) }
end

def nyc_pigeon_organizer(pigeon_data)
  names = names(pigeon_data)
  empty_hash = initial_structure(names)
  sorted_pigeons = populate(empty_hash, names, pigeon_data)
end

# REHASHED TAKE 1
# def nyc_pigeon_organizer(pigeon_data)
#   pigeon_names = names(pigeon_data)
#   sorted_pigeons = initial_structure(pigeon_names)
#
#   # iterate into lowest level of unsorted pigeon data: pigeon names
#   pigeon_data.each do |category, options|
#     options.each do |option, pigeons|
#       pigeons.each { |pigeon| sorted_pigeons[pigeon][category] << option.to_s }
#     end
#   end
#
#   sorted_pigeons
# end

# ORIGINAL ANSWER
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
