require 'rest-client'

module Api
  def make_request(opts={})
      endpoint = (opts.keys.include? :endpoint)? opts[:endpoint] : 'https://jsonplaceholder.typicode.com/posts'
      headers  = (opts.keys.include? :headers)?  opts[:headers]  : {accept: :json}
      RestClient.get endpoint, headers
  end
end

