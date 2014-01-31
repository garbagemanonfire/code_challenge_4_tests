require './spec_helper.rb'
require '../clean.rb'

def delete_files
  FileUtils.rm_r %w( ../input.txt ../expected_output.csv ../customers.csv)
end

describe 'test for prefix words' do
  
  @prefix_words = []

  File.open(../prefix_words.txt, 'r') | xline | do 
    while line = xline.gets  
      prefix_words.push(xline)
    end  
  end 

  prefix_words should include (Proper_List_of_Prefixes)
end

describe 'test for suffix words' do
  
  @suffix_words = []

  File.open(../suffix_words.txt, 'r') | xline | do 
    while line = xline.gets  
      suffix_words.push(xline)
    end  
  end 

  suffix_words should include (Proper_List_of_Suffixes)
end

describe 'test clean file output vs expected output without phone' do

  it 'should format a string input to an Array' do
    input = 'Mr. Jenkins'
    output =  ['Mr.', '', '', 'Jenkins', '']
    format_method(input).should == output
  end

  it 'should format a string input to an Array' do
    input = 'Mrs. Dameon C. Thiel'
    output =  ['Mrs.', 'Dameon', 'C.', 'Thiel', '']
    format_method(input).should == output
  end

  it 'should format a string input to an Array' do
    input = 'Miss Clifton Cummerata-Smith'
    output =  ['Miss', 'Clifton', '', 'Cummerata-Smith', '']
    format_method(input).should == output
  end

  it 'should format a string input to an Array' do
    input = 'Caitlyn R. Corwin DVM'
    output =  ['', 'Caitlyn', 'R.', 'Corwin', 'DVM']
    format_method(input).should == output
  end

  it 'should format a string input to an Array' do
    input = 'Mrs. Bud Lance Stark-Hand Jr.'
    output =  ['Mrs', 'Bud', 'Lance', 'Stark-Hand', 'Jr.']
    format_method(input).should == output
  end
end

describe 'test clean file output vs expected output with phone' do

  it 'should format a string input to an Array' do
    input = 'Mr. Jenkins 1.155.258.9944'
    output =  ['Mr.', '', '', 'Jenkins', '', '155.258.9944', '']
    format_method(input).should == output
  end

  it 'should format a string input to an Array' do
    input = 'Mrs. Dameon C. Thiel 223-109-2182 x381'
    output =  ['Mrs.', 'Dameon', 'C.', 'Thiel', '', '223.109.2182', '381']
    format_method(input).should == output
  end

  it 'should format a string input to an Array' do
    input = 'Miss Clifton Cummerata-Smith 816.364.7371'
    output =  ['Miss', 'Clifton', '','Cummerata-Smith', '', '816.364.7371', '7371']
    format_method(input).should == output
  end

  it 'should format a string input to an Array' do
    input = 'Caitlyn R. Corwin DVM (652)817-0236 x47143'
    output =  ['', 'Caitlyn', 'R.', 'Corwin', 'DVM', '652.817.0236', '47143']
    format_method(input).should == output
  end

  it 'should format a string input to an Array' do
    input = 'Mrs. Bud Lance Stark-Hand Jr. 702.554.6812 x9684'
    output =  ['Mrs', 'Bud', 'Lance', 'Stark-Hand', 'Jr.', '702.554.6812', '9684']
    format_method(input).should == output
  end
end

describe 'compare the clean file output vs the expected output' do

  let (:runclean) { `ruby clean.rb -p prefix_words.txt -s suffix_words.txt -i raw_customers.txt -o customers.csv` 

  it 'creates the output correctly' do
    runclean
    expect(FileUtils.identical? '../expected_output.csv',
                                '../customers.csv').to be_true
  end

end



