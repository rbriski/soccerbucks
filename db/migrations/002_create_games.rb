Sequel.migration do
  up do
    create_table(:games) do
      primary_key :id
      DateTime :scheduled_at
      String :opponent
    end
  end

  down do
    drop_table(:games)
  end
end