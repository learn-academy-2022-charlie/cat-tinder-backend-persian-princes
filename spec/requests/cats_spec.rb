require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /index" do # an Endpoint
    it "gets all the cats from the database" do
      Cat.create name:'Bentley', age:1, enjoys:'food every day', image:'https://images.unsplash.com/photo-1574144611937-0df059b5ef3e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZnVubnklMjBjYXR8ZW58MHx8MHx8&w=1000&q=80'

      get '/cats'
      bentley = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(bentley.length).to eq 1
    end   
  end

  describe "POST /create" do # an Endpoint
    it "creates a new cat and adds it to the database" do
      cat_params = {
        cat: {
            name:'Bentley', 
            age:1, 
            enjoys:'food every day', 
            image:'https://images.unsplash.com/photo-1574144611937-0df059b5ef3e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZnVubnklMjBjYXR8ZW58MHx8MHx8&w=1000&q=80'
        }
      }

      post '/cats', params: cat_params
      
      bentley = Cat.first
      expect(response).to have_http_status(200)
      expect(bentley.name).to eq 'Bentley'
      expect(bentley.age).to eq 1
      expect(bentley.enjoys).to eq 'food every day'
    end
  end

  describe "Patch /cats/:id" do # an Endpoint
    it "updated an existing cat within the database" do
      cat_params = {
        cat: {
            name:'Bentley', 
            age:1, 
            enjoys:'food every day', 
            image:'https://images.unsplash.com/photo-1574144611937-0df059b5ef3e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZnVubnklMjBjYXR8ZW58MHx8MHx8&w=1000&q=80'
        }
      }
      post '/cats', params: cat_params

      edit_params = {
        cat: {
            name:'Bentley', 
            age: 3, 
            enjoys:'playing with yarn', 
            image:'https://images.unsplash.com/photo-1574144611937-0df059b5ef3e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZnVubnklMjBjYXR8ZW58MHx8MHx8&w=1000&q=80'
        }
      }

      bentley = Cat.first
      bentley_id = bentley.id
      patch "/cats/#{bentley_id}", params: edit_params

      edited_bentley = Cat.first
      expect(response).to have_http_status(200)
      expect(edited_bentley.name).to eq 'Bentley'
      expect(edited_bentley.age).to eq 3
      expect(edited_bentley.enjoys).to eq 'playing with yarn'
    end   
  end

  describe "Delete /cats/:id" do # an Endpoint
    it "removes a cat from the database" do
      cat_params = {
        cat: {
            name:'Bentley', 
            age:1, 
            enjoys:'food every day', 
            image:'https://images.unsplash.com/photo-1574144611937-0df059b5ef3e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZnVubnklMjBjYXR8ZW58MHx8MHx8&w=1000&q=80'
        }
      }
      post '/cats', params: cat_params

      bentley = Cat.first
      bentley_id = bentley.id
      delete "/cats/#{bentley_id}"

      expect(response).to have_http_status(200)
      expect(Cat.all.length).to eq 0
    end   
  end

  # describe "Get /cats/:id" do # an Endpoint
  #   it "shows a singular cat retrieved by id" do
  #     # Create a test to ensure /cats/:id and show method is responding correctly
  #     # I need to send something to my application and have it added to my database
  #     cat_params = {
  #       cat: {
  #           name:'Bentley', 
  #           age:1, 
  #           enjoys:'food every day', 
  #           image:'https://images.unsplash.com/photo-1574144611937-0df059b5ef3e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZnVubnklMjBjYXR8ZW58MHx8MHx8&w=1000&q=80'
  #       }
  #     }
  #     post '/cats', params: cat_params

  #     bentley = Cat.first
  #     bentley_id = bentley.id
  #     get "/cats/#{bentley_id}"

  #     show_bentley = Cat.first
  #     expect(response).to have_http_status(200)
  #     expect(show_bentley.name).to eq 'Bentley'
  #     expect(show_bentley.age).to eq 1
  #     expect(show_bentley.enjoys).to eq 'food every day'
  #   end   
  # end
end