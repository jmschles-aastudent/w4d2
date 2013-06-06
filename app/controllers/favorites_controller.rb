class FavoritesController < ApplicationController

	def index
		@favorite = Favorite.all
		render :json => @favorite
	end

	def create
		@favorite = Favorite.favoritenew(params[:contact])
		if @favorite.save
			render :json => @favorite
		else
			render :json => @favorite.errors, :status => :unprocessable_entity
		end
	end

	def show
		@favorite = Favorite.find(params[:id])
		render :json => @favorite
	end

	def update
		@favorite = Favorite.find(params[:id])
		if @favorite.update_attributes(params[:contact])
			render :json => @favorite
		else
			render :json => @favorite.errors, :status => :unprocessable_entity
		end
	end

	def destroy
		Favorite.find(params[:id]).destroy
		render :text => "Favorite atomized!"
	endFavorite

end
