require 'pry'
# require 'paginate'
class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @articles = Article.paginate(:page => params[:page], :per_page => 5)
    @latest_arts = Article.last(5)
    @latest_arts = @latest_arts.reverse
    @respond = {:articles=> @articles, :latest_arts=> @latest_arts}
    respond_with(@respond)
  end

  def show
    # temp = @article.text
    # # binding.pry
    # temp = temp.gsub("\\n","<br/>")
    # @temp = temp.gsub("\\t","&nbsp&nbsp&nbsp&nbsp")
    # @article.text = @temp

    respond_with(@article)
  end

  def new
    @article = Article.new
    respond_with(@article)
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    @article.save
    respond_with(@article)
  end

  def update
    @article.update(article_params)
    respond_with(@article)
  end

  def destroy
    @article.destroy
    respond_with(@article)
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :text)
    end
end
