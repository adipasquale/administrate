require "rails_helper"

RSpec.describe "log entry show page", type: :system do
  it "displays logeable information" do
    log_entry = create(:log_entry)

    visit admin_log_entry_path(log_entry)

    expect(page).to have_content(log_entry.action)
    expect(page).to have_content(displayed(log_entry.logeable))
  end

  it "links to logeable", :js do
    log_entry = create(:log_entry)

    visit admin_log_entry_path(log_entry)
    click_on(displayed(log_entry.logeable))

    expect(page).to have_header(displayed(log_entry.logeable))
  end
end
