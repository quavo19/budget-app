# frozen_string_literal: true

class AddAuthorToExpenditures < ActiveRecord::Migration[7.0]
  def change
    add_reference :expenditures, :author, foreign_key: { to_table: :users }
  end
end
