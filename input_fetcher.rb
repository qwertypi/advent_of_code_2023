# frozen_string_literal: true

require 'net/http'
require 'cgi'

# Gets the input date for the day
class InputFetcher
  INPUT_URI = 'https://adventofcode.com/2023/day/%<day>s/input'

  def self.fetch_input(day)
    uri = URI(format(INPUT_URI, day: day))
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.request_uri)
    cookie1 = CGI::Cookie.new('session', ENV['ADVENT_SESSION'])
    request['Cookie'] = cookie1.to_s.sub(/; path=$/, '')
    r = http.request(request)

    r.body.split("\n")
  end
end
