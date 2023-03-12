module RequestBin
  class << self
    attr_accessor :body

    def send_webhook(user_id)
      user = User.find(user_id)
      @body = { message: "Happy Birthday #{user.first_name} #{user.last_name}!!" }
      response = webhook
      puts response.as_json
    end

    private

    def webhook
      HTTParty.post(ENV['REQUEST_BIN_URL'],
                    headers: { 'content-type': 'application/json' },
                    body: body.to_json)
    end
  end
end
