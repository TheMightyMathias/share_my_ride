class UserMailer < ApplicationMailer
  def tripconfirm(user)
    @trip = Trip.find(user.trip_id)
    @user = User.find(user.user_id)
    mail(to: @user.email, subject: 'You joined a trip!')
    @owner = User.find(@trip.user_id)
    mail(to: @owner.email, subject: "Someone joined your trip!")
    @trip.ridemates.each do |ridemate|
      if ridemate.user_id != @user.id
        @ridemates = (User.find(ridemate.user_id)).email
        mail(to: user.email, subject: 'The trip has been updated!')
      end
    end
  end
end
