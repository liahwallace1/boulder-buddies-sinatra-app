class Helpers

  def self.current_user(session)
    User.find(session[:user_id])
  end

  def self.logged_in?(session)
    !![session[:user_id]]
  end

  def self.state_array
  %w(AK AL AR AZ CA CO CT DC DE FL GA HI IA ID IL IN KS KY LA MA MD ME MI MN MO MS MT NC ND NE NH NJ NM NV NY OH OK OR PA RI SC SD TN TX UT VA VT WA WI WV WY)
end

end
