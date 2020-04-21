require 'dotenv'

unless Rails.env.production?
  Dotenv.require_keys(
    'CONTENTFUL_ACCESS_TOKEN',
    'CONTENTFUL_SPACE_ID',
    'CONTENTFUL_ENVIRONMENT'
  )
end
