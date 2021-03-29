class User < ApplicationRecord
  validates :name, presence: true
  validates :cpf, presence: true
  validates :age, presence: true
end
