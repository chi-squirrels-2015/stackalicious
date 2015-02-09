
post '/questions/:question_id/answers' do
  answer = Answer.create(answer: params[:answer], creator: current_user, question: Question.find(params[:question_id]))
  redirect "/questions/#{params[:question_id]}"
end
