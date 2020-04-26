# frozen_string_literal: true

# Challange 1

require('json')
require('net/http')

# class users request
# @author Elton Fonseca
class UsersRequest
  def initialize
    @file = File.open('users.json', 'w')
    @uri = URI('https://reqres.in/api/users')
    @total_pages = json_to_object(_request(@uri)).total_pages
  end

  def users
    build_json do
      (1..@total_pages).each do |page|
        write_users(page)
        write_timestamp
        write_tab(page)
      end
    end
  end

  private

  def build_json
    @file.write "[\n"
    yield
    @file.write ']'
  end

  def write_users(page)
    @file.write "\t{\n\t\t\"user_page_#{page}\": "
    @uri.query = URI.encode_www_form({ page: page })
    users = customize_object(json_to_object(_request(@uri)).data)
    @file.puts users.to_json + ','
  end

  def _request(uri)
    Net::HTTP.get_response(uri).body
  end

  def write_timestamp
    @file.write "\t\t\"timestamp\": "
    @file.puts "\"#{Time.now.strftime('%H:%M:%S:%3N')}\""
  end

  def write_tab(page)
    page < @total_pages ? @file.puts("\t},") : @file.puts("\t}")
  end

  def customize_object(array)
    array.map do |data|
      {
        name: "#{data.first_name} #{data.last_name}",
        email: data.email
      }
    end
  end

  def json_to_object(json_format)
    JSON.parse(json_format, object_class: OpenStruct)
  end
end
