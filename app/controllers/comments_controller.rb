class CommentsController < ApplicationController

  def create
    @health = Health.find(params[:health_id])
    @comment = @health.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to health_path(@health), notice: '投稿できませんでした' }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
