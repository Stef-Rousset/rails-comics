# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

Article.destroy_all
User.destroy_all

puts "create User"

user = User.new(first_name: "Paul", last_name: "Bompart", pseudo: "batman", email: "batman@gmail.com", password: 123456)
user.photo.attach(io: File.open('app/assets/images/photo.jpg'), filename: 'photo.jpg', content_type: 'image/jpg')
user.save!
puts "finish user"

puts "create 2 articles"

article_one = Article.new(title: "Thor against universe", user: user, content: "Banni d'Asgard par son père Odin, Thor doit apprendre à vivre parmi les humains dans un monde
 qui lui est totalement inconnu. Pour le jeune guerrier impétueux, c'est le début d'une fabuleuse aventure. Il rencontrera Jane Foster, la femme qui ravira son coeur, ainsi
  que plusieurs héros Marvel : Hank Pym, Namor, Captain Britain et même Iron Man !")
article_one.photo.attach(io: File.open('app/assets/images/bd.jpg'), filename: 'bd.jpg', content_type: 'image/jpg')
article_one.save!

article_two = Article.new(title: "Superman vs Batman", user: user, content: "Superman et Batman sont depuis leurs débuts les plus grands protecteurs que l’humanité ait connus,
 mais lorsque Lex Luthor, l’ennemi juré de l’Homme d’Acier, devient président des États-Unis, ils sont déclarés, sur son ordre, « ennemis publics n°1 », et doivent échapper à
  leurs anciens alliés de la Ligue de Justice ! Et quand la cousine de Superman atterrit sur Terre, les forces de Darkseid convoitent de près cette nouvelle « arme vivante »
   kryptonienne !")
article_two.photo.attach(io: File.open('app/assets/images/picture.jpg'), filename: 'bd.jpg', content_type: 'image/jpg')
article_two.save!

puts "finish create articles"
