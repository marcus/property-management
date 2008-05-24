class RenameMembersMemberships < ActiveRecord::Migration
  def self.up
    rename_table "members", "memberships"
  end

  def self.down
    rename_table "memberships", "members"
  end
end
