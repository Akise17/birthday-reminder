class External
  CLIENTS = {
    hookbin:
      -> { Hookbin.new(baseurl: ENV['HOOKBIN_BASEURL']) }
  }

  def self.method_missing(name)
    CLIENTS[name.downcase.to_sym]&.call
  end
end
