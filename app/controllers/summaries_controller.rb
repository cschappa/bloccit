class SummariesController < ApplicationController
  def show
    @post = Post.find(params[:post_id])
    @summary = @post.summary
    @topic = Topic.find(params[:topic_id])
    authorize @summary
  end

  def new
    @summary = Summary.new # empty model to pass to the form_for helper
    @post = Post.find(params[:post_id])
    @topic = Topic.find(params[:topic_id])
    authorize @summary
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    # This is the actual summary to save
    @summary = Summary.new(params.require(:summary).permit(:body))
    @summary.post = @post
    authorize @summary

    if @summary.save
      flash[:notice] = "Summary was saved to Post."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
 
    
  end

end
