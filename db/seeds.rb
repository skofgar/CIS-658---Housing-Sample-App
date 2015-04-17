# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


ApartmentAssignment.delete_all
Apartment.delete_all
User.delete_all


User.create(id: 1, firstname: "Roland", lastname: "H", email: "heusserr@example.edu", password: "12345678", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 10, current_sign_in_at: "2015-04-16 04:34:57", last_sign_in_at: "2015-04-16 03:18:02", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", created_at: "2015-04-10 04:12:53", updated_at: "2015-04-16 04:41:18", admin: true)
User.create(id: 2, firstname: "Sam", lastname: "Fisher", email: "fisher@example.edu", password: "12345678", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 10, current_sign_in_at: "2015-04-16 04:34:57", last_sign_in_at: "2015-04-16 03:18:02", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", created_at: "2015-04-10 04:12:53", updated_at: "2015-04-16 04:41:18", admin: false)
User.create(id: 3, firstname: "John", lastname: "Smith", email: "smith@example.edu", password: "12345678", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 10, current_sign_in_at: "2015-04-16 04:34:57", last_sign_in_at: "2015-04-16 03:18:02", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", created_at: "2015-04-10 04:12:53", updated_at: "2015-04-16 04:41:18", admin: false)

Apartment.create(id: 1, apartment_number: "Winter Hall, 32", room_number: "123", number_of_rooms: "1", max_people: "1", is_furnished: true, created_at: "2015-04-10 05:04:21", updated_at: "2015-04-16 03:38:57", thumbnail: "https://www.gvsu.edu/cms4/asset/C7BF326A-0990-A17D-F66456C52989A6FA/winter_hall_1_bedroom[1410789936000].png")
Apartment.create(id: 2, apartment_number: "Winter Hall, 32", room_number: "314", number_of_rooms: "3", max_people: "2", is_furnished: true, created_at: "2015-04-15 20:23:08", updated_at: "2015-04-16 03:28:45", thumbnail: "https://www.gvsu.edu/cms4/asset/C7BF326A-0990-A17D-F66456C52989A6FA/winter_hall_2_bedroom[1410789936000].png")
Apartment.create(id: 3, apartment_number: "Winter Hall, 32", room_number: "242", number_of_rooms: "3", max_people: "2", is_furnished: true, created_at: "2015-04-16 00:55:38", updated_at: "2015-04-16 00:55:38", thumbnail: "https://www.gvsu.edu/cms4/asset/C7BF326A-0990-A17D-F66456C52989A6FA/winter_hall_2_bedroom[1410789936000].png")
Apartment.create(id: 4, apartment_number: "Winter Hall, 32", room_number: "411", number_of_rooms: "1", max_people: "1", is_furnished: true, created_at: "2015-04-16 04:14:25", updated_at: "2015-04-16 04:14:25", thumbnail: "https://www.gvsu.edu/cms4/asset/C7BF326A-0990-A17D-F66456C52989A6FA/winter_hall_1_bedroom[1410789936000].png")
Apartment.create(id: 5, apartment_number: "Secchia", room_number: "342", number_of_rooms: "2", max_people: "1", is_furnished: false, created_at: "2015-04-16 04:21:37", updated_at: "2015-04-16 04:21:37", thumbnail: "https://www.gvsu.edu/cms4/asset/C7BF326A-0990-A17D-F66456C52989A6FA/secchia_1_bedroom[1410789936000].png")
Apartment.create(id: 6, apartment_number: "Secchia", room_number: "345", number_of_rooms: "4", max_people: "3", is_furnished: false, created_at: "2015-04-16 04:21:37", updated_at: "2015-04-16 04:21:37", thumbnail: "https://www.gvsu.edu/cms4/asset/C7BF326A-0990-A17D-F66456C52989A6FA/secchia_3_bedroom[1410789936000].png")


ApartmentAssignment.create(id: 1, bedroom: "A", assignment_date: "2015-04-12", created_at: "2015-04-12 19:34:32", updated_at: "2015-04-12 19:34:32", user_id: 1, apartment_id: 2)
ApartmentAssignment.create(id: 2, bedroom: "A", assignment_date: "2015-04-12", created_at: "2015-04-16 03:17:44", updated_at: "2015-04-16 03:17:44", user_id: 2, apartment_id: 3)
ApartmentAssignment.create(id: 3, bedroom: "B", assignment_date: "2015-04-12", created_at: "2015-04-16 03:17:44", updated_at: "2015-04-16 03:17:44", user_id: 3, apartment_id: 3)
ApartmentAssignment.create(id: 4, bedroom: "A", assignment_date: "2015-04-12", created_at: "2015-04-16 03:17:44", updated_at: "2015-04-16 03:17:44", user_id: 2, apartment_id: 6)
ApartmentAssignment.create(id: 5, bedroom: "A", assignment_date: "2015-04-12", created_at: "2015-04-16 03:17:44", updated_at: "2015-04-16 03:17:44", user_id: 2, apartment_id: 4)
ApartmentAssignment.create(id: 6, bedroom: "B", assignment_date: "2015-04-12", created_at: "2015-04-16 03:17:44", updated_at: "2015-04-16 03:17:44", user_id: 3, apartment_id: 6)
