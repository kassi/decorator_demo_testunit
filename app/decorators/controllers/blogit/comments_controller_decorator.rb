Blogit::CommentsController.class_eval do
  def create
    Rails.logger.info "decorated controller action"
    @comment = post.comments.new(params[:comment])
    @comment.user = current_user
    @comment.name = current_user.name || current_user.email # remove ||... if devise form contains :name
    @comment.email = current_user.email

    respond_to do |format|
      format.js {
        # the rest is dealt with in the view
        @comment.save
      }

      format.html {
        if @comment.save
          redirect_to(post, notice: t(:successfully_added_comment, scope: 'blogit.comments'))
        else
          render "blogit/posts/show"
        end
      }
    end
  end
end
