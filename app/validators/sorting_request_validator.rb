class SortingRequestValidator
  require "json-schema"

  SCHEMA = {
      sorting_request: {
          secret_key: [Integer],
          list: [[Integer, String]],
          options: [:optional, {
              message: [:optional, String],
              fast: [:optional, TrueClass, FalseClass]
          }]
      }
  }

  def validate!(hash)
    ClassyHash.validate(hash, SCHEMA, full: true)
  end
end