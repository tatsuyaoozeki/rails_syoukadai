class ContactsController < ApplicationController
  def index

  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to new_contact_path, notice: "お問い合わせをいただきありがとうございます。\n回答につきましては改めてご連絡いたします。"
    else
      render 'new'
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end
end
