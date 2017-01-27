# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true

  has_many(
    :submitted_urls,
    class_name: "ShortenedUrl",
    foreign_key: :submitter_id,
    primary_key: :id
  )

  has_many(
    :visits,
    class_name: "Visit",
    foreign_key: :user_id,
    primary_key: :id
  )

  # This will repeat the same Shortened URL if it is visited multiple times.
  # To de-duplicate the results, uncomment the lambda below.
  has_many(
    :visited_urls,
    # -> { distinct },
    through: :visits,
    source: :shortened_url
  )
end
