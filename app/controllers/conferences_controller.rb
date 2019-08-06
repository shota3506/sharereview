class ConferencesController < ApplicationController
  before_action :authenticate, except: [:index, :show]

  def index
    @conferences = Conference.order("id DESC")
  end

  def show
    @conference = Conference.includes(:theses).find(params[:id])
  end

  def new
    @conference = Conference.new
  end

  def create
    @conference = Conference.new(conference_params)
    if @conference.save
      redirect_to @conference, notice: 'Added conference'
    else
      render :new
    end
  end

  private

  def conference_params
    params.require(:conference).permit(:name, :description)
  end

end
