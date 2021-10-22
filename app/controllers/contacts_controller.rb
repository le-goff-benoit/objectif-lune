class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params.require(:contact).permit(:name, :email, :message))
    if @contact.save!
      redirect_to root_path
    end
  end
end
