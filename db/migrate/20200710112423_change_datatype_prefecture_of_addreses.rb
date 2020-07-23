class ChangeDatatypePrefectureOfAddreses < ActiveRecord::Migration[6.0]
  def change
    change_column :addresses, :prefecture, :string
  end
end
