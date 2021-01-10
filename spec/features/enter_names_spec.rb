feature 'Enter names' do
  scenario 'submitting names' do
    visit '/'
    fill_in 'player_1_name', with: 'Rachel'
    click_button 'Submit'
    expect(page).to have_content('Rachel, select your move!')
  end
end
