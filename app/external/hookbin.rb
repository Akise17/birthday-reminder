class Hookbin
  def initialize(baseurl:)
    @baseurl = baseurl
  end

  def call(message)
    HTTP.post(@baseurl, json: { 'message': message })
  end
end
