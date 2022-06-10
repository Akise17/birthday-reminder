class Hookbin
  def initialize(baseurl:)
    @baseurl = baseurl
  end

  def call(full_name)
    HTTP.post(@baseurl, json: { 'message': "Hey, #{full_name} it’s your birthday" })
  end
end
