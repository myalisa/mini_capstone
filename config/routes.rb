Rails.application.routes.draw do
    namespace :api do
      get '/product_1' => 'product#product_1_action'
      get '/product_2' => 'product#product_2_action'
      get '/product_3' => 'product#product_3_action'
    end
end
