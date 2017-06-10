# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
get '/authors/:author', to: 'authors#author'
get '/authors', to: 'authors#index'


root to: 'home#index'
resources :books, only: [:index, :new, :create]