<template>
    <div>            
    <Modal
			v-model="addModal"
			title="Add a new notification"
			:mask-closable="false"
            :closable="false"
		>
        	
			
				<div class="row">
          
          <div class="col-12 col-md-12">
              <div class="_3login_input_group">
              <p class="registration_title">To</p>
              <Select v-model="form_data.receiver" style="width:100%" size="large">
                <Option  value="all">All Users</Option>
                <Option  value="active_members">All Active Members</Option>
                <Option  value="inactive_members">All Inctive Members</Option>
                <Option  value="nonmembers">All Non Members</Option>
              </Select>
            </div>
          </div>
          <div class="col-12 col-md-12">
              <div class="_3login_input_group">
              <p class="registration_title">Title</p>
              <Input type="text" v-model="form_data.title" placeholder="notification Name"/>
            </div>
          </div>
          <div class="col-12 col-md-12">
              <div class="_3login_input_group">
              <p class="registration_title">Message</p>
              <Input type="textarea" v-model="form_data.message" placeholder="notification Name"/>
            </div>
          </div>
          
			
				</div>

	     <div slot="footer">
          <Button type="default" @click="addModal=false">Close</Button>
          <Button type="primary" :disabled="isSending" :loading="isSending" @click="addNotification">{{isSending ? 'Please wait...' : 'Add notification'}}</Button>
        </div>
    	</Modal>
         <Modal
		   v-model="editModal"
			:mask-closable="false"
            :closable="false"
			title="Edit notification"
		>
        	
				
				<div class="row">
           <div class="col-12 col-md-12">
              <div class="_3login_input_group">
              <p class="registration_title">User Name</p>
              <Select v-model="edit_data.user_id" style="width:100%" size="large" clearable filterable :remote-method="getUser">
                <Option v-for="(item,index) in users" :key="index" :value="item.id">{{item.fullName}}</Option>
              </Select>
            </div>
          </div>
          <div class="col-12 col-md-12">
              <div class="_3login_input_group">
              <p class="registration_title">Title</p>
              <Input type="text" v-model="edit_data.title" placeholder="notification Name"/>
            </div>
          </div>
          <div class="col-12 col-md-12">
              <div class="_3login_input_group">
              <p class="registration_title">Message</p>
              <Input type="textarea" v-model="edit_data.message" placeholder="notification Name"/>
            </div>
          </div>
          
   
				</div>
         <div slot="footer">
                <Button type="default" @click="editModal=false">Close</Button>
                <Button type="primary" :disabled="isSending" :loading="isSending" @click="updateNotification">{{isSending ? 'Please wait...' : 'Update notification'}}</Button>
            </div>
	
    	</Modal>


<div class="row">
		<div class="col-12 col-md-12 col-lg-12">
       <div class="_1card _mar_b15 _b_radious7 _5box_shadow _0border">
		<div  class="_1card_header _padd20">
			<p class="_1card_header_title">Notifications</p>
      <template v-if="loaderCycle">
                            <div class="row">
                                <div class="col-md-4"></div>
                                <div class="col-md-4">  <p class="_1card_header_title">Loading...</p></div>
                                <div class="col-md-4"></div>
                            </div>
                        </template>
			  <div class="_dashboard_actions ">
                      <button class="_btn _btn_outline_danger _btn_sm"  @click="deleteAll"> Delete All</button>
                      <button class="_btn_sm"  @click="addModal = true"><i class="fas fa-plus"></i> Add notification</button>
                    
         </div>
		</div>
         <div class="_table_responsive">
          
            <template v-if="!loaderCycle">
                      <table class="_table">
                        <thead v-if="!nodata" class="bg-200 text-900">
                          <tr>
                            <th>ID</th>
                            <th>User</th>
                            <th>Title</th>
                            <th>Message</th>
                            
                            <th>Seen</th>
                            <th>Action</th>
                          </tr>

                        </thead>
                        <template v-if="nodata">
                          <div class="row">
                              <div class="col-md-4"></div>
                              <div class="col-md-4"> <p class="_1card_header_title">No Data Found</p>  </div>
                              <div class="col-md-4"></div>
                          </div>
                        </template>
                         
                      <tbody>
                        <tr v-for="(item,index) in data" :key="index">
                            <td>
                              {{item.id}}
                            </td>
                            <td v-if="item.user">{{item.user.fullName}}</td>
                            <td>{{item.title}}</td>
                            <td>{{item.message}}</td>
                            
                            <td>{{item.seen}}</td>
                            <td><button class="_btn _btn_outline_info _btn_sm" @click="editNotification(item,index)">Edit</button>  
                            <button class="_btn _btn_outline_danger _btn_sm" @click="deleteNotification(index)">Delete</button></td>
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

    
</template>

