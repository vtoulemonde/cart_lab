class ItemsController < ApplicationController

	respond_to :json

	def index
		items = Item.all.order(:id)
		render json: items.to_json(include: :book)
	end

	def create
		item = Item.find_by(book_id: params[:item][:book_id])
		if item
			item.qty +=1
			item.save
		else
			item = Item.create params_item
		end
		render json: item
	end

	def update
		item = Item.find(params[:id])
		if item.qty >1
			item.qty -= 1
			item.save
		else
			item.destroy
		end
		render json: {}
	end

	def destroy
		Item.destroy_all
		render json: {}
	end

	def empty
		Item.destroy_all
		render json: {}
	end

	private

	def params_item
		params.require(:item).permit(:qty, :book_id)
	end
end
