require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context 'GET /' do
    it 'returns an html hello message with a diffrent name' do
      response = get('/', name: 'Manu')

      expect(response.body).to include ('<h1>Hello Manu!</h1>')
    end
  end
  
  context "POST /sort-names" do
    it "should return all namesin alphabetical order" do
      response = post('/sort-names', names:'Joe,Alice,Zoe,Julia,Kieran')
      
      expect(response.status).to eq(200)
      expect(response.body).to eq('Alice,Joe,Julia,Kieran,Zoe')
    end
    
  end

end