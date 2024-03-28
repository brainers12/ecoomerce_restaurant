puts "Seeding Data ..."

# Helper functions
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

# Only run on development (local) instances not on production, etc.
unless Rails.env.development?
  puts "Development seeds only (for now)!"
  exit 0
end

## CATEGORIES

puts "Finding or Creating Categories ..."

cat1 = Category.find_or_create_by! name: 'Breakfast'
cat2 = Category.find_or_create_by! name: 'Lunch'
cat3 = Category.find_or_create_by! name: 'Dinner'

## PRODUCTS

puts "Re-creating Products ..."

Product.destroy_all

cat1.products.create!({
  name:  'Chhole Masala',
  description: "Chhole Masala, also known as Chana Masala, is a vibrant and flavorful dish from Indian 
  cuisine, made with white chickpeas (chhole) that are simmered in a rich and spicy tomato-based sauce. 
  The sauce is a harmonious blend of onions, tomatoes, garlic, ginger, and a variety of aromatic spices
  like cumin, coriander, garam masala, and amchur (dry mango powder), which give the dish its 
  distinctive tangy and spicy flavor profile. Often garnished with fresh cilantro and served with 
  a side of lemon wedges, Chhole Masala is a beloved vegetarian dish that's both hearty and nourishing.",
  image: open_asset('chhole.jpg'),
  quantity: 1,
  price: 20
})

cat1.products.create!({
  name:  'Rajma Chawal',
  description: "Rajma Chawal is a heartwarming North Indian dish that combines rich, spicy kidney beans (rajma) with 
  fluffy white rice (chawal). The rajma is slow-cooked in a thick gravy made from tomatoes, onions, 
  garlic, and a melange of spices such as cumin, coriander, garam masala, and turmeric, 
  resulting in a deeply flavorful and comforting meal. The creamy texture of the beans contrasts
   beautifully with the simplicity of the rice, making Rajma Chawal a satisfying and wholesome dish. ",
  image: open_asset('Rajma.jpg'),
  quantity: 1,
  price: 25
})

cat1.products.create!({
  name:  'Vada Pav',
  description: "Often called the Indian burger, Vada Pav is a popular street food from Mumbai. 
  It consists of a deep-fried potato dumpling (vada) placed inside a bread bun (pav) and served 
  with various chutneys and a green chili pepper. It's spicy, flavorful, and incredibly satisfying.",
  image: open_asset('Vada.jpg'),
  quantity: 1,
  price: 10
})

cat1.products.create!({
  name:  'Malai Kofta',
  description: "A dish for special occasions, Malai Kofta consists of deep-fried vegetable balls (koftas) 
  served in a rich, creamy sauce made from tomatoes and cashews. It's mildly spiced, slightly sweet, 
  and decadently creamy.",
  image: open_asset('Malai.jpg'),
  quantity: 1,
  price: 25
})

cat1.products.create!({
  name:  'Samosa',
  description: "A beloved Indian appetizer, Samosas are fried or baked pastry shells filled with a
  spicy mixture of mashed potatoes, peas, and sometimes meat. They are triangular in shape and 
  are served with sweet tamarind chutney or mint sauce.",
  image: open_asset('Samosa.jpg'),
  quantity: 5,
  price: 10
})

cat1.products.create!({
  name:  'Dosa',
  description: "A type of South Indian crepe made from a fermented batter of rice and black lentils.
  Crispy on the outside and soft on the inside, Dosas are often filled with a spicy potato mixture 
  and served with coconut chutney and sambar a lentil-based vegetable stew",
  image: open_asset('Dosa.jpg'),
  quantity: 2,
  price: 25
})


cat2.products.create!({
  name:  'Palak Paneer',
  description: "A smooth, creamy spinach curry served with paneer (Indian cottage cheese). 
  The spinach is pureed and seasoned with ginger, garlic, and garam masala, creating a nutritious 
  and flavorful dish that's both comforting and satisfying.",
  image: open_asset('Palak.jpg'),
  quantity: 20,
  price: 20
})

cat2.products.create!({
  name:  'Biryani',
  description: "A fragrant, spiced rice dish cooked with marinated meat (chicken, lamb, or beef), 
  Biryani is garnished with fried onions, boiled eggs, and sometimes dried fruits. 
  Its unique preparation involves cooking the meat and rice in layers, allowing the flavors 
  to meld beautifully.",
  image: open_asset('Biryani.jpg'),
  quantity: 1,
  price: 30
})

cat2.products.create!({
  name:  'Dal Makhani',
  description: "
  Dal Makhani is a cherished dish in Indian cuisine, known for its rich and creamy texture. 
  It's made with whole black lentils (urad dal) and kidney beans (rajma) that are slowly cooked
  with butter, cream, and a blend of spices, including garam masala, cumin, and coriander, resulting 
  in a hearty and comforting dish. The slow cooking process allows the flavors to deepen and meld 
  together beautifully, creating a velvety curry that's both nourishing and indulgent.",
  image: open_asset('Daal.jpg'),
  quantity: 1,
  price: 20
})

cat3.products.create!({
  name:  'Chole Bhature',
  description: "This popular North Indian dish pairs spicy chickpeas (chole) with fluffy, 
  fried bread (bhature). The chickpeas are slow-cooked in a medley of spices, tomatoes, and onions, 
  creating a deeply flavorful, slightly tangy sauce that complements the soft bread perfectly.",
  image: open_asset('Chole.jpg'),
  quantity: 2,
  price: 30
})

cat3.products.create!({
  name:  'Pani Puri',
  description: "Pani Puri, a quintessential street food of India, is a delightful explosion of flavors and textures in every bite. 
  This iconic snack consists of small, hollow, crisp-fried balls of dough, known as puris which are filled with a spicy and tangy mixture of tamarind water pani, chickpeas, potatoes, onions, and a blend of spices. The puris are served whole, 
  and the ritual of eating involves puncturing the top of the puri, stuffing it with the filling, and then dousing it with the flavored water before popping the entire creation into one's mouth in a single bite. ",
  image: open_asset('Paani.jpg'),
  quantity: 10,
  price: 25
})

cat3.products.create!({
  name:  'Butter Chicken',
  description: "Butter Chicken, also known as Murgh Makhani, is a classic Indian dish that epitomizes the rich and aromatic flavors of Indian cuisine. 
  It features tender pieces of chicken marinated in a mix of yogurt and spices, then cooked in a silky, mildly spiced tomato-based sauce enriched with butter and cream.
  This velvety dish is known for its delicate balance of tanginess, sweetness, and a hint of heat, often garnished with fresh cilantro for an added layer of flavor.
  Butter Chicken serves as a comforting and indulgent meal, typically accompanied by naan or rice, making it a beloved choice among both newcomers and connoisseurs of Indian food.
",
  image: open_asset('chicken.jpg'),
  quantity: 1,
  price: 20
})


puts "DONE!"

