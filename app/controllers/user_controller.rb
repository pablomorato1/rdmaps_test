class UserController < ApplicationController
  def new
    object
    config_fields
  end

  def create
    if object.valid?
      object.save
      flash[:info] = 'Criado com sucesso!'
      redirect_to new_user_path
    else
      flash[:error] = 'Erro ao salvar. Tente novamente!'
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def object
    @object ||= params[:id].present? ? config_model.find(params[:id]) : config_model.new(object_params)
  end

  def config_model
    User
  end

  def object_params
    params.fetch(:user, {}).permit(:name, :email, :password)
  end

  def config_fields
    @config = {
      model: :user,
      form_fields: [
        { name: :name },
        { name: :email, type: :email },
        { name: :password, type: :password }
      ]
    }
  end
end
