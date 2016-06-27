require 'spec_helper'

describe Person do

  it 'can be created' do
    person = create :person
    expect(person).to_not be_nil
  end

  it 'needs tests to be written!' do
    pending('write tests for Person!')
  end

end
