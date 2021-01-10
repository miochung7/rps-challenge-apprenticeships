feature 'Player option' do
  scenario 'can see all 3 moves' do
    visit '/'
    sign_in_and_play
    expect(page).to have_button('rock')
    expect(page).to have_button('paper')
    expect(page).to have_button('scissors')
  end

  scenario 'choose a move' do
    visit '/'
    sign_in_and_play
    click_button('rock')
    expect(page).to have_content('You chose Rock!')
  end
end
