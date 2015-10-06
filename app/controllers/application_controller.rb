class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Los metodos se encargaran de atender a los usuarios en ciertas rutas.
  # Es por esto que cada metodo debería tener una ruta.
  def index
  	# Cuando se le indica una ruta con slash (/) quiere decir que la vista
  	# Que queremos mostrar se encuentra directamente en la carpeta views.
  	render "/index"
  end

  # Defino un metodo que recibirá los datos que me envien en el formulario.
  def signup
  	# Recibo cada uno de los parametros que me envian y los imprimo en la terminal.
  	puts "************************************"
  	puts params[:nombre]
  	puts params[:correo]
  	puts params[:clave]

  	# Este metodo no renderizará una vista, pero si me redireccionará al index.
  	redirect_to "/"
  end

  # Defino un método que recibirá los datos de inicio de sesión.
  def login
  	# Recibo cada parametro para iniciar sesión y los asigno a una variable de instancia.
  	@correo = params[:correo]
  	@clave = params[:clave]

  	# Renderizo la vista "/datos" que se encuentra en la carpeta views.
  	render "/datos"
  end

end
