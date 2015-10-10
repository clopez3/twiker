class UsersController < ApplicationController

	def show
		@user = User.find(session[:user])
	end

	def create
		user = User.new
		user.name = params[:name]
		user.email = params[:email]
		user.password = params[:password]
		if user.save
			redirect_to "/"
		else
			flash[:notice] = "Hay errores en el formulario"
			redirect_to "/"
		end
	end

	def login
		user = User.where(email: params[:email]).first
		if user.nil?
			flash[:notice] = "Este usuario no existe"
			redirect_to "/"
		else
			if user.password == params[:password]
				session[:user] = user.id
				redirect_to user
			else
				flash[:notice] = "Esa contraseña no coincide"
				redirect_to "/"
			end
		end
	end

	def logout
		session[:user] = nil
		redirect_to "/"
	end

end
