class CreateMates < ActiveRecord::Migration
  def change
    create_table :mates do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.date :birthday
      t.string :city
      t.string :random_note
      t.string :like
      t.string :dislike
      t.string :motivation
      t.string :significant_other
      t.string :job
      t.string :drunk_convo
      t.string :favorite_drink
      t.string :quirk
      t.string :inspiration
      t.string :accomplishment
      t.string :travel_destination
      t.string :ideal_day
      t.references :user ##changed from belongs to

    end
  end
end
