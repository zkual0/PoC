module VerificationApiHelpers
  extend RSpec::Matchers

  def verify_status(http_response, code=200, message='OK')
    # verifies response status code and message
    # params:
    #   - http_response
    #   - status code value
    #   - message text
    begin
      aggregate_failures "testing status response" do
        expect(http_response.class).to eq(RestClient::Response)
        expect(http_response.code).to eq(code)
        expect(http_response.net_http_res.message).to eq(message)
      end
    rescue RSpec::Expectations::MultipleExpectationsNotMetError => e
      puts e.message
      exit(1)
    end
  end

  def verify_ids_are_serialized(http_response)
    # verifies the ids in the entries are in incremental sequence
    # params:
    #   - http_response
    begin
      aggregate_failures "testing ids sequence" do
        expect(http_response.class).to eq(RestClient::Response)
        body = (JSON.parse http_response.body.to_s)
        body.each_with_index do |entry, idx|
          idx += 1
          expect(entry['id']).to eq(idx)
        end
      end
    rescue RSpec::Expectations::MultipleExpectationsNotMetError => e
      puts e.message
      exit(1)
    end
  end

  def verify_entries_structure(http_response)
    # verifies each element includes these keys: 'userId', 'id', 'title', 'body'
    # params:
    #   - http_response
    begin
      aggregate_failures "testing entries structure" do
        expect(http_response.class).to eq(RestClient::Response)
        body = (JSON.parse http_response.body.to_s)
        body.each{ |entry| expect(entry.keys).to include('userId', 'id', 'title', 'body') }
      rescue RSpec::Expectations::MultipleExpectationsNotMetError => e
        puts e.message
        exit(1)
      end
    end
  end

  def verify_data_integrity(http_response)
    # Compares entries from http_response.body against stored values in json file
    # params:
    #   - http_response
    begin
      file = File.read('./spec/data/posts.json')
      expected_data = JSON.parse(file)

      aggregate_failures "testing data integrity" do
        expect(http_response.class).to eq(RestClient::Response)
        body = (JSON.parse http_response.body.to_s)
        body.zip(expected_data).each do |response, expected|
          expect(response).to include(expected)
        end

      rescue RSpec::Expectations::MultipleExpectationsNotMetError => e
        puts e.message
        exit(1)
      end
    end
  end
end
