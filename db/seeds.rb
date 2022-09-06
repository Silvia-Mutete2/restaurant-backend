puts "🌱 Seeding spices..."

10.times do 
    Guest.create(
        username: Faker::Kpop.girl_groups,
        password: Faker::Kpop.solo,
        name: Faker::Name.name 
    )
end 

images =["https://images.pexels.com/photos/262978/pexels-photo-262978.jpeg?auto=compress&cs=tinysrgb&w=400",
    "https://images.pexels.com/photos/67468/pexels-photo-67468.jpeg?auto=compress&cs=tinysrgb&w=400",
    "https://images.pexels.com/photos/941861/pexels-photo-941861.jpeg?auto=compress&cs=tinysrgb&w=400",
    "https://images.pexels.com/photos/262047/pexels-photo-262047.jpeg?auto=compress&cs=tinysrgb&w=400",
    "https://images.pexels.com/photos/1267320/pexels-photo-1267320.jpeg?auto=compress&cs=tinysrgb&w=400",
    "https://images.pexels.com/photos/1115251/pexels-photo-1115251.jpeg?auto=compress&cs=tinysrgb&w=400",
    "https://images.pexels.com/photos/1579739/pexels-photo-1579739.jpeg?auto=compress&cs=tinysrgb&w=400",
    "https://images.pexels.com/photos/1307698/pexels-photo-1307698.jpeg?auto=compress&cs=tinysrgb&w=400",
    "https://images.pexels.com/photos/1698439/pexels-photo-1698439.jpeg?auto=compress&cs=tinysrgb&w=400",
    "https://images.pexels.com/photos/239975/pexels-photo-239975.jpeg?auto=compress&cs=tinysrgb&w=400",
    "https://images.pexels.com/photos/460537/pexels-photo-460537.jpeg?auto=compress&cs=tinysrgb&w=400"


]


10.times do 
    Restaurant.create(
        username: Faker::Kpop.boy_bands,
        password: Faker::Kpop.solo,
        restaurant_name: Faker::Restaurant.name,
        cuisine_type: Faker::Restaurant.type,
        image_url: images[rand(0..19)],
        capacity: rand(10..50)
    )
end 


times = ["11:00", "11:30", "12:00", "12:30","1:00", "1:30", "2:00", "2:30", "3:00", "3:30", "4:00", "4:30", "5:00", "5:30", "6:00", "6:30", "7:00", "7:30", "8:00", "8:30", "9:00", "9:30"]

50.times do 
    Reservation.create(
        date: Faker::Date.between(from: '2022-08-21', to: '2023-09-21'),
        time: times[rand(0..21)],
        number_of_guests: rand(2..12),
        restaurant_id: rand(1..10),
        guest_id: rand(1..10)
    )
end 

puts "🌱 Done seeding!"