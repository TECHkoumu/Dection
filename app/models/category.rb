class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '悪いあの人' },
    { id: 3, name: 'かわいそうな私' }

  ]

  include ActiveHash::Associations
  has_many :emotions
end