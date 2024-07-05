class ArticlesController < ApplicationController
    def index
        # list all articles
        @articles = Article.all
    end
    
    def new
        # display a form where you can add an article
        @article = Article.new
    end

    def create
        # create article (through model/active record)
        @article = Article.new(article_params)
        # @article.name = params[:name]
        # @article.body = params[:body]

        if @article.save
            redirect_to articles_path
        else
            render :new
        end
    end 

    def edit
        # display a form where you can edit an article
    end

    def update
        # update article (through model/activeRecord)
    end

    def delete
        # delete article (through model/activerecord)
    end

    private

    def article_params
        params.require(:article).permit(:name, :body)
    end
end
