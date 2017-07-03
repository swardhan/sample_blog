class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy, :upvote]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all.order('created_at DESC')
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    if @article.voted_on_by?(current_user)
      @likeClass="Unlike"
    else
      @likeClass="Like"
    end
  end

  # GET /articles/new
  def new
    @article = current_user.articles.build
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = current_user.articles.build(article_params)

      if @article.save
        redirect_to @article, notice: 'Article was successfully created.'
      else
        render :new
      end
  end

  def upvote
    if @article.voted_on_by?(current_user)
      @article.unvote_by current_user
      redirect_to :back
    else
      @article.upvote_by current_user
      redirect_to :back
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
      if @article.update(article_params)
        render :show, status: :ok, location: @article
      else
        render :edit
      end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    redirect_to articles_url, notice: 'Article was successfully destroyed.'

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:name, :content)
    end
end
