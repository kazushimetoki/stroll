class Public::PostWorkoustsController < ApplicationController
  
  def show
   
  end
  
  def edit
    @post_workout = PostWorkout.find(params[:id])
    @tag_list = @post_workout.workout_tags.pluck(:name).join(',')
  end
  
  def update
    @post_workout = PostWorkout.find(params[:id])
    tag_list=params[:post_workout][:name].split(',')
    if @post_workout.update(post_workout_params)
      @post_workout.save_workout_tags(tag_list)
      redirect_to post_workouts_path
    else
      render :edit
    end
  end
  
  def create
    @post_workout = PostWorkout.new(post_workout_params)
    @post_workout.end_user_id = current_end_user.id
     # 受け取った値を,で区切って配列にする
    tag_list = params[:post_workout][:name].split(',')
    if @post_workout.save
      @post_workout.save_workout_tags(tag_list)
      redirect_to post_workouts_path, notice:'投稿が完了しました'
    else
      render :new
    end
  end
  
  def search_tag
    #検索結果画面でもタグ一覧表示
    @tag_list = WorkoutTag.all
    　#検索されたタグを受け取る
    @tag = WorkoutTag.find(params[:workout_tag_id])
    　#検索されたタグに紐づく投稿を表示
    @post_workouts = @tag.post_workouts
  end
end
