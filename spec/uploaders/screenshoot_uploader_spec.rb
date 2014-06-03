require 'spec_helper'

describe ScreenshotUploader do
  let(:object) { OpenStruct.new(id: 1, screenshot: nil) }
  let(:screenshot_uploader) { ScreenshotUploader.new(object, :screenshot) }

  before { ScreenshotUploader.enable_processing = true }
  after { ScreenshotUploader.enable_processing = false }

  before { screenshot_uploader.store!(File.open(screenshot_path)) }

  describe 'screenshot16-9.png' do
    let(:screenshot_path) { Rails.root.join('spec/stubs/screenshot16-9.png') }

    describe 'original' do
      subject { screenshot_uploader }

      it { should have_dimensions(1920, 1080) }
      its(:path) { should be_end_with("/original.png") }
    end

    describe 'thumb' do
      subject { screenshot_uploader.thumb200 }

      it { should be_no_larger_than(200, 200) }
      its(:path) { should be_end_with("/thumb200.png") }
    end
  end

  describe 'screenshot4-3.jpg' do
    let(:screenshot_path) { Rails.root.join('spec/stubs/screenshot4-3.jpg') }

    describe 'original' do
      subject { screenshot_uploader }

      it { should have_dimensions(800, 600) }
      its(:path) { should be_end_with("/original.jpg") }
    end

    describe 'thumb' do
      subject { screenshot_uploader.thumb200 }

      it { should be_no_larger_than(200, 200) }
      its(:path) { should be_end_with("/thumb200.jpg") }
    end
  end

end
