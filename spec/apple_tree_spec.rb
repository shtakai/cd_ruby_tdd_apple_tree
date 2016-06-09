require_relative '../lib/apple_tree'

RSpec.describe 'assignment apple tree' do
  before do
    @apple_tree = AppleTree.new
  end

  context AppleTree do
    it 'have height and age' do
      expect(@apple_tree).to respond_to(:height)
      expect(@apple_tree).to respond_to(:age)
      expect(@apple_tree.height).to be_kind_of Numeric
      expect(@apple_tree.age).to be_kind_of Numeric
    end

    it 'can call how_many_apples' do
      expect(@apple_tree).to respond_to(:count_apples)
      expect(@apple_tree.count_apples).to be(0)
    end

    it 'call year_gone -> increase age by 1 and height' do
      height = @apple_tree.height
      expect{@apple_tree.year_gone}.to change(@apple_tree, :age).by(1)
      expect(@apple_tree.height).to be > height
    end

    it 'can\'t grow apples 3yrs after creation' do
      3.times{@apple_tree.year_gone}
      expect(@apple_tree.count_apples).to eq(0)
    end

    it 'can pick_apples (take all apples)' do
      10.times{@apple_tree.year_gone}
      expect(@apple_tree.count_apples).to be > 0
      expect(@apple_tree.pick_apples.size).to be > 0
      expect(@apple_tree.count_apples).to eq 0
    end

    it 'decays after 10yrs (not grow apples)' do
      10.times{@apple_tree.year_gone}
      expect{
        @apple_tree.year_gone
      }.to change(@apple_tree, :count_apples).by(0)
    end
  end

end

