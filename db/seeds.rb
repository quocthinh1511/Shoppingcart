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
role: 0) 
# Generate a bunch of additional users.
User.create!(name: "Quoc Thinh", email: "quocthinh@gmail.com",
password: "123456", password_confirmation: "123456",
activated: true,
activated_at: Time.zone.now,
role: 2) 
User.create!(name: "Quoc Thinh1",
email: "quocthinh1@gmail.com",
password: "123456", password_confirmation: "123456",
activated: true,
activated_at: Time.zone.now,
role: 2) 
User.create!(name: "Quoc Thinh1",
email: "quocthinh2@gmail.com",
password: "123456", password_confirmation: "123456",
activated: true,
activated_at: Time.zone.now,
role: 2) 
# shop
Category.create(name: 'Seft-help')
Category.create(name: 'Comic Book or Graphic Novel')
Category.create(name: 'Historical Fiction')
Category.create(name: ' Detective')
Category.create(name: 'Literary Fiction')
Category.create(name: 'Cook books')
# Shop
Shop.create(name: "Thinh Book's", description:'Choose your favouritve books', avatar:File.open(Rails.root.join('app', 'assets', 'images','img','avtimg', 'a.jpg')), user_id: 2)
Shop.create(name: "Nhã Nam", description:'Find good books', avatar:File.open(Rails.root.join('app', 'assets', 'images','img','avtimg', 'c4e7e5dac7a4c66e7e5922b7e116f920.png')), user_id: 3)
Shop.create(name: "Fahasa", description:'Find good books', avatar:File.open(Rails.root.join('app', 'assets', 'images','img','avtimg', 'ma-giam-gia-fahasa-cap-nhat-moi-nhat.jpg')), user_id: 4)
# Product for Literal Fiction
Product.create(name: 'Ngồi khóc trên cây',quantity: 50, price: "5", author: "Nguyễn Nhật Ánh", description:"sách hay", 
category_ids: [5], image: File.open(Rails.root.join('app','assets', 'images','img','bookimg', 'sach-ngoi-khoc-tren-cay.gif')), shop_id: 1) 
Product.create(name: 'Tôi thấy hoa vàng trên cổ xanh ',quantity: 50, price: "4", author: "Nguyễn Nhật Ánh", description:"sách hay", 
category_ids: [5], image: File.open(Rails.root.join('app','assets', 'images','img','bookimg', 'toi-thay-hoa-vang-tren-co-xanh-4619-5701-1521549732_m_460x0.jpg')), shop_id: 1) 
Product.create(name: 'Mắt biếc',quantity: 45, price: "4", author: "Nguyễn Nhật Ánh", description:"sách hay", 
category_ids: [5], image: File.open(Rails.root.join('app','assets', 'images','img','bookimg', 'mac-biet-sach-nta.jpg')), shop_id: 1) 
Product.create(name: 'Con chim xanh biếc quay về',quantity: 45, price: "4", author: "Nguyễn Nhật Ánh", description:"sách hay", 
category_ids: [5], image: File.open(Rails.root.join('app','assets', 'images','img','bookimg', '55849445._SY475_.jpg')), shop_id: 1) 
Product.create(name: 'Có hai con mèo ngồi bên cửa sổ',quantity: 45, price: "4", author: "Nguyễn Nhật Ánh", description:"sách hay", 
category_ids: [5], image: File.open(Rails.root.join('app','assets', 'images','img','bookimg', 'co-hai-con-meo-4908-1521549733.jpg')), shop_id: 1) 
#Seft-help 
Product.create(name: 'When breath becomes air',quantity: 45, price: "4", author: "Paul Kalanithi", description:"good book", 
category_ids: [1], image: File.open(Rails.root.join('app','assets', 'images','img','bookimg', 'images.png')), shop_id: 1) 
Product.create(name: 'Tuổi trẻ đáng giá bao nhiêu',quantity: 45, price: "4", author: "Roisie Nguyễn", description:"Nice book", 
category_ids: [1], image: File.open(Rails.root.join('app','assets', 'images','img','bookimg', 'tải xuống (3).jpg')), shop_id: 1) 
Product.create(name: 'Tôi tự học',quantity: 45, price: "4", author: "Nguyễn Duy Cần", description:"good book", 
category_ids: [1], image: File.open(Rails.root.join('app','assets', 'images','img','bookimg', 'tải xuống (2).jpg')), shop_id: 1) 
Product.create(name: 'Đọc sách hiệu quả',quantity: 45, price: "4", author: "Paul Kalanithi", description:"good book", 
category_ids: [1], image: File.open(Rails.root.join('app','assets', 'images','img','bookimg', '6e3b943526d8c504321ddc9a9969d136.jpg')), shop_id: 1) 
Product.create(name: 'Đắc nhân tâm',quantity: 45, price: "4", author: "Dale Carnegie", description:"good book", 
category_ids: [1], image: File.open(Rails.root.join('app','assets', 'images','img','bookimg', 'images.jpg')), shop_id: 1) 
#Comic Book or Graphic Novel
Product.create(name: 'Shin cậu bé bút chì',quantity: 45, price: "4", author: "Yoshito Usui", description:"good book", 
category_ids: [2], image: File.open(Rails.root.join('app','assets', 'images','img','bookimg', 'truyen-tranh-shin.jpg')), shop_id: 2) 
Product.create(name: 'Thám từng lừng danh Conan',quantity: 45, price: "4", author: "Gosho Aoyama", description:"good book", 
category_ids: [2], image: File.open(Rails.root.join('app','assets', 'images','img','bookimg', 'anh-dai-dien.jpg')), shop_id: 2) 
Product.create(name: 'Doraemon',quantity: 45, price: "4", author: "Fujiko Fujio", description:"good book", 
category_ids: [2], image: File.open(Rails.root.join('app','assets', 'images','img','bookimg', 'nhasachmienphi-truyen-tranh-doremon.jpg')), shop_id: 2) 
Product.create(name: 'Shin cậu bé bút chì',quantity: 45, price: "4", author: "Gocinny & Sempé", description:"good book", 
category_ids: [2], image: File.open(Rails.root.join('app','assets', 'images','img','bookimg', 'daa0a9bdbee8b73b906019c3caa81c46.jpg_525x525q80.jpg')), shop_id: 2) 
Product.create(name: 'Going to school',quantity: 45, price: "4", author: "Usborne", description:"good book", 
category_ids: [2], image: File.open(Rails.root.join('app','assets', 'images','img','bookimg', '216ddd9c23e08cf1472ecdc2afa01298.jpg')), shop_id: 2) 
#Historial Fiction 
Product.create(name: 'The war between us',quantity: 45, price: "4", author: "Sarah Creviston Lee", description:"good book", 
category_ids: [3], image: File.open(Rails.root.join('app','assets', 'images','img','bookimg', '51kjvCihacL.jpg')), shop_id: 2) 
Product.create(name: 'All the light we cannot see',quantity: 45, price: "4", author: "Anthony Doerr", description:"good book", 
category_ids: [3], image: File.open(Rails.root.join('app','assets', 'images','img','bookimg', 'images11.jpg')), shop_id: 2) 
Product.create(name: 'The book thief',quantity: 45, price: "4", author: "Markus Zusak", description:"good book", 
category_ids: [3], image: File.open(Rails.root.join('app','assets', 'images','img','bookimg', 'The-Book-Thief-by-Markus-Zusak-ecomm-via-amazom.com-.jpg')), shop_id: 2) 
Product.create(name: 'The song of Achilles',quantity: 45, price: "4", author: "Madeline Miller", description:"good book", 
category_ids: [3], image: File.open(Rails.root.join('app','assets', 'images','img','bookimg', '13623848._SY475_.jpg')), shop_id: 2) 
Product.create(name: 'An island at war',quantity: 45, price: "4", author: "Deborah Carr", description:"good book", 
category_ids: [3], image: File.open(Rails.root.join('app','assets', 'images','img','bookimg', '51ip2Pcdh0L._SL500_.jpg')), shop_id: 2) 
#  Cate
#  Cate
#Classic 
Product.create(name: 'Đề thi đẫm máu',quantity: 45, price: "4", author: "Lôi Mễ", description:"good book", 
category_ids: [4], image: File.open(Rails.root.join('app','assets', 'images','img','bookimg', 'tieu-thuyet-trinh-tham-hay-de-thi-dam-mau-loi-me.jpg')), shop_id: 3) 
Product.create(name: 'Án mạng trên sông Nile',quantity: 45, price: "4", author: "Agatha Christie", description:"good book", 
category_ids: [4], image: File.open(Rails.root.join('app','assets', 'images','img','bookimg', 'tieu-thuyet-trinh-tham-noi-tieng-4.jpg')), shop_id: 3) 
Product.create(name: 'Sherlock Holmes',quantity: 45, price: "4", author: "Conan Doyle", description:"good book", 
category_ids: [4], image: File.open(Rails.root.join('app','assets', 'images','img','bookimg', 'tải xuống (4).jpg')), shop_id: 3) 
Product.create(name: 'Sự im lặng của bầy cừu',quantity: 45, price: "4", author: "Thomas Harris", description:"good book", 
category_ids: [4], image: File.open(Rails.root.join('app','assets', 'images','img','bookimg', '51ip2Pcdh0L._SL500_.jpg')), shop_id: 3) 
Product.create(name: 'Người gác đêm',quantity: 45, price: "4", author: "Pháp Y Tầng Minh", description:"good book", 
category_ids: [4], image: File.open(Rails.root.join('app','assets', 'images','img','bookimg', 'tải xuống (1).jpg')), shop_id: 3) 
# Cook Books
Product.create(name: 'Nấu ăn gia đình',quantity: 45, price: "4", author: "Triệu Thị Chơi", description:"good book", 
category_ids: [6], image: File.open(Rails.root.join('app','assets', 'images','img','bookimg', '12b34969a5eca39a4f2136182a438e60.jpg')), shop_id: 3) 
Product.create(name: 'Các món ăn nhẹ',quantity: 45, price: "4", author: "Cẩm Tuyết", description:"good book", 
category_ids: [6], image: File.open(Rails.root.join('app','assets', 'images','img','bookimg', '6a0630d6ebf03f5dd6d1bbac0d62ef30.jpg')), shop_id: 3) 
Product.create(name: 'Món ngon dễ làm',quantity: 45, price: "4", author: "Minh Thư", description:"good book", 
category_ids: [6], image: File.open(Rails.root.join('app','assets', 'images','img','bookimg', 'Mon-ngon-de-lam-500x554.jpg')), shop_id: 3) 
Product.create(name: 'Về nhà ăn cơm',quantity: 45, price: "4", author: "Đức Nguyễn", description:"good book", 
category_ids: [6], image: File.open(Rails.root.join('app','assets', 'images','img','bookimg', 'afc7dd759ff73c9769b2968d1077012c.jpg')), shop_id: 3) 
Product.create(name: 'Bếp ấm nhà vui',quantity: 45, price: "4", author: "Lê Duy Niệm", description:"good book", 
category_ids: [6], image: File.open(Rails.root.join('app','assets', 'images','img','bookimg', 'afc7dd759ff73c9769b2968d1077012c.jpg')), shop_id: 3) 



Shipping.create(name: 'Standard - free')
Shipping.create(name: 'Truck Freight - 3$')
Shipping.create(name: 'By Ship - 4$')
Shipping.create(name: 'By Train- 5$')
Shipping.create(name: 'By Plane  - 6$')

Voucher.create(name: "abc", per: 10)
Voucher.create(name: "abcd", per: 20)
Voucher.create(name: "abcde", per: 30)
#OrderStatus.create(name: 'In Progress')
#OrderStatus.create(name: 'Placed' )
#OrderStatus.create(name: 'Shipped')
#OrderStatus.create(name: 'Cancelled')
