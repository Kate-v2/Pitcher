
class Matches

  attr_reader :suggestions

  def initialize(suggestions)
    @suggestions = suggestions # hash
  end

  def quantity
    @suggestions.count
  end

  # session[:matches] = { id: rank  }
  # def
end
