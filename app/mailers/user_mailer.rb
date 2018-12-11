class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.tripconfirm.subject
  #
  def tripconfirm(user)
    # Instance variable => available in view
    # @trip = trip
    @trip = Trip.find(user.trip_id)
    @user = User.find(user.user_id)
    # @trip.user = @trip

# This will render a view in `app/views/user_mailer`!
    mail(to: @user.email, subject: 'Your trip is confirmed!')
  end
end
