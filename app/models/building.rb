class Building < ActiveRecord::Base
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true, inclusion: { in: %w(
    AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA 
    ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK 
    OR PA RI SC SD TN TX UT VT VA WA WV WI WY) }
  validates :postal_code, presence: true, length: { is: 5 }
end
