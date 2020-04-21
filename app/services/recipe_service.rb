class RecipeService

  attr_accessor :options

  def initialize(options)
    self.options = options
  end

  def list
    api_params = {
      page: 1,
      per_page: 10,
      order_field: 'sys.updatedAt',
      additional_options: {}
    }.merge(options)

    Rails.cache.fetch(
      "#{api_params[:page]}_#{api_params[:per_page]}_recipes",
      expires_in: 1.hour
    ) do
      Recipe.paginate(api_params).load
    end
  end

  def one
    Rails.cache.fetch("#{options[:id]}_recipe", expires_in: 1.hour) do
      Recipe.find(options[:id])
    end
  end

end