<script>
export default {
    data(){
		return{
            addModal:false,
            editModal: false,
            editIndex:-1,
            loaderCycle:true,
            nodata:false,
            data:[],
            users:[],
            pagination:{},
            page:1,
			      form_data: {
                user_id: '',
                title: '',
                message: '',
                receiver:''
                
            },
            edit_data: {
                user_id: '',
                title: '',
                message: '',
                
            },
            isSending: false,
           
		}
	},
    methods:{
    async deleteAll(){
      
        const res = await this.callApi('post','deleteAllNotification')
        if(res.status == 200) {
          this.data = []
          this.s("All Notifications has been deleted!")
        }
      
      },
      async pagination_result(e){
        this.page = e
        const res = await this.callApi('get',`showNotification?page=${this.page}`)
        if(res.status == 200){
            this.data = res.data.notification.data
            this.pagination = res.data.notification     
        }
    },
        async getUser(query){
            const res = await this.callApi('get',`showUser?search=${query}`);
            if(res.status == 200){
                this.users = res.data.user
            }
          },

       async deleteNotification(index){
            // console.log(id)
            if(!confirm("WARNING!!! Are you sure to delete this info?")){
                return;
            }
            let ob = {
                id:this.data[index].id
            }

            const response = await this.callApi('post', 'deleteNotification',ob)
            if (response.status === 200) {
                this.data.splice(index,1)
                this.s('notification deleted');

            }else{
                console.log(response);
                this.swr()
            }
        },
        	
		 async updateNotification () {
       
		
      if (this.edit_data.user_id=='')  return this.e('User Name can not be empty! !')
      if (this.edit_data.title.trim()=='')  return this.e('Title can not be empty! !')
      if (this.edit_data.message.trim()=='')  return this.e('Message can not be empty! !')
    
			
			const response = await this.callApi('post', 'editNotification', this.edit_data)
            if (response.status === 200) {
				this.data[this.editIndex] = response.data.notification
				this.edit_data ={}
				this.editIndex = -1
				this.editModal = false
				this.s('Notification Updated')
            }else{
                this.swr();
            }
             this.isSending = false
        },
      editNotification(item,index){
			if(!confirm("WARNING!!! Are you sure to edit this info?")){
                return;
            }
			this.edit_data = _.cloneDeep(item)
			this.editIndex = index
      this.editModal = true
      delete this.edit_data.user
        },

       
        async addNotification(){
          
          if (this.form_data.receiver=='')  return this.e('Receiver of notifications must needed! !')
          if (this.form_data.title.trim()=='')  return this.e('Title can not be empty! !')
          if (this.form_data.message.trim()=='')  return this.e('Message can not be empty! !')
       
            const response = await this.callApi('post', 'addNotification', this.form_data)
            if (response.status === 200) {
              location.reload()
              this.s('A New notification added');
              //this.data.unshift(response.data.notification)
             //this.nodata=false
              this.form_data = {}
              this.addModal = false
            }else{
                this.swr()
            }
             this.isSending = false
        }  
},
 async created(){
   
    const res = await this.callApi('get',`showNotification`)
      if( res.status != 200){
        this.loaderCycle = true
      }
		if( res.status == 200){
      this.data = res.data.notification.data
      this.pagination = res.data.notification
      this.loaderCycle = false
      if(this.data.length == 0) this.nodata = true
		} else {
			this.swr()
		}
		this.isLoading = false
	},
}
</script>



