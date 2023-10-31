class ContactController < ApplicationController
  def index

  end

  def new
  end

  def submitted
    @contact = Contact.find(params[:id])
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
    redirect_to submitted_contact_path(@contact)
    else
      render 'new'
    end

  end

  private def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end
end
