class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all
  end

  def new
    if @params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end

  def create
    # Blog.create(title: params[:blog][:title],content: params[:blog][:content])
    # Blog.create(params.require(:blog).permit(:title, :content))
    @blog = Blog.new(blog_params)
    if @blog.save
    # redirect_to "/blogs/new" #デフォルトでGETメソッドの通信を行う
    #new_blog_pathというprefixを書くことで,"/blogs/new"というURLの指定をしますと同義
    #一覧画面へ遷移して”ブロ具を作成しました！”とメッセージを表示
      redirect_to blogs_path,notice:"ブログを作成しました!"
    else
      #入力フォームを再描画します
      render 'new'
    end
  end

  def show
    # @blog = Blog.find(params[:id])
  end

  def edit
    # @blog = Blog.find(params[:id])
  end

  def update
    # @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path, notice:"ブログが編集されました!"
    else
      render 'edit'
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"ブログを削除しました。"
  end

  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?
  end

  private

  # blog_paramsとして、メソッドを定義し、それを呼び出すことで、色々な場所からの利用を可能にする
  def blog_params
    params.require(:blog).permit(:title, :content)
  end

#idをキーとして値を取得するメソッドを追加
  def set_blog
    @blog = Blog.find(params[:id])
  end
end
