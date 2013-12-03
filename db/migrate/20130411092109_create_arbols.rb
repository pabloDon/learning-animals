class CreateArbols < ActiveRecord::Migration
  def change
    create_table :arbols do |t|
      t.string :carga
      t.integer :izquierda
      t.integer :derecha

      t.timestamps
    end
  end
end
