class StaticPagesController < ApplicationController
before_action :initialize_contact, only: [:contact]
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
    @Contact = Contact.new(contact_params)
  end

  def send_contact
    if create_contact.save
      ContactMailer.send_contact_email(create_contact).deliver_now
      
      flash[:success] = "Your information was submitted sucessfully Thank you for your submission"
      redirect_to contact_path
    else
      flash[:error] = 'Error saving contact information.'
      flash[:error_messages] = create_contact.errors.full_messages.join(',')
      render :contact
    end
  end


  private

  def initialize_contact
    @contact = Contact.new
  end


     def contact_params
    params.require(:contact).permit(:name, :email, :phonenumber, :select_service_type, :message)
  end
end  
