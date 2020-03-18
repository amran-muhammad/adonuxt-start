<template>
    <div>
        <Modal
            v-model="detailsModal"
			title="Card Details"
			:mask-closable="false"
            :closable="false">
            
            <div class="row">
                <div class="col-6 col-md-6">
                    <div class="_3login_input_group">
                        <p class="registration_title">Stripe Id</p>
                        <span v-if="details.user">{{details.user.stripe_id}}</span>
				    </div>
				</div>
                <div class="col-6 col-md-6">
                     <div class="_card _3login_input_group">
					<p class="registration_title">Card Brand</p>
                    <span v-if="details.user">{{details.user.card_brand}}</span>
				</div>
				</div>
                <div class="col-6 col-md-6">
                     <div class="_3login_input_group">
					<p class="registration_title">Last 4 Digit of Card</p>
                    <span v-if="details.user">{{details.user.card_last_four}}</span>
				</div>
				</div>
                <div class="col-6 col-md-6">
                     <div class="_3login_input_group">
					<p class="registration_title">Trial Ends At</p>
                    <span v-if="details.user">{{details.user.trial_ends_at}}</span>
				</div>
				</div>
            </div>


            <div slot="footer">
                <Button type="default" @click="detailsModal=false">Close</Button>
            </div>

      </Modal>
        <Modal
			v-model="addModal"
			title="Add A New Member"
			:mask-closable="false"
            :closable="false"
            width="800px"
		    >
        	
				
			<div class="row">
				<div class="col-4 col-md-4">
					<div class="_3login_input_group">
						<p class="registration_title">Member Name</p>
						<Select v-model="form_data.user_id" style="width:100%" size="large" clearable filterable :remote-method="getUser">
                            <Option v-for="(item,index) in users" :key="index" :value="item.id">{{item.fullName}}</Option>
                        </Select>	
					</div>
				</div>
                <div class="col-4 col-md-4">
					<div class="_3login_input_group">
						<p class="registration_title">Membership Start</p>
                        <DatePicker v-model="form_data.membership_start"  @on-change="inputdate1" format="yyyy-MM-dd" type="date" placeholder="Select date" style="width: 200px"></DatePicker>
					</div>
				</div>
				<div class="col-4 col-md-4">
					<div class="_3login_input_group">
						<p class="registration_title">Membership End</p>
					 <DatePicker v-model="form_data.membership_end" @on-change="inputdate2" format="yyyy-MM-dd"  type="date" placeholder="Select date" style="width: 200px"></DatePicker>
					</div>
				</div>
                
			</div>
             <div slot="footer">
                <Button type="default" @click="addModal=false">Close</Button>
                <Button type="primary" :disabled="isSending" :loading="isSending" @click="addMember">{{isSending ? 'Please wait...' : 'Add Member'}}</Button>
            </div>
    	</Modal>
        <Modal
		   v-model="editModal"
			:mask-closable="false"
			:closable="false"
            title="Edit Member" 
            width="800px"
			>
            <div class="row">
				<div class="col-4 col-md-4">
					<div class="_3login_input_group">
						<p class="registration_title">Member Name</p>
						<Select v-model="edit_data.user_id" style="width:100%" size="large" clearable filterable :remote-method="getUser">
                            <Option v-for="(item,index) in users" :key="index" :value="item.id">{{item.fullName}}</Option>
                        </Select>	
					</div>
				</div>
                <div class="col-4 col-md-4">
					<div class="_3login_input_group">
						<p class="registration_title">Membership Start</p>
                        <DatePicker v-model="edit_data.membership_start"   format="yyyy-MM-dd" type="date" placeholder="Select date" style="width: 200px"></DatePicker>
					</div>
				</div>
				<div class="col-4 col-md-4">
					<div class="_3login_input_group">
						<p class="registration_title">Membership End</p>
					 <DatePicker v-model="edit_data.membership_end"  format="yyyy-MM-dd"  type="date" placeholder="Select date" style="width: 200px"></DatePicker>
					</div>
				</div>
                
			</div>
            <div slot="footer">
                <Button type="default" @click="editModal=false">Close</Button>
                <Button type="primary" :disabled="isSending" :loading="isSending" @click="updateMember">{{isSending ? 'Please wait...' : 'Update Member'}}</Button>
            </div>
	
    	</Modal>
                           
        <div class="row">
		    <div class="col-12 col-md-12 col-lg-12">
                <div class="_1card _mar_b15 _b_radious7 _5box_shadow _0border">
		            <div  class="_1card_header _padd20">
			            <p class="_1card_header_title">Members</p>
                        <template v-if="loaderCycle">
                            <div class="row">
                                <div class="col-md-4"></div>
                                <div class="col-md-4">  <p class="_1card_header_title">Loading...</p></div>
                                <div class="col-md-4"></div>
                            </div>
                        </template>
			                <div class="_dashboard_actions ">
                                 <button class="_btn_sm"  @click="addModal = true"><i class="fas fa-plus"></i> Add Member</button>
                    
                            </div>
                    </div>
                    <div class="_table_responsive">
                        <table class="_table">
                            <thead v-if="!nodata" class="bg-200 text-900">
                            <tr>
                                <th>ID</th>
                                <th>Member Name</th>
                                <th>Membership Start</th>
                                <th>Membership End</th>
                                <th>Status</th>
                                <th>Payment Method</th>
                                <th>Card Details</th>
                                <th>Action</th>
                            </tr>
                            </thead>                 

                        <template v-if="nodata">
                                <div class="row">
                                    <div class="col-md-4"></div>
                                    <div class="col-md-4"> 
                                          <p class="_1card_header_title">No data found</p>
                                    </div>
                                    <div class="col-md-4"></div>
                                </div>
                            </template>
                        <tbody>
                                
                        <tr v-for="(item,index) in data" :key="index">
                            <td>
                              {{item.id}}
                            </td>
                            <td v-if="item.user">
                                {{item.user.fullName}}
                            </td>
                            <td>
                               {{item.membership_start}}
                            </td>
                            <td>
                               {{item.membership_end}}
                            </td>
                            <td>
                               {{item.status}}
                            </td>
                            <td v-if="item.user">
                               {{item.user.payment_method}}
                            </td>
                            <td><button class="_btn _btn_outline_info _btn_sm" @click="detailsModalOn(item,index)">See Details</button></td>
                            
                            <td>
                                <button class="_btn _btn_outline_info _btn_sm" @click="editMember(item,index)">Edit</button>
                                <button class="_btn _btn_outline_danger _btn_sm" @click="deleteMember(index)">Delete</button>
                            </td>
                            
                          </tr>

                        </tbody>
                      </table>
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
                     
	
</template>

