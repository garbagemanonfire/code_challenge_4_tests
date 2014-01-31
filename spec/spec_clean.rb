require './spec_helper.rb'
require '../clean.rb'

def delete_files
  FileUtils.rm_r %w( ../input.txt ../expected_output.csv ../customers.csv)
end

describe 'test clean file output vs expected output w/o phone' do
  -setup connection to files
  -invoke commands on prompt
  let (:runclean) { `ruby clean.rb -p prefix_words.txt -s suffix_words.txt -i raw_customers.txt -o customers.csv` 

  it 'should format a string input to an Array' do
    input = 'Mr. Jenkins 1.155.258.9944'
    output =  ['Mr.', '', '', 'Jenkins', '', '155.258.9944', '']
    Cleanrb.new.format(input).should == output
  end

  it 'should format a string input to an Array' do
    input = 'Mrs. Dameon C. Thiel 223-109-2182 x381'
    output =  ['Mrs.', 'Dameon', 'C.', 'Thiel', '', '1.223.109.2182', 'x381']
    Cleanrb.new.format(input).should == output
  end

  it 'should format a string input to an Array' do
    input = 'Miss Clifton Cummerata-Smith 816.364.7371'
    output =  ['Miss', 'Clifton', 'Cummerata-Smith', '', '1.816.364.7371', '7371']
    Cleanrb.new.format(input).should == output
  end

  it 'should format a string input to an Array' do
    input = 'Caitlyn R. Corwin DVM (652)817-0236 x47143'
    output =  ['', 'Caitlyn', 'R.', 'Corwin', 'DVM', '1.652.817.0236', 'x47143']
    Cleanrb.new.format(input).should == output
  end

  it 'should format a string input to an Array' do
    input = 'Mrs. Bud Lance Stark-Hand Jr. 702.554.6812 x9684'
    output =  ['Mrs', 'Bud', 'Lance', 'Stark-Hand', 'Jr.', '702.554.6812', 'x9684']
    Cleanrb.new.format(input).should == output
  end
end

describe 'test clean file output vs expected output w/o phone' do
  -setup connection to files
  -invoke commands on prompt
  let (:runclean) { `ruby clean.rb -p prefix_words.txt -s suffix_words.txt -i raw_customers.txt -o customers.csv` 

  it 'should format a string input to an Array' do
    input = 'Mr. Jenkins 1.155.258.9944'
    output =  ['Mr.', '', '', 'Jenkins', '', '155.258.9944', '']
    Cleanrb.new.format(input).should == output
  end

  it 'should format a string input to an Array' do
    input = 'Mrs. Dameon C. Thiel 223-109-2182 x381'
    output =  ['Mrs.', 'Dameon', 'C.', 'Thiel', '', '223.109.2182', '381']
    Cleanrb.new.format(input).should == output
  end

  it 'should format a string input to an Array' do
    input = 'Miss Clifton Cummerata-Smith 816.364.7371'
    output =  ['Miss', 'Clifton', 'Cummerata-Smith', '', '816.364.7371', '7371']
    Cleanrb.new.format(input).should == output
  end

  it 'should format a string input to an Array' do
    input = 'Caitlyn R. Corwin DVM (652)817-0236 x47143'
    output =  ['', 'Caitlyn', 'R.', 'Corwin', 'DVM', '652.817.0236', '47143']
    Cleanrb.new.format(input).should == output
  end

  it 'should format a string input to an Array' do
    input = 'Mrs. Bud Lance Stark-Hand Jr. 702.554.6812 x9684'
    output =  ['Mrs', 'Bud', 'Lance', 'Stark-Hand', 'Jr.', '702.554.6812', '9684']
    Cleanrb.new.format(input).should == output
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



