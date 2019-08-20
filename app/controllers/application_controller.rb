class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/articles' do
      @articles = Article.all

      erb :index
    end

    get '/articles/new' do
      erb :new
    end

    get '/articles/:id' do
      @article = Article.find(params[:id])

      erb :show
    end

    get '/articles/:id/edit' do
      @article = Article.find(params[:id])

      erb :edit
    end

    patch '/articles/:id' do
      article = Article.find(params[:id])
      article.update(title: params[:new_title], content: params[:new_content])

      redirect to "/articles/#{article.id}"
    end

    delete '/articles/:id/delete' do
      article = Article.find(params[:id])
      article.destroy

      redirect to '/articles'
    end

    post '/articles' do
      article = Article.create(title: params[:title], content: params[:content])

      redirect to "/articles/#{article.id}"
    end

end
