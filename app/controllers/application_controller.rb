#require_relative '../views/view'
require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"

class ApplicationController < Sinatra::Base

  # def initialize
  #   binding.pry
  #   csv = '/home/sheila/code/smayrhof3r/sinatra-cookbook/app/models/recipes.csv'
  #   @cookbook = Cookbook.new(csv)
  #   super
  # end

  configure do
    set :views, "app/views"
    set :public_dir, "public"
  end

  # configure :development do
  #   use BetterErrors::Middleware
  #   BetterErrors.application_root = File.expand_path('..', __FILE__)
  # end

  get '/' do
    # csv = '/home/sheila/code/smayrhof3r/sinatra-cookbook/app/models/recipes.csv'
    # @@cookbook = Cookbook.new(csv)
   erb :index
  end

  get '/action/list' do
    csv = '/home/sheila/code/smayrhof3r/sinatra-cookbook/app/models/recipes.csv'
    #cookbook = Cookbook.new(csv)
    @recipes = Cookbook.new(csv).recipes
    erb :list
  end
end

  # def create(recipe_details = nil)
  #   recipe_details ||= @view.request_recipe_details

  #   recipe = Recipe.new(*recipe_details)
  #   @cookbook.add_recipe(recipe)
  # end

  # def destroy
  #   list
  #   @cookbook.remove_recipe(@view.request_recipe_index)
  # end

  # def mark_done
  #   list
  #   @cookbook.mark_complete(@view.request_recipe_index)
  # end