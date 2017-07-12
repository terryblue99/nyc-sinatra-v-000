class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    binding.pry
    if params[:title][0] != nil
      @figure.titles << Title.create(params[:title])
    else
      binding.pry
      @figure.titles << Title.find_by_id(params[:figure][:title_ids][0])
    end
    if params[:landmark][0] != nil
      @figure.landmarks << Landmark.create(params[:landmark])
    else
      binding.pry
      @figure.landmark = Landmark.find_by_id(params[:figure][:landmark_id])
    end
    @figure.save
    redirect to "figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  post '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    binding.pry
    if params[:title][0] != nil
      @figure.titles << Title.create(params[:title])
    else
      binding.pry
      @figure.titles << Title.find_by_id(params[:figure][:title_ids][0])
    end
    if params[:landmark][0] != nil
      @figure.landmarks << Landmark.create(params[:landmark])
    else
      binding.pry
      @figure.landmark = Landmark.find_by_id(params[:figure][:landmark_id])
    end
    @figure.save
    redirect to "figures/#{@figure.id}"
  end

end
