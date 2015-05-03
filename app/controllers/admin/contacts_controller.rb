class Admin::ContactsController < Admin::BaseController

  respond_to :html

  before_action :find_contact, only: %i[ show edit update delete destroy ]

  def index
    @contacts = Contact.all
    respond_with @contacts
  end

  def new
    @contact = Contact.new
    respond_with @contact
  end

  def create
    @contact = Contact.create(contact_params)
    respond_with @contact, location: [ :admin, @contact ]
  end

  def show
    respond_with @contact
  end

  def edit
    respond_with @contact
  end

  def update
    @contact.update(contact_params)
    respond_with @contact, location: [ :admin, @contact ]
  end

  def delete
    respond_with @contact
  end

  def destroy
    @contact.destroy
    respond_with @contact, location: [ :admin, :contacts ]
  end

private

  def find_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:label, :url, :value)
  end

end
