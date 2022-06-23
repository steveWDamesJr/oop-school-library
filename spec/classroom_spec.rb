$LOAD_PATH << '.'
require 'spec_helper'

describe Classroom do
  it 'Create a new classroom' do
    @new_class = Classroom.new('Ruby Class')
    expect(@new_class.label).to eq('Ruby Class')
  end
end
