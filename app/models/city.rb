class City < ActiveRecord::Base
  belongs_to :question
  belongs_to :url
end
