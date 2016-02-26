require 'carrierwave/test/matchers'

describe AvatarUploader do
  include CarrierWave::Test::Matchers

  before do
    AvatarUploader.enable_processing = true
    @uploader = AvatarUploader.new(@fighter, :avatar)

    File.open(File.join(Rails.root, 'db/placeholders/250x300.png')) do |f|
      @uploader.store!(f)
    end
  end

  after do
    AvatarUploader.enable_processing = false
    @uploader.remove!
  end

  context 'the thumb version' do
    it "should scale down to be 50 by 50 pixels" do
      @uploader.thumb.should have_dimensions(50, 50)
    end
  end
end