<script>
export default {
    data(){
		return{
            addModal:false,
            editModal: false,
            detailsModal: false,
            editIndex:-1,
             pagination:{},
            page:1,
            data:[],
            users:[],
            details:{},
            loaderCycle: true,
            nodata: false,
            form_data: {
                
                user_id: '',
                membership_start: '',
                membership_end: '',

            },
            edit_data: {
                user_id: '',
                membership_start: '',
                membership_end: '',
                fullmembership_end: '',
            },
            
       isSending: false, 
           
		}
	},
    methods:{
        async pagination_result(e){

            this.page = e
            const res = await this.callApi('get',`showMembership?page=${this.page}`)
            if(res.status == 200){
                this.data = res.data.membership.data
                this.pagination = res.data.membership     
                 }
        },
        detailsModalOn(item,index){
            this.details = item
            this.detailsModal = true
        },

        inputdate1(date){
            this.form_data.membership_start = date
        },
        inputdate2(date){
            this.form_data.membership_end = date
        },
        outputdate1(date){
            this.edit_data.membership_start = date
        },
        outputdate2(date){
            this.edit_data.membership_end = date
        },
        async getUser(query){
            console.log(query);
            
            const res = await this.callApi('get',`showUser?search=${query}`);
            if(res.status == 200){
                this.users = res.data.user
            }
            },
       
       async deleteMember(index){
            // console.log(id)
            if(!confirm("WARNING!!! Are you sure to delete this info?")){
                return;
            }
            let ob = {
                id:this.data[index].id
            }

            const response = await this.callApi('post', 'deleteMembership',ob)
            if (response.status === 200) {
                this.data.splice(index,1)
                this.s('Member deleted');

            }else{
                console.log(response);
                this.swr()
            }
        },
        	
		 async updateMember () {
		
          if (this.edit_data.user_id =='') {
               return this.e('Member name can not be empty!')
            }
            if (this.edit_data.membership_start =='') {
               return this.e('Membership start date can not be empty!')
            }
            if (this.edit_data.membership_end =='') {
               return this.e('Membership end date can not be empty!')
            }
            
            this.edit_data.fullmembership_end = this.edit_data.membership_end

            let sday = this.edit_data.membership_start.getDate()
            let smon = this.edit_data.membership_start.getMonth()+1
            let syear = this.edit_data.membership_start.getFullYear()
            this.edit_data.membership_start = syear+'-'+smon+'-'+sday

            let eday = this.edit_data.membership_end.getDate()
            let emon = this.edit_data.membership_end.getMonth()+1
            let eyear = this.edit_data.membership_end.getFullYear()
            this.edit_data.membership_end = eyear+'-'+emon+'-'+eday
		
			const response = await this.callApi('post', 'editMembership', this.edit_data)
            if (response.status === 200) {
				this.data[this.editIndex] = response.data.membership
				this.edit_data ={}
				this.editIndex = -1
				this.editModal = false
                this.s('Member Updated')
                
            }else{
                this.swr();
                console.log(response);
            }
             this.isSending = false
        },
          editMember(item,index){
			if(!confirm("WARNING!!! Are you sure to edit this info?")){
                return;
            }
            this.edit_data.id = item.id
			this.edit_data.user_id = item.user_id
			this.edit_data.membership_start = item.membership_start
			this.edit_data.membership_end = item.membership_end
			delete this.edit_data.user
			this.editIndex = index
            this.editModal = true
            //var d = new Date();
 
            // var date = d.getDate();
            // var month = d.getMonth() + 1; // Since getMonth() returns month from 0-11 not 1-12
            // var year = d.getFullYear();
            
            // var dateStr = date + "/" + month + "/" + year;
            //console.log(dateStr);
           // console.log(this.edit_data.membership_start);
           // console.log(this.edit_data.membership_end);
            
        },

       
        async addMember(){
            if (this.form_data.user_id =='') {
               return this.e('Member name can not be empty!')
            }
            if (this.form_data.membership_start =='') {
               return this.e('Membership start date can not be empty!')
            }
            if (this.form_data.membership_end =='') {
               return this.e('Membership end date can not be empty!')
            }
           

        
            const response = await this.callApi('post', 'addMembership', this.form_data)
            if (response.status === 200) {
                if(response.data.success == false) this.e('This member is already added')
                else{
                     this.s('A New Member added')
                     this.data.push(response.data.membership)
                     this.nodata=false
                }
            
               
                this.form_data = {}
                this.addModal = false
            }else{
                this.swr()
            }
            this.isSending = false
        }  
},
async created(){
    
    if(this.isLoggedIn == false){
     this.$router.push('/login')
    }
        const [res1 ,res4] = await Promise.all([
        this.callApi('get','showMembership'),
        this.callApi('get','showUser')
        ])
        if(res1.status != 200 ) this.loaderCycle = true
        if(res1.status == 200   && res4.status == 200  ){
            this.loaderCycle = false
            this.data = res1.data.membership.data
            this.pagination = res1.data.membership
            if(this.data.length == 0) this.nodata = true
            this.users = res4.data.user
          
        }
            
        },
}
</script>



