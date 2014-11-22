class User

  def market_segment
    p '----------From Model--------------'
    p Rails.request_cache.read('1234')
  end

end