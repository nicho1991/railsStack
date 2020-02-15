# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :items,
          [Types::ItemType],
          null: false,
          description: 'Returns a list of items in the martian library'

    field :users,
          [Types::UserType],
          null: false,
          description: 'Returns users from the application'

    field :me,
          Types::UserType,
          null: true

    def me
      context[:current_user]
    end

    def items # resolver method
      Item.preload(:user)
    end

    def users
      User.all()
    end
  end
end
