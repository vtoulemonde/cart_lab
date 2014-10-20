class BooksController < ApplicationController

	respond_to :json

	def index
		books = Book.all
		render json: books
	end
end
