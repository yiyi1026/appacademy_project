require 'json'

class Flash
  attr_accessor :req , :messages

  def initialize(req)
    @req = req
    @messages = {}
  end

  def []=(key, value)
    @messages[key] = value
  end

  def [](key)
    @messages[key]
  end

  def store_flash(req)
    @req = req
  end

end
