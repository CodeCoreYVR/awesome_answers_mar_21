require 'rails_helper'
RANDOM_HUNDRED_CHARS='Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world'

RSpec.describe JobPost, type: :model do
  describe 'validates' do
      # Given
      # When
      # Then
      describe 'title' do
        it 'requires a title' do
          # Given
          job_post=FactoryBot.build(:job_post,title: nil)
          # When
          job_post.valid?
          # Then
          # expect is a method and the is passed to it that we are asserting
          # we can chain .to()
          # .to() accepts a assertion / expectation clause
          expect(job_post.errors.messages).to(have_key(:title))
        end
        it 'title is unique' do
          # Given
          persisted_job_post=FactoryBot.create(:job_post)
          job_post=FactoryBot.build(:job_post, title: persisted_job_post.title)
          # When
          job_post.valid?
          # Then
          expect(job_post.errors.messages).to(have_key(:title))
        end
      end
      describe 'description' do
        it "requires a description" do
          # Given
          job_post=FactoryBot.build(:job_post,description: nil)
          # When
          job_post.valid?
          # Then
          expect(job_post.errors.messages).to(have_key(:description))
        end
        it 'must be larger than 100 characters' do
          # given
          job_post= FactoryBot.build(:job_post,description: 'less than 100')
          # when
          job_post.valid?
          # then
          expect(job_post.errors.messages).to(have_key(:description))
        end
      end
      describe 'location' do
        it "is required " do
          job_post=FactoryBot.build(:job_post,location: nil)
          job_post.valid?
          expect(job_post.errors.messages).to(have_key(:location))
        end
      end
      describe 'min_salary' do
        it 'salary_min must be a number greater than 30_000' do
          # Given
          job_post=FactoryBot.build(:job_post,min_salary: 25_000)
          # When
          job_post.valid?
          # Then
          expect(job_post.errors.details[:min_salary][0][:error]).to(be(:greater_than_or_equal_to))
    # [7] pry(main)> job_post.errors.details
    # => {:min_salary=>[{:error=>:greater_than_or_equal_to, :value=>25000, :count=>30000}]}
        end
      end
  end
end
