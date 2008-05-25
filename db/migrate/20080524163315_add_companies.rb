class AddCompanies < ActiveRecord::Migration
  def self.up
    create_table 'companies' do |t|
      t.string  :name
      t.text    :description
      t.string  :email
      t.string  :logo_file_name
      t.string  :logo_content_type
      t.integer :logo_file_size
    end
  end

  def self.down
    drop_table 'companies'
  end
end
