var bookApp = angular.module("bookApp", ["ngResource"]);

    // bookApp.config(['$httpProvider', function($httpProvider) {
        // http://mcantor.github.io/2014/10/07/angular-and-rails-request-format
        // $httpProvider.defaults.headers.common["X-Requested-With"] = 'XMLHttpRequest';
    // }]);

    // This helps remove some of the magic from ngResource;
    // you can see the difference by looking at the URL
    // requested any time we ask for all books or all genres.
    // bookApp.config(['$resourceProvider', function ($resourceProvider) {
    //   // Don't strip trailing slashes from calculated URLs
    //   $resourceProvider.defaults.stripTrailingSlashes = false;
    // }]);

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
  return $resource('/items/:id', {id: "@id"}, {
      save: { method: 'POST', transformRequest: wrapParam},
      update: { method: 'PUT', transformRequest: wrapParam},
      empty: {method: 'POST', url: '/items/empty'}
  });
}]);

bookApp.controller("BooksController", ["Book", "Item", "$http", function(Book, Item, $http) {

  this.books = Book.query();
  this.items = [];
  var my_controller = this;
  this.itemCount = 0;
  this.total = 0;

  this.items = Item.query();

  this.items.$promise.then(function(result){
    //Calcul the nb and the total of items in cart
    for(var i = 0; i< result.length; i++){
        my_controller.total += (result[i].book.price * result[i].qty);
        my_controller.itemCount += result[i].qty;
    }
  });


  this.addToCart  = function(book){
    item = new Item();
    item.qty = 1;
    item.book = book;
    item.$save();

    this.itemCount+=1;
    this.total+=book.price;
    this.items = Item.query();

  }

  this.removeFromCart = function(item){
    item.$update();
    this.total -= item.book.price;
    this.itemCount -= 1;
    this.items = Item.query();
  }

  // Empty cart calling the destroy() method of the rails controller 
  // using $resource
  this.emptyCart = function(){
    Item.delete();
    this.items = [];
    this.total = 0;
    this.itemCount = 0;
  }

  // Empty cart calling the empty() method of the rails controller 
  // using $resource
  this.emptyCart2 = function(){
    Item.empty();
    // .$promise.then(function(){
          this.items = [];
          this.total = 0;
          this.itemCount = 0;
    // });
  }
  // Empty cart calling the empty() method of the rails controller 
  // using $http
  this.emptyCart3 = function (){
    $http.post( { url: '/items/empty' } )
    .success(function(data, status, headers, cfg) {
        this.items = [];
        this.total = 0;
        this.itemCount = 0;
    })
    .error(function(data, status, headers, cfg) {
        // Nothing
    });
  }

}]);
