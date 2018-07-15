# encoding: utf-8
$:.unshift "lib"
require 'srx/polish/sentence_splitter'

Given /^a text$/ do |text|
  @text = text
end

When /^the text is split$/ do
  @splitter = SRX::Polish::SentenceSplitter.new(@text)
end

Then /^the following sentences should be detected$/ do |table|
  table.hashes.zip(@splitter.to_a).each do |expected,returned|
    expect(returned.gsub(/\s*\n/," ").strip).to eq expected[:sentence]
  end
end
