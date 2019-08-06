class CommentsController < ApplicationController
  before_action :authenticate

  def create
    @thesis = Thesis.includes(:conference).includes(comments: :user).order('comments.id DESC').find(params[:thesis_id])
    @comment = Comment.new(text: params[:comment][:text], user: current_user, thesis: @thesis)

    if @comment.save
      redirect_to conference_thesis_path(@thesis.conference, @thesis), notice: 'Success'
    else
      render 'theses/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

end