# custom_cache

A wrapper over Rails cache to provide request and session cache

## Installation

Add this line to your application's Gemfile:

    gem 'custom_cache'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install custom_cache

## Usage

The request_cache can be used to share information over the request between controller, models etc without re-fetching it

    Rails.request_cache.write('current_product_id', 'd4f30996-4dba-4805-8114-6b35d1272858')
    Rails.request_cache.read('current_product_id')

The session_cache can be used to share information across the requests between controller, models etc without re-fetching it

    Rails.session_cache.write('capabilities', ['REPORTS_VIEW', 'PRODUCT_CRUD'])
    Rails.session_cache.read('capabilities')

