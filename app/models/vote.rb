class Vote < ActiveRecord::Base
    before_save :save_as_json
    validates :title, presence: true, length: { minimum: 5, maximum: 70 }
    validates :options, presence: true
    belongs_to :user
    def count_total
        total = 0
        obj = JSON.parse(self.vote_count)
        obj.each do |k,v|
        total += v
        end
        total
    end
end

def save_as_json
    create_count(self.options)
end
def create_count(opt)
    arr = JSON.parse(opt)
    obj = {}
    arr.each do |item|
        obj[item] = 0
    end
    self.vote_count = obj.to_json
end