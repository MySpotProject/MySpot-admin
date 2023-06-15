# frozen_string_literal: true

class User < ActiveRecord::Base
    # extend Devise::Models
    # devise :database_authenticatable, :registerable,
    #        :recoverable, :rememberable, :validatable
    # include DeviseTokenAuth::Concerns::User
  
    has_one_attached :avatar, dependent: :destroy
    has_many :spot_ratings, dependent: :destroy
    has_many :user_ratings, dependent: :destroy
    has_many :comments, dependent: :destroy
  end
  