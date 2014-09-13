require 'spec_helper'

describe "Static pages" do
  subject { page }
  let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }

    # it "should have the right links on the layout" do
    #   visit root_path
    #   click_link "About"
    #   expect(page).to have_title(full_title('About Us'))
    #   click_link "Help"
    #   expect(page).to have_title(full_title('Help'))
    #   click_link "Contact"
    #   expect(page).to have_title(full_title('Contact'))
    #   click_link "Home"
    #   click_link "Sign up now!"
    #   expect(page).to have_title(full_title("Sign up now!"))
    # end
  end

  describe "Home page" do
    before { visit root_path }
    it { should have_content('Sample App')}
    it { should have_title("#{base_title} | Home")}
  end

  describe "Help page" do
    let(:heading) { "Help" }
    let(:page_title) { "Help" }

    before { visit help_path }

    it_should_behave_like("all static pages")
  end

  describe "About page" do
    let(:heading) { "About" }
    let(:page_title) { "About" }

    before { visit about_path }

    it_should_behave_like("all static pages")
  end

  describe "Contact page" do
    let(:heading) { "Contact" }
    let(:page_title) { "Contact" }

    before { visit contact_path }

    it_should_behave_like("all static pages")  end
end
