class ContactsController < ApplicationController

	def index
		@contacts = Contact.all
		render :json => @contacts
	end

	def create
		@contact = Contact.new(params[:contact])
		if @contact.save
			render :json => @contact
		else
			render :json => @contact.errors, :status => :unprocessable_entity
		end
	end

	def show
		@contact = Contact.find(params[:id])
		render :json => @contact
	end

	def update
		@contact = Contact.find(params[:id])
		if @contact.update_attributes(params[:contact])
			render :json => @contact
		else
			render :json => @contact.errors, :status => :unprocessable_entity
		end
	end

	def destroy
		Contact.find(params[:id]).destroy
		render :text => "Contact obliviated!"
	end

end
