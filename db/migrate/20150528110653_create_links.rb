class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |l|
      l.string :long_url
      l.string :short_url
      l.integer :click_count
      l.integer :user_id
      l.datetime :created_at
    end
  end
end
