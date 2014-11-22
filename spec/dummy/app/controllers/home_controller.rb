class HomeController < ApplicationController

  #uses_custom_cache

  def index

    Rails.request_cache.write('1234', 'chirag')
    Rails.request_cache.read('1234')

    Rails.session_cache.write('5678', 'Viradiya')
    Rails.session_cache.read('5678')

    render nothing: true
  end
end
