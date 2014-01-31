require './spec_helper.rb'
require '../analyze.rb'

describe 'prefixes histogram' do

  it 'can access the raw_customers.txt file' do
    expect(File).to exist('../raw_customers.txt')
  end

  it 'outputs a file of prefixes' do
    `ruby ../analyze.rb < ../raw_customers.txt > ../histogram.txt`
    File.read('../histogram.txt').should_not be_empty
    FileUtils.rm('../histogram.txt')
  end
end
