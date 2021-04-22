require 'rails_helper'

RSpec.describe JobPost, type: :model do
  describe 'validates' do
      # Given
      # When
      # Then
    it 'requires a title' do
      # Given
      job_post=JobPost.new
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
      persisted_job_post=JobPost.create(title:'full stack dev', description: "Hello world" , min_salary: 35_000)
      job_post=JobPost.new(title: persisted_job_post.title, description: "hello world", min_salary: 35_000 )
      # When
      job_post.valid?
      # Then
      expect(job_post.errors.messages).to(have_key(:title))

    end
    it "requires a description" do
      # Given
      job_post=JobPost.new
      # When
      job_post.valid?
      # Then
      expect(job_post.errors.messages).to(have_key(:description))

    end
    it 'salary_min must be a number greated than 30_000' do
      # Given
      job_post=JobPost.new(min_salary: 25_000)
      # When
      job_post.valid?
      # Then
      expect(job_post.errors.detail[:min_salary][0][:error]).to(be(:greater_than_or_equal_to))
    end
  end
end
