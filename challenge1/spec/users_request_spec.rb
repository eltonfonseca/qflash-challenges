# frozen_string_literal: true

require_relative('../users_request')
require('ostruct')

describe UsersRequest do
  let!(:users_request) { UsersRequest.new }

  describe '#customize_object' do
    context 'give two objects' do
      let!(:object) do
        OpenStruct.new(
          {
            id: 1,
            email: 'george.bluth@reqres.in',
            first_name: 'George',
            last_name: 'Bluth',
            avatar: 'url'
          }
        )
      end

      let!(:expected) do
        [
          {
            name: 'George Bluth',
            email: 'george.bluth@reqres.in'
          }
        ]
      end

      it 'must be return only name and email' do
        expect(users_request.send(:customize_object, [object])).to eq(expected)
      end
    end
  end

  describe '#json_to_object' do
    context 'give a data with json format' do
      let!(:string_json) do
        '{ "name": "Michael Lawson", "email": "michael.lawson@reqres.in" }'
      end

      it 'must be return a object format' do
        expect(users_request.send(:json_to_object, string_json).class).to eq(OpenStruct)
      end
    end
  end
end
