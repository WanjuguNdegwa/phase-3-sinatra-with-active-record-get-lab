class ApplicationController < Sinatra::Base

  set :default_content_type, :json

  get '/bakeries' do
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    BakedGood.order(price: :desc).to_json
  end

  get '/baked_goods/most_expensive' do
    BakedGood.order(price: :desc).first.to_json
  end

end
