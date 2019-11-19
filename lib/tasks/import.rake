require 'csv'

namespace :import do

  desc 'Import merchants from csv file'
  task merchants: :environment do

    file = 'db/data/merchants.csv'

    CSV.foreach(file, headers: true) do |row|
      Merchant.create(row.to_hash)
    end
  end

  desc 'Import customers from csv file'
  task customers: :environment do

    file = 'db/data/customers.csv'

    CSV.foreach(file, headers: true) do |row|
      Customer.create(row.to_hash)
    end
  end
end
