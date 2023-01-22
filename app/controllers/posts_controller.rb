class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
def index

  if params[:search] == nil
    @posts= Post.all
  elsif params[:search] == ''
    @posts= Post.all

  else
    #部分検索
    @posts = Post.where("memo LIKE ? ",'%' + params[:search] + '%')
   
  end

end

def new
  @post = Post.new
end

  def create
    post = Post.new(post_params)

    post.user_id = current_user.id

    if post.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      redirect_to :action => "show", :id => post.id
    else
      redirect_to :action => "new"
    end
  end

    def destroy
      post = Post.find(params[:id])
      post.destroy
      redirect_to action: :index
    end

    
 
def cooking
  @cookings = Post.where(genre:"cooking") #ここがポイント！categoryのバリューがdogの投稿を取得！
end

def diet
  @diets = Post.where(genre:"diet") #ここがポイント！categoryのバリューがcatの投稿を取得！
end

def jobhunthing
  @jobhunthings = Post.where(genre:"jobhunthing") #ここがポイント！categoryのバリューがhadakadebanezumiの投稿を取得！
end

def saving
  @savings = Post.where(genre:"saving") #ここがポイント！categoryのバリューがcatの投稿を取得！
end

def study
  @studys = Post.where(genre:"study") #ここがポイント！categoryのバリューがdogの投稿を取得！
end

def others
  @others = Post.where(genre:"others") #ここがポイント！categoryのバリューがcatの投稿を取得！
end



    private
  def post_params
    params.require(:post).permit(:genre, :memo, :image, :site, :youtube, :comment, :cotent, :overall, :level )
  end

end


