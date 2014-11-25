class SessionStoreController < ApplicationController

  def store
    Rails.session_cache.write(params[:session_store][:session_key], params[:session_store][:session_value])
    @store_value = Rails.session_cache.read(params[:session_store][:session_key]) || 'No value found.'
    flash[:notice] = 'Stored successfully in cache'
  end

  def fetch
    @store_value = Rails.session_cache.read(params[:session_key]) || 'No value found.'
    flash[:notice] = 'Fetched successfully from cache'
  end

  def reset
    reset_session
    @store_value = Rails.session_cache.read(params[:session_key]) || 'No value found.'
    flash[:notice] = 'Reset session successfully, try fetching now'
  end
end
