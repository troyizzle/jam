# Site
- [x] Change flash messages
- [x] Change logo
  - [ ] Make hover styling work
- [ ] Inputs with icon are wrong

## Users::BettingBook
- [ ] Add test for destroying nested bets

## Profile
- [ ] Validate can only update your personal profile
- [ ] Change default avatar, maybe use gravatar or just something that looks better on dark mode

## Sidebar
- [x] When clicking on a link, close the sidebar and update active state

## Setting page
- [x] Add test for submitting profile form with social media links
- [x] Cover image upload
  - [ ] On profile creation add default cover image
  - [ ] Add test
    - [ ] Ensure file type
    - [ ] Ensure file size
- [x] Make your cover photo use full width
- [ ] Image preview, should reject unless file is an image
- [x] Change Users::Avatar into Profile namespaced
  ### Linking Account
  - [ ] Display an error, need to save this error
  - [ ] Send a notification
  - [ ] On error be able to resync
