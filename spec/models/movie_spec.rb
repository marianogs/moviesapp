require 'rails_helper'

describe Movie, type: :model do

  describe 'attributes' do
    subject { build :movie }
    it { is_expected.to respond_to(:title) }
    it { is_expected.to respond_to(:release_year) }
  end

  describe '#roman_release_year' do
    it do
      expect(create(:movie).roman_release_year).to eq('MMVI')
    end
  end

  describe '#people' do
    let(:movie){ create(:movie_with_members) }
    context 'when director/actor/member is the same person' do
      it 'returns one person' do
        expect(movie.people.count).to eq(1)
      end
    end
    context 'when have two producers' do
      let(:person_2) { create(:person)} 
      before { movie.movie_roles.create!(name: :producer,person_id: person_2.id) }

      it 'returns two person' do
        expect(movie.people.count).to eq(2)
      end

      it 'returns producers' do
        expect(movie.producers.count).to eq(2)
      end
    end
  end

  describe 'relations' do
    context 'when have casting' do
      let(:subject){ create(:movie_with_members) }
      it do
        expect(subject.casting.first.aliases).to eq('Clint Eastwood')
      end
    end

    context 'when have director' do
      let(:subject){ create(:movie_with_members) }
      it do
        expect(subject.directors.first.aliases).to eq('Clint Eastwood')
      end
    end

    context 'when have producers' do
      let(:subject){ create(:movie_with_members) }
      it do
        expect(subject.producers.first.aliases).to eq('Clint Eastwood')
      end
    end
  end
end
