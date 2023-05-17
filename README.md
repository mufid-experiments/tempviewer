# Tempviewer

Simple array/json viewer in Sinatra.

It is handy if you want to check something big on your browser.

## Running

You can use rackup to run this:

    bundle install
    rackup

To run on specific port, just add `-p` argument. E.g.: running
on port 5000:

    rackup -p 5000

## Using Tempviewer

POST a request from any client. E.g.: using HTTParty on Ruby

    result = [{column1: 'test1', column2: 'test2'}, {column1: 'test3', column2: 'test4'}]
    
    HTTParty.post(
      'https://example.ngrok.io/array.json',
      body: JSON.generate(result),
      headers: { 'Content-Type' => 'application/json' }
    )

