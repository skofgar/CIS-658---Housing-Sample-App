json.array!(@apartment_assignments) do |apartment_assignment|
  json.extract! apartment_assignment, :id, :bedroom, :assignment_date
  json.url apartment_assignment_url(apartment_assignment, format: :json)
end
