class GenioController < ApplicationController
  def home
    @pregunta = "Estas pensando en un animal"
    if session[:arbol] != nil
      redirect_to :action => :pregunta
    end
  end
  def pregunta
    if session[:arbol] == nil
      session[:arbol] = 1
    end
    
    arbol = Arbol.find session[:arbol]
    if arbol.izquierda == nil
      redirect_to :action => :pregunta_final
    else
      @pregunta = arbol.carga
    end
    session[:pregunta] = @pregunta
  end

  def respuesta
    respuesta = params[:respuesta]
    arbol = Arbol.find session[:arbol]
    if respuesta == 'no'
      arbol = Arbol.find arbol.derecha
      session[:arbol] = arbol.id
      redirect_to :action => :pregunta
    elsif respuesta == 'si'
      arbol = Arbol.find arbol.izquierda
      session[:arbol] = arbol.id
      redirect_to :action => :pregunta
    else
      reset_session
      redirect_to root_url
    end
  end
  
  def pregunta_final
    arbol = Arbol.find session[:arbol]
    @pregunta = arbol.carga
  end  
  
  def respuesta_final
    @animal = Arbol.find(session[:arbol]).carga
    respuesta = params[:respuesta]
    if respuesta == 'si'
      session[:arbol] = nil
      @cabecera = "Fuck yeah"
      render 'respuesta_correcta'
    else
      @cabecera = "Ohhh!"
    end
  end
  
  def learn
    @animal = Arbol.find(session[:arbol])

    animal = params[:animal]
    diferencia = params[:diferencia]
    respuesta = params[:respuesta]
    
    nuevo_animal = Arbol.create :carga => animal
    antiguo_animal = Arbol.create :carga => @animal.carga
    @animal.carga = diferencia
    
    if respuesta == 'si'
      @animal.izquierda = antiguo_animal.id
      @animal.derecha = nuevo_animal.id
    else
      @animal.izquierda = nuevo_animal.id
      @animal.derecha = antiguo_animal.id
    end
    @animal.save
    
    session[:arbol] = nil
    session[:pregunta] = nil
  end

  
  
  
  
  
  
end