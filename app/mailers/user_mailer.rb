class UserMailer < ApplicationMailer
    def new_apply_training(user, training)
        @training = training
        mail(to: user.email, subject: 'Tienes unas solicitud de entrenamiento!')
    end
end
