class PostsController < ApplicationController
    before_action :set_blog, only: [:show, :edit, :update]
    
    def index
      @posts = Post.all
    end
    
    def new
       @post = Post.new
    end    
    
    def create
      @post = Post.new(post_params)
      if @post.save
        redirect_to posts_path, notice: "ポストを作成しました！"
      else
        render :new
      end
    end    

    def edit
    end    
    
    def update
      if @post.update(post_params)
        redirect_to posts_path, notice: "ポストを編集しました！"
      else
        render :edit  
    end
  end    
    
    def show
    end    
    
    private

    def post_params
      params.require(:post).permit(:content)
    end

    def set_blog
      @psot = Post.find(params[:id])
    end  
end