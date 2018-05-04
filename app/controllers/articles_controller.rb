class ArticlesController < ApplicationController

  # Prefix: welcome_index
  # Verb: GET
  # Pattern: /welcome/index(.:format)
  def index
    @articles = Article.all
  end

  # Prefix: article
  # Verb: GET
  # Pattern: /articles/:id(.:format)
  def show
    @article = Article.find(params[:id])
  end

  # Prefix: articles
  # Verb: POST
  # Pattern: /articles(.:format)
  def create
    @article = Article.new(article_params)

    # Returns true if successful save
    # False otherwise
    if @article.save
      redirect_to @article
    else
      render 'new'
    end

  end



  # Prefix: new_article
  # Verb: GET
  # Pattern: /articles/new(.:format)
  def new
    @article = Article.new
  end

  # Prefix: edit_article
  # Verb: GET
  # Pattern: /articles/:id/edit(.:format)
  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  # Prefix: edit_article
  # Verb: DELETE
  # Pattern: /articles/:id(.:format)
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
