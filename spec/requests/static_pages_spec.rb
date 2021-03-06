require 'spec_helper'

describe "Static pages" do
  
  subject{ page }

  describe "Home page" do
    before{visit root_path}

    it { should have_content('UVP-Manager') }
    it { should have_title ('UVP-Manager App') }
    it { should have_title ("Home") }
  end

  describe "Help page" do
    before{visit help_path}

    it { should have_content('Help') }
    it { should have_title('UVP-Manager App') }
    it { should have_title('Help') }
  end

  describe "About page" do
    before{visit about_path}

    it { should have_content('About') }
    it { should have_title('UVP-Manager App') }
    it { should have_title('About') }
  end

  describe "Impressum page" do
    before { visit impressum_path }

    it { should have_content('Impressum') }
    it { should have_title('Impressum') }
  end
end

