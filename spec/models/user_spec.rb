require 'rails_helper'
describe User do
 describe '#create' do

   # 1
   it "name、email、passwordとが存在すれば登録できること" do
     user = build(:user)
     expect(user).to be_valid
   end

   # 2
   it "nameがない場合は登録できないこと" do
     user = build(:user, username: "")
     user.valid?
     expect(user.errors[:username]).to include("can't be blank")
   end
   
   # 3
   it "emailがない場合は登録できないこと" do
     user = build(:user, email: "")
     user.valid?
     expect(user.errors[:email]).to include("can't be blank")
   end

   # 4
   it "passwordがない場合は登録できないこと" do
     user = build(:user, password: "")
     user.valid?
     expect(user.errors[:password]).to include("can't be blank")
   end

   # 8
   it "重複したemailが存在する場合登録できないこと" do
     user = create(:user)
     another_user = build(:user)
     another_user.valid?
     expect(another_user.errors[:email]).to include("has already been taken")
   end

 end
end