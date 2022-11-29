### Setup
1. `bundle config set --local without 'production'`
2. `bundle install`
3. Install node lts
  - Install NVM: https://github.com/nvm-sh/nvm
  - `nvm install --lts`
4. `yarn install`
  - Install/enable yarn: https://yarnpkg.com/getting-started/install
5. `bin/rails db:migrate`
6. `bin/rails db:seed`
