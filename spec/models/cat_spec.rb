require 'rails_helper'

RSpec.describe Cat, type: :model do
  it 'has to contain a name' do
    cat = Cat.create age: 10, enjoys: 'everything about life', image: 'https://static.wikia.nocookie.net/meme/images/b/b0/Bingus.jpg/revision/latest/scale-to-width-down/1000?cb=20210501181828'
    expect(cat.errors[:name]).to_not be_empty
  end
  it 'has to contain an age' do
    cat = Cat.create name: 'bingus', enjoys: 'everything about life', image: 'https://static.wikia.nocookie.net/meme/images/b/b0/Bingus.jpg/revision/latest/scale-to-width-down/1000?cb=20210501181828'
    expect(cat.errors[:age]).to_not be_empty
  end
  it 'has to contain an enjoys' do
    cat = Cat.create name: 'bingus', age: 10, image: 'https://static.wikia.nocookie.net/meme/images/b/b0/Bingus.jpg/revision/latest/scale-to-width-down/1000?cb=20210501181828'
    expect(cat.errors[:enjoys]).to_not be_empty
  end
  it 'has to contain an image' do
    cat = Cat.create name: 'bingus', age: 10, enjoys: 'everything about life'
    expect(cat.errors[:image]).to_not be_empty
  end
  it 'must have at least 10 characters in enjoys' do
    cat = Cat.create name: 'bingus', age: 10, enjoys: 'life', image: 'https://static.wikia.nocookie.net/meme/images/b/b0/Bingus.jpg/revision/latest/scale-to-width-down/1000?cb=20210501181828'
    expect(cat.errors[:enjoys]).to_not be_empty
  end
end