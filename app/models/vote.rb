class Vote < ActiveRecord::Base
    before_save :save_as_json
    validates :title, presence: true, length: { minimum: 5, maximum: 70 }
    validates :options, presence: true
    belongs_to :user
end

def save_as_json
    self.options = self.options.split(',').to_json
end
