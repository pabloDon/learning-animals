require 'spec_helper'

describe Arbol do
  context "Validacion contruccion" do
    it "debe tener una carga" do
      arbol = FactoryGirl.build :arbol, carga: nil
      
      arbol.should_not be_valid
    end
    
    it "debe ser un arbol valido" do
      arbol = FactoryGirl.build :arbol
      
      arbol.should be_valid
    end
  end
end
