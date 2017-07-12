class FiguresController < ApplicationController

  get '/figures' do
    binding.pry
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures/:id' do
    binding.pry
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if params[:title].size > 0
      @figure.titles << Title.create(params[:title])
    else
      binding.pry
      @figure.titles << Title.find_by_id(params[:figure][:title_id])
    end
    if params[:landmark].size > 0
      @figure.landmarks << Landmark.create(params[:landmark])
    else
      binding.pry
      @figure.landmark = Landmark.find_by_id(params[:figure][:landmark_id])
    end
    @figure.save
    redirect to "figures/#{@figure.id}"
  end

end
