class ThesesController < ApplicationController
  before_action :authenticate, except: [:index, :show]

  def show
    @thesis = Thesis.includes(:conference).includes(comments: :user).order('comments.id DESC').find(params[:id])
    @comment = Comment.new
  end

  def new
    @conference = Conference.find(params[:conference_id])
    @thesis = Thesis.new
  end

  def create
    @conference = Conference.find(params[:conference_id])
    @thesis = @conference.theses.build(thesis_params)

    if @thesis.save
      redirect_to conference_thesis_path(@conference, @thesis), notice: 'Success'
    else
      render :new
    end
  end

  private

  def thesis_params
    params.require(:thesis).permit(:title, :abstract, :url)
  end

end