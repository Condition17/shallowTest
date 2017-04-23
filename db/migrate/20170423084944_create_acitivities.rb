class CreateAcitivities < ActiveRecord::Migration[5.0]
  def change
    create_table :acitivities do |t|

      t.timestamps
    end
  end
end
