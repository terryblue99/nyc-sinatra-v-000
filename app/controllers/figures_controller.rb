class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figuress/show'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if params[:title_name].size > 0
      @figure.title = Title.create(name: params[:title_name])
    else
      @figure.title = Title.find_by_id(params[:figure][:title_id])
    end
    if params[:landmark_name].size > 0
      @figure.landmark = Landmark.create(name: params[:landmark_name])
    else
      @figure.landmark = Landmark.find_by_id(params[:figure][:landmark_id])
    end
    @figure.save
    redirect to "figures/#{@figure.id}"
  end

end
