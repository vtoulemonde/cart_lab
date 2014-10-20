# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Book.create(title: 'Panic', author: 'Lauren Oliver', price: 11.99 , img: 'http://ecx.images-amazon.com/images/I/51LV5SbJjlL._SY160_.jpg')
Book.create(title: 'Tin Drum', author: 'Gunter Grass', price: 15.99 , img: 'http://ecx.images-amazon.com/images/I/51JklycVjAL._AA160_.jpg')
Book.create(title: 'Missing You', author: 'Harlan Coben', price: 12.95 , img: 'http://ecx.images-amazon.com/images/I/511MTsFgZIL._SY160_.jpg')

Book.create(
    title: "Savage Harvest",
    author: "Carl Hoffman",
    price: 17.06,
    img:"http://ecx.images-amazon.com/images/I/513pKorXMDL._SY160_.jpg"
)
Book.create(
    title: "Bark",
    author: "Lorrie Moore",
    price: 13.67,
    img:"http://ecx.images-amazon.com/images/I/51msORtIceL._SY160_.jpg"
)
Book.create(
    title: "Shadow Spell",
    author: "Nora Roberts",
    price: 17.80,
    img:"http://ecx.images-amazon.com/images/I/61EnnEGu98L._SY160_.jpg"
)
Book.create(
    title: "Wild",
    author: "Cheryl Strayed",
    price: 11.99,
    img:"http://ecx.images-amazon.com/images/I/41p1ldx9y-L._SY160_.jpg"
)
Book.create(
    title: "The Chance",
    author: "Robyn Carr",
    price: 14.89,
    img:"http://ecx.images-amazon.com/images/I/51SXGSyMhhL._SY160_.jpg"
)
Book.create(
    title: "The Hit",
    author: "David Baldacci",
    price: 22.35,
    img:"http://ecx.images-amazon.com/images/I/518WBY80bCL._SY160_.jpg"
)
Book.create(
    title: "Grain Brain",
    author: "Kristin Loberg",
    price: 11.49,
    img:"http://ecx.images-amazon.com/images/I/51XQjnD5H2L._SY160_.jpg"
)
