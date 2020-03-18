<template>
  <div>
    <div class="row">
      <div class="col-6 col-md-6">
        <div class="_3login_input_group">
          <p class="registration_title">Language Name</p>
          <Input type="text" v-model="edit_data.name" />
        </div>
      </div>
      <button class="_btn _btn_outline_dark _btn_sm" @click="imageModalOn(item)">Select Image</button>
      <div class="col-6 col-md-6">
        <Modal
          v-model="imageModal"
          :mask-closable="false"
          :closable="false"
          width="600px;"
          height="500px;"
        >
          <template>
            <Upload
              ref="upload"
              type="drag"
              :headers="crfObj"
              :with-credentials="true"
              :on-success="handleEditImageUpload"
              name="img"
              action="/app/upload_image"
            >
              <div style="padding: 20px 0">
                <Icon type="ios-cloud-upload" size="52" style="color: #3399ff"></Icon>
                <p>Click or drag files here to upload</p>
              </div>
            </Upload>
            <Card span="10" offset="1">
              <div style="text-align:center">
                <img
                  style="width: 100%;height: 250px;"
                  v-if="edit_data.flag_language"
                  :src="edit_data.flag_language"
                />
              </div>
            </Card>
          </template>
          <div slot="footer">
            <Button type="default" @click="imageModal=false">Close</Button>
          </div>
        </Modal>
      </div>
    </div>
    <table class="_table">
      <thead class="text-900">
        <tr>
          <th>Title</th>
          <th>Changed Value</th>
        </tr>
      </thead>

      <tbody>
        <tr>
          <td>Email</td>
          <td>
            <Input type="text" v-model="data.Email" />
          </td>
        </tr>
        <tr>
          <td>Type Email</td>
          <td>
            <Input type="text" v-model="data.Type_Email" />
          </td>
        </tr>
        <tr>
          <td>Password</td>
          <td>
            <Input type="text" v-model="data.Password" />
          </td>
        </tr>
        <tr>
          <td>Type Password</td>
          <td>
            <Input type="text" v-model="data.Type_Password" />
          </td>
        </tr>
        <tr>
          <td>Logging</td>
          <td>
            <Input type="text" v-model="data.Logging" />
          </td>
        </tr>
        <tr>
          <td>Log_In</td>
          <td>
            <Input type="text" v-model="data.Log_In" />
          </td>
        </tr>
        <tr>
          <td>Haven't any account?</td>
          <td>
            <Input type="text" v-model="data.Havent_any_account" />
          </td>
        </tr>
        <tr>
          <td>Sign_Up</td>
          <td>
            <Input type="text" v-model="data.Sign_Up" />
          </td>
        </tr>
        <tr>
          <td>Email_is_empty</td>
          <td>
            <Input type="text" v-model="data.Email_is_empty" />
          </td>
        </tr>
        <tr>
          <td>Password_is_empty</td>
          <td>
            <Input type="text" v-model="data.Password_is_empty" />
          </td>
        </tr>
        <tr>
          <td>Invalid_Phone_or_Password</td>
          <td>
            <Input type="text" v-model="data.Invalid_Phone_or_Password" />
          </td>
        </tr>
        <tr>
          <td>Register</td>
          <td>
            <Input type="text" v-model="data.Register" />
          </td>
        </tr>
        <tr>
          <td>Name</td>
          <td>
            <Input type="text" v-model="data.Name" />
          </td>
        </tr>
        <tr>
          <td>Type_Name</td>
          <td>
            <Input type="text" v-model="data.Type_Name" />
          </td>
        </tr>
        <tr>
          <td>Phone</td>
          <td>
            <Input type="text" v-model="data.Phone" />
          </td>
        </tr>
        <tr>
          <td>Type Phone</td>
          <td>
            <Input type="text" v-model="data.Type_Phone" />
          </td>
        </tr>
        <tr>
          <td>Repeat_Password</td>
          <td>
            <Input type="text" v-model="data.Repeat_Password" />
          </td>
        </tr>
        <tr>
          <td>Location</td>
          <td>
            <Input type="text" v-model="data.Location" />
          </td>
        </tr>
        <tr>
          <td>Please_wait_to_select_location.....</td>
          <td>
            <Input type="text" v-model="data.Please_wait_to_select_location" />
          </td>
        </tr>
        <tr>
          <td>Select_Location</td>
          <td>
            <Input type="text" v-model="data.Select_Location" />
          </td>
        </tr>
        <tr>
          <td>Address</td>
          <td>
            <Input type="text" v-model="data.Address" />
          </td>
        </tr>
        <tr>
          <td>Type Address</td>
          <td>
            <Input type="text" v-model="data.Type_Address" />
          </td>
        </tr>
        <tr>
          <td>Schedule</td>
          <td>
            <Input type="text" v-model="data.Schedule" />
          </td>
        </tr>
        <tr>
          <td>Please wait to select schedule.....</td>
          <td>
            <Input type="text" v-model="data.Please_wait_to_select_schedule" />
          </td>
        </tr>
        <tr>
          <td>Select Schedule</td>
          <td>
            <Input type="text" v-model="data.Select_Schedule" />
          </td>
        </tr>
        <tr>
          <td>Who Picks it</td>
          <td>
            <Input type="text" v-model="data.Who_Picks_it" />
          </td>
        </tr>
        <tr>
          <td>Type who picks it</td>
          <td>
            <Input type="text" v-model="data.Type_who_picks_it" />
          </td>
        </tr>
        <tr>
          <td>Progressing...</td>
          <td>
            <Input type="text" v-model="data.Progressing" />
          </td>
        </tr>
        <tr>
          <td>Registration</td>
          <td>
            <Input type="text" v-model="data.Registration" />
          </td>
        </tr>
        <tr>
          <td>Already_have_an_account?</td>
          <td>
            <Input type="text" v-model="data.Already_have_an_account" />
          </td>
        </tr>
        <tr>
          <td>Login</td>
          <td>
            <Input type="text" v-model="data.Login" />
          </td>
        </tr>
        <tr>
          <td>Name is empty</td>
          <td>
            <Input type="text" v-model="data.Name_is_empty" />
          </td>
        </tr>
        <tr>
          <td>Phone is empty</td>
          <td>
            <Input type="text" v-model="data.Phone_is_empty" />
          </td>
        </tr>
        <tr>
          <td>Password length should be 6 or more</td>
          <td>
            <Input type="text" v-model="data.Password_length_should_be_6_or_more" />
          </td>
        </tr>
        <tr>
          <td>Repeat Password is empty</td>
          <td>
            <Input type="text" v-model="data.Repeat_Password_is_empty" />
          </td>
        </tr>
        <tr>
          <td>Password doesn't match</td>
          <td>
            <Input type="text" v-model="data.Password_doesnt_match" />
          </td>
        </tr>
        <tr>
          <td>Location is empty</td>
          <td>
            <Input type="text" v-model="data.Location_is_empty" />
          </td>
        </tr>
        <tr>
          <td>Address is empty</td>
          <td>
            <Input type="text" v-model="data.Address_is_empty" />
          </td>
        </tr>
        <tr>
          <td>Schedule is empty</td>
          <td>
            <Input type="text" v-model="data.Schedule_is_empty" />
          </td>
        </tr>
        <tr>
          <td>Something went wrong!!! Try again</td>
          <td>
            <Input type="text" v-model="data.Something_went_wrong_Try_again" />
          </td>
        </tr>
        <tr>
          <td>Please wait to load data...</td>
          <td>
            <Input type="text" v-model="data.Please_wait_to_load_data" />
          </td>
        </tr>
        <tr>
          <td>Hi</td>
          <td>
            <Input type="text" v-model="data.Hi" />
          </td>
        </tr>
        <tr>
          <td>What You Like?</td>
          <td>
            <Input type="text" v-model="data.What_You_Like" />
          </td>
        </tr>
        <tr>
          <td>Menu</td>
          <td>
            <Input type="text" v-model="data.Menu" />
          </td>
        </tr>
        <tr>
          <td>Choose It</td>
          <td>
            <Input type="text" v-model="data.Choose_It" />
          </td>
        </tr>
        <tr>
          <td>Ingredients</td>
          <td>
            <Input type="text" v-model="data.Ingredients" />
          </td>
        </tr>
        <tr>
          <td>Proportion</td>
          <td>
            <Input type="text" v-model="data.Proportion" />
          </td>
        </tr>
        <tr>
          <td>Total_Calories</td>
          <td>
            <Input type="text" v-model="data.Total_Calories" />
          </td>
        </tr>
        <tr>
          <td>kcal</td>
          <td>
            <Input type="text" v-model="data.kcal" />
          </td>
        </tr>
        <tr>
          <td>Select Water</td>
          <td>
            <Input type="text" v-model="data.Select_Water" />
          </td>
        </tr>
        <tr>
          <td>No Complementary Found</td>
          <td>
            <Input type="text" v-model="data.No_Complementary_Found" />
          </td>
        </tr>
        <tr>
          <td>Add Complementary</td>
          <td>
            <Input type="text" v-model="data.Add_Complementary" />
          </td>
        </tr>
        <tr>
          <td>Remove Complements</td>
          <td>
            <Input type="text" v-model="data.Remove_Complements" />
          </td>
        </tr>
        <tr>
          <td>Comment</td>
          <td>
            <Input type="text" v-model="data.Comment" />
          </td>
        </tr>
        <tr>
          <td>(If any)</td>
          <td>
            <Input type="text" v-model="data.If_any" />
          </td>
        </tr>
        <tr>
          <td>Confirming</td>
          <td>
            <Input type="text" v-model="data.Confirming" />
          </td>
        </tr>
        <tr>
          <td>Confirm Order</td>
          <td>
            <Input type="text" v-model="data.Confirm_Order" />
          </td>
        </tr>
        <tr>
          <td>Are You Sure with</td>
          <td>
            <Input type="text" v-model="data.Are_You_Sure_with" />
          </td>
        </tr>
        <tr>
          <td>No</td>
          <td>
            <Input type="text" v-model="data.No" />
          </td>
        </tr>
        <tr>
          <td>Yes</td>
          <td>
            <Input type="text" v-model="data.Yes" />
          </td>
        </tr>
        <tr>
          <td>Something went wrong! Try Again</td>
          <td>
            <Input type="text" v-model="data.Something_went_wrong_Try_Again" />
          </td>
        </tr>
        <tr>
          <td>OR</td>
          <td>
            <Input type="text" v-model="data.OR" />
          </td>
        </tr>
        <tr>
          <td>We Receive Your Order</td>
          <td>
            <Input type="text" v-model="data.We_Receive_Your_Order" />
          </td>
        </tr>
        <tr>
          <td>OK</td>
          <td>
            <Input type="text" v-model="data.OK" />
          </td>
        </tr>
        <tr>
          <td>Payment</td>
          <td>
            <Input type="text" v-model="data.Payment" />
          </td>
        </tr>
        <tr>
          <td>Pay USD 15 your subscription for 15 days</td>
          <td>
            <Input type="text" v-model="data.Pay_USD_15_your_subscription_for_15_days" />
          </td>
        </tr>
        <tr>
          <td>Please wait to check your member status...</td>
          <td>
            <Input type="text" v-model="data.Please_wait_to_check_your_member_status" />
          </td>
        </tr>
        <tr>
          <td>Thank you for choosing us!</td>
          <td>
            <Input type="text" v-model="data.Thank_you_for_choosing_us" />
          </td>
        </tr>
        <tr>
          <td>Your payment will be proccessed securly and we don't save your credit card information!</td>
          <td>
            <Input
              type="text"
              v-model="data.Your_payment_will_be_proccessed_securly_and_we_dont_save_your_credit_card_information"
            />
          </td>
        </tr>
        <tr>
          <td>Payment processing...</td>
          <td>
            <Input type="text" v-model="data.Payment_processing" />
          </td>
        </tr>
        <tr>
          <td>Submit Payment</td>
          <td>
            <Input type="text" v-model="data.Submit_Payment" />
          </td>
        </tr>
        <tr>
          <td>Your membership is active</td>
          <td>
            <Input type="text" v-model="data.Your_membership_is_active" />
          </td>
        </tr>
        <tr>
          <td>Something went wrong</td>
          <td>
            <Input type="text" v-model="data.Something_went_wrong" />
          </td>
        </tr>
        <tr>
          <td>Notifications</td>
          <td>
            <Input type="text" v-model="data.Notifications" />
          </td>
        </tr>
        <tr>
          <td>You have no new notification</td>
          <td>
            <Input type="text" v-model="data.You_have_no_new_notification" />
          </td>
        </tr>
        <tr>
          <td>Please wait....</td>
          <td>
            <Input type="text" v-model="data.Please_wait" />
          </td>
        </tr>
        <tr>
          <td>Are you sure want to logout?</td>
          <td>
            <Input type="text" v-model="data.Are_you_sure_want_to_logout" />
          </td>
        </tr>
        <tr>
          <td>Who Picks</td>
          <td>
            <Input type="text" v-model="data.Who_Picks" />
          </td>
        </tr>
        <tr>
          <td>Settings</td>
          <td>
            <Input type="text" v-model="data.Settings" />
          </td>
        </tr>
        <tr>
          <td>Edit Profile</td>
          <td>
            <Input type="text" v-model="data.Edit_Profile" />
          </td>
        </tr>
        <tr>
          <td>Change Password</td>
          <td>
            <Input type="text" v-model="data.Change_Password" />
          </td>
        </tr>
        <tr>
          <td>Saving...</td>
          <td>
            <Input type="text" v-model="data.Saving" />
          </td>
        </tr>
        <tr>
          <td>Save</td>
          <td>
            <Input type="text" v-model="data.Save" />
          </td>
        </tr>
        <tr>
          <td>Your profile has been edited successfully</td>
          <td>
            <Input type="text" v-model="data.Your_profile_has_been_edited_successfully" />
          </td>
        </tr>
        <tr>
          <td>Please enter your Old Password to verify this account</td>
          <td>
            <Input type="text" v-model="data.Pleas_enter_your_Old_Password_to_verify_this_account" />
          </td>
        </tr>
        <tr>
          <td>Close</td>
          <td>
            <Input type="text" v-model="data.Close" />
          </td>
        </tr>
        <tr>
          <td>New Password</td>
          <td>
            <Input type="text" v-model="data.New_Password" />
          </td>
        </tr>
        <tr>
          <td>Old Password is empty</td>
          <td>
            <Input type="text" v-model="data.Old_Password_is_empty" />
          </td>
        </tr>
        <tr>
          <td>Old Password doesn't match</td>
          <td>
            <Input type="text" v-model="data.Old_Password_doesnt_match" />
          </td>
        </tr>
        <tr>
          <td>New Password is empty</td>
          <td>
            <Input type="text" v-model="data.New_Password_is_empty" />
          </td>
        </tr>
        <tr>
          <td>Confirm Password is empty</td>
          <td>
            <Input type="text" v-model="data.Confirm_Password_is_empty" />
          </td>
        </tr>
        <tr>
          <td>Confirm Password doesn't match</td>
          <td>
            <Input type="text" v-model="data.Confirm_Password_doesnt_match" />
          </td>
        </tr>
        <tr>
          <td>Your Password has been changed. Now you can login with your new password</td>
          <td>
            <Input
              type="text"
              v-model="data.Your_Password_has_been_changed_Now_you_can_login_with_your_new_password"
            />
          </td>
        </tr>
      </tbody>
    </table>

    <div>
      <Button
        type="primary"
        :disabled="isSending"
        :loading="isSending"
        @click="updateLanguage"
      >{{isSending ? 'Please wait...' : 'Update Language'}}</Button>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      imageModal: false,
      editIndex: -1,
      loaderCycle: true,
      nodata: false,
      data: {},
      imgName: "",
      visible: false,
      textVisible: false,
      listMethod: false,
      crfObj: {
        "X-CSRF-TOKEN": document.querySelector('meta[name="csrf-token"]')
        // .getAttribute("content")
      },
      data: false,
      edit_data: {
        name: "",
        flag_language: "",
        translation: ""
      },
      isSending: false,
      keys: "",
      values: ""
    };
  },
  methods: {
    imageModalOn(item, index) {
      this.imageModal = true;
    },

    async handleEditImageUpload(res, file) {
      if (res) {
        this.edit_data.flag_language = res;
      }
    },

    async updateLanguage() {
      if (this.edit_data.name.trim() == "")
        return this.e("Language Name can not be empty!!");
      this.edit_data.translation = this.data;

      const response = await this.callApi(
        "post",
        "editLanguage",
        this.edit_data
      );
      if (response.status === 200) {
        this.$router.push("/languages");
        this.s("Language Updated");
      } else {
        this.swr();
      }
      this.isSending = false;
    }
  },
  async created() {
    const res = await this.callApi(
      "get",
      `showSingleLanguage/${this.$route.params.id}`
    );
    if (res.status == 200) {
      this.edit_data = res.data.language;
      this.data = JSON.parse(res.data.language.translation);
      console.log(this.data);
    }
  }
};
</script>



