describe Fastlane::Actions::AliOssAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The ali_oss plugin is working!")

      Fastlane::Actions::AliOssAction.run(nil)
    end
  end
end
