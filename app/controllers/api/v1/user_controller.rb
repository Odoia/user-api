module Api
  module V1
    class UserController < ApplicationController

      def index
        result = ::User.all
        render status: 200, json: { data: result }
      end

      def create
        result = ::User.create.tap do |u|
          u.name = params['user']['name']
          u.age = params['user']['age']
          u.cpf = params['user']['cpf']
          u.save
        end

        if result.errors.blank?
          render status: 201, json: { data: result }
        else
          render status: 400
        end
      end
    end
  end
end
