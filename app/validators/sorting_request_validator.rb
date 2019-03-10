class SortingRequestValidator

  SCHEMA = {
      "list": [[Integer, String]],
      "options": [:optional, {
          "message": [:optional, String],
          "fast": [:optional, TrueClass, FalseClass]
      }]
  }

  def self.validate!(hash)
    ClassyHash.validate(hash, SCHEMA, full: true)
  end
end