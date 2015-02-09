get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end

get '/questions/new' do
  erb :"questions/new"
end

post '/questions' do
  question = Question.create(question: params[:question], creator: current_user)

  if question.valid?
    flash[:notice] = "Question Created"
    redirect "/questions/#{question.id}"
  else
    flash[:errors] = question.errors.full_messages
    redirect '/questions/new'
  end
end

get '/questions/:question_id' do
  @question = Question.find(params[:question_id])
  erb :'questions/show'
end

get '/questions/:question_id/edit' do
  @question = Question.find(params[:question_id])
  if @question.creator == current_user
    erb :'questions/edit'
  else
    flash[:notice] = "you cant do that."
    redirect "/questions/#{@question.id}"
  end
end

put '/questions/:question_id' do
  question = Question.find(params[:question_id])
  if question.creator == current_user
    question.update(question: params[:question])
    if question.valid?
      flash[:notice] = "Update saved"
      redirect "/questions/#{question.id}"
    else
      flash[:errors] = question.errors.full_messages
      redirect "/questions/#{question.id}/edit"
    end
  else
    redirect "/questions/#{question.id}"
  end
end

delete '/questions/:question_id' do
  question = Question.find(params[:question_id])
  if question.creator == current_user
    question.destroy
    redirect '/questions'
  else
    flash[:notice] = "you cant do that."
    redirect "/questions/#{question.id}"
  end
end
