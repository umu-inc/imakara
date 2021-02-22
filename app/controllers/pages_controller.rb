class PagesController < ApplicationController
  def index
    @posts = Post.all.order(created_at: "ASC")
  end

  def show
  end
end
