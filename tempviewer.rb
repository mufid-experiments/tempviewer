require 'sinatra/base'

class ArrayStore
  def self.set_from(json)
    @@json = json
  end

  def self.headers
    @@json.first.keys
  end

  def self.data
    keys = @@json.first.keys
    @@json.map do |entry|
      keys.map do |k|
        entry[k]
      end
    end
  end
end

class Tempviewer < Sinatra::Base
  get '/array' do
    @headers = ArrayStore.headers
    @data = ArrayStore.data

    erb :array
  end

  post '/array.json' do
    request.body.rewind
    data = JSON.parse request.body.read
    ArrayStore.set_from(data)

    'done'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
