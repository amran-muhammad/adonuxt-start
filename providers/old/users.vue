<template>
    <div>
        
    <Modal
    	v-model="detailsModal"
			title="Cash Details"
      :width="950"
			:mask-closable="false"
            :closable="false"
    
    >
      <div class="row">
				<div class="col-12 col-md-12">
					<div class="_3login_input_group">
            <table  class="_table">
              <thead>
                <th>S. ID</th>
                <th>Name</th>
                <th>Stripe ID</th>
                <th>Stripe Status</th>
                <th>Stripe Plan</th>
                <th>Quantity</th>
                <th>Trial Ends</th>
                <th>Ends at</th>
                <th>Subscription Start</th>
              </thead>
              <tbody>
                <tr v-for="(i,ind) in details.sub" :key="ind">
                  <td>{{i.id}}</td>
                  <td>{{i.name}}</td>
                  <td>{{i.stripe_id}}</td>
                  <td>{{i.stripe_status}}</td>
                  <td>{{i.stripe_plan}}</td>
                  <td>{{i.quantity}}</td>
                  <td>{{i.trial_ends_at}}</td>
                  <td>{{i.ends_at}}</td>
                  <td>{{i.created_at}}</td>

                </tr>
              </tbody>
            </table>
            
						
					</div>
				</div>
				       
			</div>
      <div slot="footer">
                <Button type="default" @click="detailsModal=false">Close</Button>
              
        </div>

      
    </Modal>    

     <Modal
			v-model="addModal"
			title="Add a new user"
			:mask-closable="false"
            :closable="false"
			>
        	
			<div class="row">
				<div class="col-6 col-md-6">
					<div class="_3login_input_group">
						<p class="registration_title">User Name</p>
						<Input type="text" v-model="form_data.fullName" placeholder="Enter Full Name"/>
					</div>
				</div>
				<div class="col-6 col-md-6">
					<div class="_3login_input_group">
						<p class="registration_title">Email</p>
						<Input type="email" v-model="form_data.email" placeholder="Enter Email"/>
					</div>
				</div>
				<div class="col-6 col-md-6">
					<div class="_3login_input_group">
						<p class="registration_title">Phone</p>
						<Input type="text" v-model="form_data.phone" placeholder="Enter Phone Number"/>
					</div>
				</div>
				<div class="col-6 col-md-6">
					<div class="_3login_input_group">
						<p class="registration_title">Password</p>
						<Input type="password" v-model="form_data.password" placeholder="Enter Password(minimum 6 characters)"/>
					</div>
				</div>
				<div class="col-6 col-md-6">
					<div class="_3login_input_group">
						<p class="registration_title">Password Confirmation</p>
						<Input type="password" v-model="form_data.password_confirmation" placeholder="Re-enter Password(minimum 6 characters)"/>
					</div>
				</div>
				<div class="col-6 col-md-6">
					<div class="_3login_input_group">
						<p class="registration_title">Address</p>
						<Input type="text" v-model="form_data.address" placeholder="Enter Address"/>
					</div>
				</div>
				
				<div class="col-6 col-md-6">
					<div class="_3login_input_group">
						<p class="registration_title">Location Name</p>
						<Select v-model="form_data.location_id" style="width:100%" size="large" clearable filterable :remote-method="getLocation">
                            <Option v-for="(item,index) in location" :key="index" :value="item.id">{{item.locationName}}</Option>
                        </Select>
						
					</div>
				</div>
				<div class="col-6 col-md-6">
					<div class="_3login_input_group">
						<p class="registration_title">Schedule Name</p>
						<Select v-model="form_data.schedule_id" style="width:100%" size="large" clearable filterable :remote-method="getSchedule">
                            <Option v-for="(item,index) in schedule" :key="index" :value="item.id">{{item.scheduleName}}</Option>
                        </Select>
						
					</div>
				</div>
				<div class="col-6 col-md-6">
					<div class="_3login_input_group">
						<p class="registration_title">Who Picks It?</p>
						<Input type="text" v-model="form_data.whoPicksIt" placeholder="Enter A Name"/>
					</div>
				</div>
               
			</div>
            <div slot="footer">
                <Button type="default" @click="addModal=false">Close</Button>
                <Button type="primary" :disabled="isSending" :loading="isSending" @click="registration">{{isSending ? 'Please wait...' : 'Add user'}}</Button>
            </div>
    	</Modal>
        <div class="row">
            <div class="col-12 col-md-12 col-lg-12">
                <div class="_1card _mar_b15 _b_radious7 _5box_shadow _0border">
                  <div class="_1card_header _padd20">
                    <p class="_1card_header_title">Users</p>
                    <template v-if="loaderCycle">
                            <div class="row">
                                <div class="col-md-4"></div>
                                <div class="col-md-4">  <p class="_1card_header_title">Loading...</p></div>
                                <div class="col-md-4"></div>
                            </div>
                        </template>

                    <div class="_dashboard_actions">
                      <button class="_btn_sm" @click="addModal=true"><i class="fas fa-plus"></i> Add user</button>
                    </div>
                  </div>

                  <div class="">
                    <div class="_table_responsive">
                      <template v-if="nodata">
                        <div class="row">
                          
                            <div class="col-md-4"></div>
                            <div class="col-md-4"> <p class="_1card_header_title">No Data Found</p></div>
                            <div class="col-md-4"></div>
                          
                        </div>
                        
                       
                      </template>
                      <template v-else>
                          <table class="_table">
                        <thead class="bg-200 text-900">
                          <tr>
                            <th>ID</th>

                            <th>Full Name</th>

                            <th>Email</th>
                            <th>Phone</th>
                            <th>Address</th>
                            <th>Schedule</th>
                            <th>Location</th>
                            <th>Who Picks It</th>
                            <th>Transaction Details</th>
                            <th>Action</th>
                          </tr>
                        </thead>

                        <tbody>
                          <tr v-for="(item,index) in data" :key="index">
                            <td>
                              {{item.id}}
                            </td>

                            <td>
                              {{item.fullName}}
                            </td>

                            <td>{{item.email}}</td>
                            <td>{{item.phone}}</td>
                            <td><span v-if="item.schedule">{{item.schedule.scheduleName}}</span></td>
                            <td><span v-if="item.location">{{item.location.locationName}}</span></td>
                            <td>{{item.address}}</td>
                            <td>{{item.whoPicksIt}}</td>
                            <td><button class="_btn _btn_outline_info _btn_sm" @click="detailsModalOn(item,index)">See Details</button></td>
                            <td>
                                <!-- <button class="_btn _btn_outline_info _btn_sm">Edit</button>  -->
                                <button class="_btn _btn_outline_danger _btn_sm" @click="deleteUser(item,index)">Delete</button>
                            </td>
                          </tr>

                        </tbody>
                      </table>
                      </template>
                      <!-- Pagination -->
                                                 
                        <div class="pagin">
                            <Page 
                        :current="1"
                        :total="pagination.total" 
                        @on-change="pagination_result" 
                        :page-size="10" 
                        />
                        </div>
                        <!-- Pagination -->
                      
                    </div>
                  </div>
                </div>
              </div>
        </div>
		
    </div>
