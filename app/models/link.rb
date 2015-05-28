class Link < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  validates :long_url, presence: true, format: {:with => URI.regexp}
  before_save :shorten_url

  def shorten_url
    #logic to shorten the url
    range = [*"0".."9", *"a".."z", *"A".."Z"]
    sequence = Array.new(6){range.sample}.join
    self.short_url = "/#{sequence}"
  end
end

