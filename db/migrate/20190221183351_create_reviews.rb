class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :author_id
      t.integer :subject_id
      t.integer :engagement_score
      t.text :engagement_notes
      t.integer :collaboration_score
      t.text :collaboration_notes
      t.integer :curiosity_score
      t.text :curiosity_notes
      t.integer :comfort_zone_score
      t.text :comfort_zone_notes
      t.integer :teaming_score
      t.text :teaming_notes
      t.integer :dissertation_score
      t.text :dissertation_notes
      t.integer :concepts_score
      t.text :concepts_notes
      t.integer :practices_score
      t.text :practices_notes
      t.text :notes

      t.timestamps
    end
  end
end
