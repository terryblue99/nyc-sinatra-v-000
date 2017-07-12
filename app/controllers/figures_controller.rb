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
    if params[:title][:name].size > 0
      @figure.titles << Title.create(params[:title])
    else
      if params[:figure][:title_ids] != nil
        @figure.titles << Title.find_by_id(params[:figure][:title_ids][0])
      end
    end
    if params[:landmark][:name].size > 0
      @figure.landmarks << Landmark.create(params[:landmark])
    else
      if params[:figure][:landmark_ids] != nil
        @figure.landmarks << Landmark.find_by_id(params[:figure][:landmark_ids][0])
      end
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
    redirect to "figures/#{@figure.id}"
  end

end