</template>

<script>
export default {
    data(){
		return{
            addModal:false,
            addModal:false,
            detailsModal: false,
            loaderCycle: true,
            nodata: false,
            editIndex:-1,
             pagination:{},
            page:1,
            details:{},
            data:[],
            location:[],
            schedule:[],
			      form_data: {
                fullName: '',
                email: '',
            address:'',   
            phone:'',
            location_id: '',
            schedule_id: '',
              password:'',
          password_confirmation:''
              },
              edit_data: {
                  fullName: '',
                  email: '',
          address:'',
          phone:'',
          location_id: '',
          schedule_id: ''
			},
            search:'',
            isSending: false,            
		}
	},
    methods:{
       async pagination_result(e){

            this.page = e
            const res = await this.callApi('get',`showUserForUser?page=${this.page}`)
            if(res.status == 200){
                this.data = res.data.user.data
                this.pagination = res.data.user
                
            }
        },
      detailsModalOn(item,index){
        this.detailsModal = true
        this.details = item
      },

		  async getLocation(query){
            console.log(query);
            
            const res = await this.callApi('get',`showLocation?search=${query}`);
            if(res.status == 200){
                this.location = res.data.location
            }
            
        },
		  async getSchedule(query){
            console.log(query);
            
            const res = await this.callApi('get',`showSchedule?search=${query}`);
            if(res.status == 200){
                this.schedule = res.data.schedule
            }
            
		},
		  async registration(){
                if(this.form_data.fullName.trim() =='' ) return this.i("Full Name is required!")
                if(this.form_data.email.trim() =='' ) return this.i("Email is required!")
                if(this.form_data.password.trim() =='' ) return this.i("Password is required!")
                if(this.form_data.password_confirmation.trim() =='' ) return this.i("Password Confirmation is required!")
                if(this.form_data.password != this.form_data.password_confirmation){
                  return  this.i("The password confirmation does not match.")
                }
                if(isNaN(this.form_data.phone)) return this.i("Phone Number must be numbers!")
                if(this.form_data.phone.trim()=='' ) return this.i("Phone Number can't be empty!")
                this.isSending = true
                const res = await this.callApi('post','registration',this.form_data)
                if(res.status===200){
                  this.data.push(res.data.user)
                    this.s("registration Successfull ! Please Login.")
                   this.form_data = {}
                   this.addModal = false
                }
                else if(res.status===422){
                    
                    if(res.data.errors.email){
                        for(let e of res.data.errors.email)
                            this.e(e);
                    }  
                    if(res.data.errors.password)
                    {
                        this.e(res.data.errors.password[0])
                    }  
                    
                    if(res.data.errors.fullName)
                    {
                        this.errorData.fullName = res.data.errors.fullName 
                        for(let e of res.data.errors.fullName  )
                            this.e(e);
                    }    
                       
                }
                else{
                    this.swr();
                }
                this.isSending = false

        },

       async deleteUser(item,index){
            // console.log(id)
            if(!confirm("WARNING!!! Are you sure to delete this info?")){
                return;
            }
            let ob = {
                id:item.id
            }

            const response = await this.callApi('post', 'deleteUser',ob)
            if (response.status === 200) {
                this.data.splice(index,1)
                this.s('User deleted');

            }else{
                console.log(response);
                this.swr()
            }
        }
        	
		

       
       
},
 async created(){
   const res = await this.callApi('get',`showUserForUser`)
    if( res.status != 200){
      this.loaderCycle = true
    }
    
		if( res.status == 200){
      this.loaderCycle = false
      this.data = res.data.user.data
      this.pagination = res.data.user
      if(this.data.length == 0){
        this.nodata = true

      }
		} else {
			this.swr()
		}
		
	},
}
</script>
<style>
.loader {
  border: 8px solid #f3f3f3;
  border-radius: 50%;
  border-top: 8px solid #3498db;
  width: 50px;
  height: 50px;
  -webkit-animation: spin 2s linear infinite; /* Safari */
  animation: spin 2s linear infinite;
 
}

/* Safari */
@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}
</style>



