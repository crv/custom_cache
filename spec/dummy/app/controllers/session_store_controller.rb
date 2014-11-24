class SessionStoreController < ApplicationController

  def store
    Rails.session_cache.write(params[:request_store][:request_key], params[:request_store][:request_value])
    @store_value = Rails.session_cache.read(params[:request_store][:request_key]) || 'No value found.'
    flash[:notice] = "Stored successfully in cache"
  end

  def fetch
    @store_value = Rails.session_cache.read(params[:request_key]) || 'No value found.'
  end
end
