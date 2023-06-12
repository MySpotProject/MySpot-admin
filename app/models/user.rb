# frozen_string_literal: true

class User < ActiveRecord::Base
    # extend Devise::Models
    # devise :database_authenticatable, :registerable,
    #        :recoverable, :rememberable, :validatable
    # include DeviseTokenAuth::Concerns::User
  
    has_one_attached :avatar
    # has_many :accounts, dependent: :destroy
    has_many :spot_ratings
    has_many :user_ratings
    has_many :comments
    # has_many :accounts, dependent: :destroy
  end
  