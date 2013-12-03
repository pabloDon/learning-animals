class Arbol < ActiveRecord::Base
  attr_accessible :carga, :derecha, :izquierda
  
  validates :carga, :presence => true
  
  def izq?
    self.izq != nil
  end
  def new
    @arbol= Arbol.new
  end
end
