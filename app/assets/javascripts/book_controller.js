var bookApp = angular.module("bookApp", ["ngResource"]);

bookApp.factory("Book", ["$resource", function($resource){
  return $resource("/books/:id")
}
]);

function wrapParam(data){
  data.book_id = data.book.id;
  delete data.book;
  return JSON.stringify({ item: data });
}

bookApp.factory("Item", ["$resource", function($resource){
  // return $resource("/items/:id")
  return $resource('/items/:id', {id: "@id"}, {
      save: { method: 'POST', transformRequest: wrapParam},
      update: { method: 'PUT', transformRequest: wrapParam}
  });
}]);

bookApp.controller("BooksController", ["Book", "Item", function(Book, Item) {

  this.books = Book.query();
  this.items = Item.query();

  //Calcul the nb and the total of items in cart
  this.itemCount = 0;
  this.total = 0;
  console.dir(this.items);
  console.log(this.items.length);

  for(var i = 0; i< this.items.length; i++){
      console.log(i);
      this.total += this.items[i].book.price;
      this.itemCount += this.items[i].qty;
  }

  this.addToCart  = function(book){
    item = new Item();
    item.qty = 1;
    item.book = book;
    item.$save();

    this.itemCount++;
    this.total+=book.price;
    this.items = Item.query();

  }

  this.removeFromCart = function(item){
    item.$update();
    this.total -= item.book.price;
    this.itemCount -= 1;
    this.items = Item.query();
  }

  this.emptyCart = function(){
    Item.delete();
    this.items = [];
    this.total = 0;
    this.itemCount = 0;
  }
}]);
