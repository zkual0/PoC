require './lib/requires'
include VerificationApiHelpers
include Api

describe 'status request' do
  let(:response) {make_request}

  describe 'GET /status' do
    it 'returns a status message' do
      verify_status(response)
    end
  end

  describe 'POST /status' do
    it 'returns a status message'
  end
end

describe 'Data' do
  let(:response) {make_request}

  describe 'entries' do
    it 'have serialized ids' do
      verify_ids_are_serialized(response)
    end

    it 'have a valid structure' do
      verify_entries_structure(response)
    end

    it 'have guaranteed integrity', :data do
      verify_data_integrity(response)
    end
  end
end

