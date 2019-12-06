require "rails_helper"

RSpec.describe "form errors", type: :system do
  it "error messages for new resource" do
    visit new_admin_customer_path
    fill_in("Name", with: "")
    click_on "Create Customer"

    expect(page).to have_content "Name can't be blank"
  end

  it "error messages for editing resource" do
    customer = create(:customer)

    visit edit_admin_customer_path(customer)
    fill_in("Name", with: "")
    click_on "Update Customer"

    expect(page).to have_content "Name can't be blank"
  end
end
