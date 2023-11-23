class StaticPagesController < ApplicationController
  def home
    render 'home'
  end

  def about
    render 'about'
  end

  def services
    render 'services'
  end

  def create_contact
    @contact = Contact.new

    if @contact.save
      flash[:success] = "Your message was sucessfully sent"
      redirect_to contact_path
    else
      flash[:error] = "Error sending message, please fix the following errors"
      flash[:error_messages] = @contact.errors.full_messages
      render :contact
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :phonenumber, :select_service_type, :message)
  end

end
