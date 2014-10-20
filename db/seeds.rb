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