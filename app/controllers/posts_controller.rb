class PostsController < ApplicationController
    before_action :findpostid_params, :only => [:edit,:update, :destroy]
    before_action :authenticate_user!, :only => [:new, :create, :edit]    
    def new
    @group = Group.find(params[:group_id])
    @post = Post.new
    end

    def create
    @group = Group.find(params[:group_id])
    @post = Post.new(post_params)
    @post.group = @group
    @post.user = current_user

    if @post.save
    redirect_to group_path(@group)
    else
    render :new
    end
end

    def edit
        # @post = Post.find(params[:id])
    end
    def update
        #@group = Group.find(params[:id])
        #find_geoup_and_check_permission
        # if current_user != @group.user 
        #     redirect_to root_path, alert: "You have no permission."
        # end
        # @post = Post.find(params[:id])
        
        if @post.update(post_params)
            redirect_to account_posts_path, notice: "Update Success"
        else
            render :edit
        end
    end

    def destroy
        @post.destroy
        redirect_to account_posts_path, notice: "Delete Success"
    end

private
def findpostid_params
    @post = Post.find(params[:id])
end

def post_params
    params.require(:post).permit(:content)
end
end
