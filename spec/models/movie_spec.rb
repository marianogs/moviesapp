require 'rails_helper'

describe Movie, type: :model do

  describe 'attributes' do
    subject { build :movie }
    it { is_expected.to respond_to(:title) }
    it { is_expected.to respond_to(:release_year) }
  end

  describe 'relations' do
    context 'when have casting' do
      let(:subject){ create(:movie_with_people) }
      it do
        expect(subject.casting.first.aliases).to eq('Clint Eastwood')
      end
    end

    context 'when have director' do
      let(:subject){ create(:movie_with_people) }
      it do
        expect(subject.directors.first.aliases).to eq('Clint Eastwood')
      end
    end

    context 'when have producers' do
      let(:subject){ create(:movie_with_people) }
      it do
        expect(subject.producers.first.aliases).to eq('Clint Eastwood')
      end
    end
  end

end
