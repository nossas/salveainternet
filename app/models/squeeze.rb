class Squeeze < ActiveRecord::Base
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  after_create { self.delay.add_to_mailchimp_segment }
  after_validation { self.city = Geocoder.search(self.ip).first.try(:city) }

  def add_to_mailchimp_segment
    if !Rails.env.test?
      begin
        Gibbon::API.lists.subscribe(id: ENV["MAILCHIMP_LIST_ID"], email: {email: self.email}, merge_vars: {FNAME: self.first_name, LNAME: self.last_name, CITY: self.city}, double_optin: false, update_existing: true)
        Gibbon::API.lists.static_segment_members_add(id: ENV["MAILCHIMP_LIST_ID"], seg_id: ENV["MAILCHIMP_SEGMENT_ID"], batch: [{email: self.email}])
      rescue Exception => e
        Rails.logger.error e
      end
    end
  end
end
