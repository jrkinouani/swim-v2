class SelectedResaController < ApplicationController

  respond_to :js

  def create
    @resource_klass = params[:resource_type].gsub('_id', '').capitalize.constantize.find(params[:resource_id])
    @selected_resa = SelectedResa.where(user_id: current_user.id, resource_id: params[:resource_id], resource_type: params[:resource_type].gsub('_id', '').capitalize)
    @selected_resa_count = params[:resource_name].constantize.where(params[:resource_type] => params[:resource_id], user_id: current_user.id).sum(:nb_resa) - @selected_resa.count
    @selected_resa_date = @resource_klass.nbpers - SelectedResa.where(resource_id: params[:resource_id], resource_type: params[:resource_type].gsub('_id', '').capitalize).where("date = ? AND title = ?", DateTime.parse(params[:date]), params[:title]).count
    if @selected_resa_count > 0 && @selected_resa_date > 0
      SelectedResa.create(date: params[:date], user_id: current_user.id, resource_id: params[:resource_id], title: params[:title], resource_type: params[:resource_type].gsub('_id', '').capitalize)
      @selected_resa_count -= 1
    end
    @resa_url = params[:resa_url]
    @resource_name = params[:resource_name]
    @resource_type = params[:resource_type]
    render partial: 'selected_resa_list.js.erb'
  end

  def destroy
    @resa = SelectedResa.find(params[:id])
    @resa.destroy
    @selected_resa = SelectedResa.where(user_id: @resa.user_id, resource_id: @resa.resource_id, resource_type: params[:resource_type].gsub('_id', '').capitalize)
    @selected_resa_count = params[:resource_name].constantize.where(params[:resource_type] => @resa.resource_id, user_id: current_user.id).sum(:nb_resa) - @selected_resa.count
    @resa_url = params[:resa_url]
    @resource_name = params[:resource_name]
    @resource_type = params[:resource_type]
    render partial: 'selected_resa_list.js.erb'
  end
end
