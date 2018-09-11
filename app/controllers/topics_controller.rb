
class TopicsController < ApplicationController

  def index
    @topics = Topic.all
    @newTopic = Topic.new
    @users = User.all
  end

  def show
    @topic = Topic.find(params[:id])
    @newpost = Post.new(:topic_id => params[:id])
    @posts = Post.where(topic_id: params[:id])
  end

  def create
    @topic = Topic.new(params[:topic].permit(:title,:job,:body,:user_id))
    @topic.user_id = current_user.id
    @topic.save
    redirect_to topics_index_path
  end

  def delete
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to topics_index_path
  end

private
def topic_params
    params.require(:topic).permit(:title, :body, :user_id)
end
end