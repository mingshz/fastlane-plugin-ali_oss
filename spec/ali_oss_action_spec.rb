describe Fastlane::Actions::AliOssAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:success).with("putted into OSS successful.")

      #  happy-well.oss-ap-southeast-1.aliyuncs.com
      Fastlane::Actions::AliOssAction.run(
        endpoint: 'oss-ap-southeast-1.aliyuncs.com',
        accessKey: 'LTAI4Fhx6xaf2jPCnPgUEVhV', 
        accessSecret: 'cAzxNlvYzHtAXt7R5VH4vHRLRs4AUI',
        bucket:'happy-well',
        path: 'example/gemfile',
        localFile: './Gemfile'
      )
    end
  end
end
