class MakeAttachmentsActAsList < ActiveRecord::Migration
  def self.up
    add_column "attachments", "position", :integer
  end

  def self.down
    remove_column "attachments", "position"
  end
end
