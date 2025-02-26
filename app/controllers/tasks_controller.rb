class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @tasks = Task.all
  end

  def create
    if session["user_id"] != nil 
    @task = Task.new
    @task["description"] = params["description"]
    @task.save
    redirect_to "/tasks"
    else
      redirect_to "/login"
  end

  def destroy
    @task = Task.find_by({ "id" => params["id"] })
    @task.destroy
    redirect_to "/tasks"
  end

