class Project < ApplicationRecord
    validates_presence_of :title, :abstract, :description
  end
  