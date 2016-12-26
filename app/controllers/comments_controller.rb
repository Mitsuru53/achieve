class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    @blog = @comment.blog

    respond_to do |format|
      if @comment.save
        format.html{redirect_to blog_path(@blog),notice:'コメントを投稿しました。'}
        format.json{render :show, status: :created, location: @comment}
        format.js{render :index}
      else
        format.html{render :new}
        format.json{render json:@comment.errors,status: :unprocessable_entity}
      end
    end
  end

  def destroy
  @blog = Blog.find(params[:blog_id])
  @comment = current_user.comments.find_by(blog_id: @blog.id)
  # binding.pry


  respond_to do |format|
  @comment.destroy
  format.html{redirect_to blog_path(@blog),notice:'コメントを削除しました。'}
  format.json{render :show, status: :deleted, location: @comment}
  format.js{render :index}
  end
end

  private
  def comment_params
    params.require(:comment).permit(:blog_id, :content)
  end
end