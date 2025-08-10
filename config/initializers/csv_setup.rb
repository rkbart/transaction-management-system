require "csv"
require "fileutils"

CSV_FILE_PATH = Rails.root.join("storage", "transactions.csv").freeze

# Sample transaction data
SAMPLE_TRANSACTIONS = [
  ['Transaction Date', 'Account Number', 'Account Holder Name', 'Amount', 'Status'],
  ['2025-03-01', '7289-3445-1121', 'Maria Johnson', '150.00', 'Settled'],
  ['2025-03-02', '1122-3456-7890', 'John Smith', '75.50', 'Pending'],
  ['2025-03-03', '3344-5566-7788', 'Robert Chen', '220.25', 'Settled'],
  ['2025-03-04', '8899-0011-2233', 'Sarah Williams', '310.75', 'Failed'],
  ['2025-03-04', '9988-7766-5544', 'David Garcia', '45.99', 'Pending'],
  ['2025-03-05', '2233-4455-6677', 'Emily Taylor', '500.00', 'Settled'],
  ['2025-03-06', '1357-2468-9012', 'Michael Brown', '99.95', 'Settled'],
  ['2025-03-07', '5551-2345-6789', 'Jennifer Lee', '175.25', 'Pending'],
  ['2025-03-08', '7890-1234-5678', 'Thomas Wilson', '62.50', 'Failed'],
  ['2025-03-08', '1212-3434-5656', 'Jessica Martin', '830.00', 'Settled'],
  ['2025-03-09', '9876-5432-1011', 'Christopher Davis', '124.75', 'Pending'],
  ['2025-03-10', '4646-8282-1919', 'Amanda Robinson', '300.50', 'Settled']
].freeze

unless File.exist?(CSV_FILE_PATH)
  # Create storage directory if it doesn't exist
  FileUtils.mkdir_p(Rails.root.join("storage"))

  # Generate the CSV file
  CSV.open(CSV_FILE_PATH, 'w') do |csv|
    SAMPLE_TRANSACTIONS.each do |row|
      csv << row
    end
  end

  Rails.logger.info "Created transactions.csv file with sample data: #{CSV_FILE_PATH}"
else
  Rails.logger.info "transactions.csv file already exists: #{CSV_FILE_PATH}"
end
