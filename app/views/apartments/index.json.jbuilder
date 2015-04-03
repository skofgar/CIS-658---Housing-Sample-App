json.array!(@apartments) do |apartment|
  json.extract! apartment, :id, :apartment_number, :room_number, :number_of_rooms, :max_people, :is_furnished
  json.url apartment_url(apartment, format: :json)
end
