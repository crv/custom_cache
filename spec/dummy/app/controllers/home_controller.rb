class HomeController < ApplicationController

  def index

    Rails.request_cache.write('1234', 'chirag')
    p Rails.request_cache.read('1234')

    Rails.session_cache.write('5678', 'Viradiya')
    p Rails.session_cache.read('5678')


  end

  def new
    p Rails.session_cache.read('5678')
  end
end
