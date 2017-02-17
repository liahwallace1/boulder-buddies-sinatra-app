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

  def self.grade_array
    %w(V0 V1 V2 V3 V4 V5 V6 V7 V8 V9 V10 V11 V12 V13 V14 V15 V16)
  end

end
