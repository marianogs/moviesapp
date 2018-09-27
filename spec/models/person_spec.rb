require 'rails_helper'

describe Person, type: :model do

  describe 'validations' do
    context("without name") do
      it{ expect(build(:person,first_name: nil)).to be_invalid }
    end
    context("without aliases") do
      it{ expect(build(:person,aliases: nil)).to be_invalid }
    end

    context("without last_name") do
      it{ expect(build(:person,last_name: nil)).to be_invalid }
    end
  end

  describe 'attributes' do
    subject { build :person }
    it { is_expected.to respond_to(:first_name) }
    it { is_expected.to respond_to(:last_name) }
    it { is_expected.to respond_to(:aliases) }
  end

  describe 'relations' do
    context 'as director' do
      subject { build :director }
      before do
        subject.add_movie(create(:movie),:director)
      end
      it do
        expect(subject.movies.count).to eq(1)
      end
    end
  end
end
