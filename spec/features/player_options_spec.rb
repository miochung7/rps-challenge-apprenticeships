feature 'Player option' do
  scenario 'can see all 3 moves' do
    visit '/'
    sign_in_and_play
    expect(page).to have_button('rock')
    expect(page).to have_button('paper')
    expect(page).to have_button('scissors')
  end
end

feature 'Computer' do
  scenario 'choose random option' do
    visit '/'
    sign_in_and_play
  
    click_button('rock')
    expect(page).to have_content("Computer chose Scissors!")
  end
end
