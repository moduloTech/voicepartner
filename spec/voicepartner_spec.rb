RSpec.describe Voicepartner do
  let(:api_key) { File.read(File.expand_path('../.rspec_api_key', __dir__)).chomp }
  let(:test_phone) { File.read(File.expand_path('../.rspec_number', __dir__)).chomp }

  it 'has a version number' do
    expect(Voicepartner::VERSION).not_to be nil
  end

  context 'Configuration' do
    it 'raises without a block' do
      expect {
        Voicepartner.configure
      }.to raise_error do |err|
        expect(err).to be_a(RuntimeError)
        expect(err.message).to eq 'You need to provide a block to configure'
      end
    end

    it 'sets client when configuring' do
      expect {
        Voicepartner.configure do |config|
          config.api_key = api_key
        end
      }.not_to raise_error
      expect(Voicepartner.client).not_to be_nil
    end
  end

  context 'Usage' do
    it 'should send a vocal message' do
      Voicepartner.configure do |config|
        config.api_key = api_key
      end

      expect {
        res = Voicepartner.send_vocal_message(
          to:           test_phone,
          message_text: 'Test from Voicepartner gem test suite'
        )
        expect(res.success).to be(true)
      }.not_to raise_error
    end
  end
end
