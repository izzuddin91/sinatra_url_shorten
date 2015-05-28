# contains the routes related to listing, creating, and redirecting Url objects
get '/:short_url' do
  # redirect to appropriate "long" URL
  @received_url = "/#{params[:short_url]}"
  @link = Link.where(short_url:  @received_url)[0]
  # count = @link.click_count
  # count += 1
  @link.increment!(:click_count)
  redirect to("#{@link.long_url}")
end
