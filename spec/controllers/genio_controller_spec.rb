require 'spec_helper'

describe GenioController do

  describe "GET 'pregunta'" do
    it "returns http success" do
      get 'pregunta'
      response.should be_success
    end
  end

  describe "GET 'respuesta'" do
    it "returns http success" do
      get 'respuesta'
      response.should be_success
    end
  end

end
