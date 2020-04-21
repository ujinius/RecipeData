# Recipe Data

#### Simple webapp - getting data from Contentful service.

## Requirements

- `ruby 2.6.6`

## Setup

- clone this repository
- run `cd RecipeData`
- run `bundle` to install all necessary gems
- run `cp .env.template .env` and define `CONTENTFUL_*` environment variables (you could find demo values for them [here](https://gist.github.com/lawitschka/063f2e28bd6993cac5f8b40b991ae899))

## Run tests
`rspec`

## Run server

##### <u>development mode</u>:
`rails s`

##### <u>production mode</u>:
- run `RAILS_ENV=production rails assets:precompile`
- setup `nginx` or other web server to give static content (and point `public` directory for static content processing)
- run `RAILS_ENV=production RAILS_MASTER_KEY=686b737dac14e68069e614b939b02ee4 CONTENTFUL_ACCESS_TOKEN=... CONTENTFUL_SPACE_ID=... CONTENTFUL_ENVIRONMENT=... rails s` (replace dots by contentful vars values) 

and open `http://localhost:3000/` in your browser

Good luck! 

😺
