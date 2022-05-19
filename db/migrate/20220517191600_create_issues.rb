class CreateIssues < ActiveRecord::Migration[7.0]
  def change
    create_table :issues do |t|
      t.text :message
      t.boolean :is_done
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
