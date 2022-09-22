# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create!(name: "Le Quoc Thinh",
email: "quocthinhbku@gmail.com",
password: "Quocthinh1511@", password_confirmation: "Quocthinh1511@",
admin: true,activated: true,
activated_at: Time.zone.now,
role: 2) 
# Generate a bunch of additional users.
5.times do |n|
name = "Others"
email = "example-#{n+1}@railstutorial.org"
password = "password"
role =0
User.create!(name: name,
email: email,
password: password,
password_confirmation: password)
end
users = User.order(:created_at).take(90)
5.times do 
content = "Hello everyone"
users.each { |user| user.microposts.create!(content: content) }
end
#Shop.create(name: "Thinh Book's", description:'Choose your favouritve books', avatar:'b19d60ebbc0a1e1d4531a576976abc8d.jpg', user_id: 1)
#Product.create(name: 'Ngồi khóc trên cây',quantity: 50, price: "5", author: "Nguyễn Nhật Ánh", description:"sách hay", 
#category_id: 4, image: 'sach-ngoi-khoc-tren-cay.gif', shop_id: 1) 
#Product.create(name: 'Tôi thấy hoa vàng trên cổ xanh ',quantity: 50, price: "4", author: "Nguyễn Nhật Ánh", description:"sách hay", 
#category_id: 4, image: 'toi-thay-hoa-vang-tren-co-xanh-4619-5701-1521549732_m_460x0.jpg', shop_id: 1) 
#Product.create(name: 'Mắt biếc',quantity: 45, price: "4", author: "Nguyễn Nhật Ánh", description:"sách hay", 
#category_id: 4, image: 'mac-biet-sach-nta.jpg', shop_id: 1) 
#Product.create(name: 'Con chim xanh biếc quay về',quantity: 45, price: "4", author: "Nguyễn Nhật Ánh", description:"sách hay", 
#category_id: 4, image: '55849445._SY475_.jpg', shop_id: 1) 
Category.create(name: 'Seft-help')
Category.create(name: 'Comic Book or Graphic Novel')
Category.create(name: 'Historical Fiction')
Category.create(name: 'Classics')
Category.create(name: 'Literary Fiction')
Category.create(name: 'Horror')
OrderStatus.create(name: 'In Progress')
OrderStatus.create(name: 'Placed' )
OrderStatus.create(name: 'Shipped')
OrderStatus.create(name: 'Cancelled')
