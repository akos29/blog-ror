require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name:'Abebe',photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')}

  before { subject.save }

  it 'name must not be blank' do
    subject.name = nil
    expect(subject).to_not be_valid 
  end
  
  it 'posts counter must be greater than or equal to 0' do
    subject.posts_count = -1
    expect(subject).to_not be_valid 
  end
end
