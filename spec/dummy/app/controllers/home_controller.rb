class HomeController < ApplicationController

  def index
    p Rails.request_cache.object_id
  end

  def new
    p Rails.session_cache.read('5678')
  end
end
