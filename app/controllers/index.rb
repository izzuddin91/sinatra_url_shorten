

get '/' do
  # let user create new short URL, display a list of shortened URLs
  erb :index
end

post '/urls' do
  # create a new Url
  @received_url = params[:link]

  @url = Link.create(long_url: @received_url, click_count: 0)

  erb :display_urls
end


# e.g., /q6bda
get '/:short_url' do
  # redirect to appropriate "long" URL
  @received_url = "/#{params[:short_url]}"
  @link = Link.where(short_url:  @received_url)[0]
  # count = @link.click_count
  # count += 1
  @link.increment!(:click_count)
  redirect to("#{@link.long_url}")
end

