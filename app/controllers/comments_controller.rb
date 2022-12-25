class CommentsController < ApplicationController
  before_action :set_health, only: [:create, :edit, :update]

  def create
    @comment = @health.comments.build(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        flash.now[:notice] = 'コメントが投稿されました'
        format.js { render :index }
      else
        format.html { redirect_to health_path(@health), notice: '投稿できませんでした' }
      end
    end
  end

  def edit
    @comment = @health.comments.find(params[:id])
    respond_to do |format|
      if @comment.user == current_user
        flash.now[:notice] = 'コメントの編集中'
        format.js { render :edit }
      else
        format.js { render :index }
      end
    end
  end

  def update
    @comment = @health.comments.find(params[:id])
      respond_to do |format|
        if @comment.update(comment_params)
          flash.now[:notice] = 'コメントが編集されました'
          format.js { render :index }
        else
          flash.now[:notice] = 'コメントの編集に失敗しました'
          format.js { render :edit }
        end
      end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user == current_user
      @comment.destroy
      respond_to do |format|
        flash.now[:notice] = 'コメントが削除されました'
        format.js { render :index }
      end
    else
      format.js { render :index }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end

  def set_health
    @health = Health.find(params[:health_id])
  end
end
