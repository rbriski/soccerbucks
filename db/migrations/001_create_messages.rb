Sequel.migration do
  up do
    run 'set timezone to "utc"'

    create_table(:messages) do
      primary_key :id
      DateTime :created_at
      String :event
      String :type
      Integer :campaign_id
      String :msisdn
      String :shortcode
      String :carrier
      Integer :carrier_id
      String :message
      String :subject
    end

    create_table(:images) do
      primary_key :id
      DateTime :created_at
      Integer :message_id
      String :path
    end

    run 'alter table messages alter created_at set default now()'
    run 'alter table images alter created_at set default now()'
  end

  down do
    drop_table(:messages)
    drop_table(:images)
  end
end