def generate_city
  City.all.shuffle.first
end