get '/questions/:question_id/votes/new' do
  question = Question.find(params[:question_id])
  question.votes.create(voter: current_user)
  redirect "/questions/#{question.id}"
end
