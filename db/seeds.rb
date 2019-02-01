t = Test.create(:name => "Electrical safety")

q = Question.create(:text => "Which objects are ok to still into the electrical outlet?")
q.answers << Answer.create(:text => "Fork")
q.answers << Answer.create(:text => "Kinves")
q.answers << Answer.create(:text => "Electrical cords", :is_correct => true)
q.save
t.questions << q

q = Question.create(:text => "Which objects are not ok to still into the electrical outlet?")
q.answers << Answer.create(:text => "Fork", :is_correct => true)
q.answers << Answer.create(:text => "Kinves", :is_correct => true)
q.answers << Answer.create(:text => "Kittens", :is_correct => true)
q.save
t.questions << q

admin = User.create(:first_name => "ad", :last_name => "min", :email => "brad.schrag@gmail.com" :phone_number => "479-799-2325", :password_digest => BCrypt::Password.create('admin'), :is_admin => true)