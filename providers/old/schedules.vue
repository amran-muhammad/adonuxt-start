<template>
    <div>    
    <Modal
			v-model="addModal"
			title="Add A New Schedule"
			
			:mask-closable="false"
			:closable="false"
		>
        	
				
				<div class="row">
				<div class="col-12 col-md-12">
					<div class="_3login_input_group">
						<p class="registration_title">Schedule Name</p>
						<Input type="text" v-model="form_data.scheduleName" placeholder="Schedule Name"/>
					</div>
				</div>
				</div>
   <div slot="footer">
                <Button type="default" @click="addModal=false">Close</Button>
                <Button type="primary" :disabled="isSending" :loading="isSending" @click="addSchedule">{{isSending ? 'Please wait...' : 'Add schedule'}}</Button>
      </div>
	
    	</Modal>
         <Modal
		   v-model="editModal"
			:mask-closable="false"
			:closable="false"
			
			title="Edit Schedule"
		>
        	
				
				<div class="row">
				<div class="col-12 col-md-12">
					<div class="_3login_input_group">
						<p class="registration_title">Schedule Name</p>
            <template v-if="loaderCycle">
                            <div class="row">
                                <div class="col-md-4"></div>
                                <div class="col-md-4">  <p class="_1card_header_title">Loading...</p></div>
                                <div class="col-md-4"></div>
                            </div>
                        </template>
						<Input type="text" v-model="edit_data.scheduleName" placeholder="Schedule Name"/>
					</div>
				</div>
				</div>
         <div slot="footer">
                <Button type="default" @click="editModal=false">Close</Button>
                <Button type="primary" :disabled="isSending" :loading="isSending" @click="updateSchedule">{{isSending ? 'Please wait...' : 'Update schedule'}}</Button>
            </div>
	
    	</Modal>
            <div class="row">
		 
		          <div class="col-12 col-md-12 col-lg-12">
                <div class="_1card _mar_b15 _b_radious7 _5box_shadow _0border">
	               	<div  class="_1card_header _padd20">
			<p class="_1card_header_title">Schedules</p>
			<div class="_dashboard_actions ">
                      <button class="_btn_sm"  @click="addModal = true"><i class="fas fa-plus"></i> Add Schedule</button>
                    
         </div>
         </div>
         <div class="_table_responsive">
            
            
      <template v-if="!loaderCycle">
      <table class="_table">
        <thead v-if="!nodata" class="bg-200 text-900">
          <tr>
            <th>
              ID
            </th>

            <th>Schedule</th>

            <th>Action</th>

          </tr>
        </thead>
        <template v-if="nodata">
              <div class="row">
                
                  <div class="col-md-4"></div>
                  <div class="col-md-4"><p class="_1card_header_title">No Data Found</p></div>
                  <div class="col-md-4"></div>
                
              </div>
           </template>
        <tbody>
      <tr v-for="(item,index) in data" :key="index">
            <td>
              {{item.id}}
            </td>
            <td>{{item.scheduleName}}</td>
            <td>
              <button class="_btn _btn_outline_info _btn_sm" @click="editSchedule(item,index)">Edit</button> 
             <button class="_btn _btn_outline_danger _btn_sm" @click="deleteSchedule(index)">Delete</button>
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
      </template>
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
            pagination:{},
            page:1,
            data:[],
            loaderCycle:true,
            nodata:false,
			
            form_data: {
                
                scheduleName: '',
            },
            edit_data: {
                
                scheduleName: '',
            },
            isSending: false,
           
		}
	},
    methods:{
      async pagination_result(e){

            this.page = e
            const res = await this.callApi('get',`showScheduleForSchedule?page=${this.page}`)
            if(res.status == 200){
                this.data = res.data.schedule.data
                this.pagination = res.data.schedule
               
            }
        },

       async deleteSchedule(index){
            // console.log(id)
            if(!confirm("WARNING!!! Are you sure to delete this info?")){
                return;
            }
            let ob = {
                id:this.data[index].id
            }

            const response = await this.callApi('post', 'deleteSchedule',ob)
            if (response.status === 200) {
                this.data.splice(index,1)
                this.s('Schedule deleted');

            }else{
                console.log(response);
                this.swr()
            }
        },
        	
		 async updateSchedule () {
		
           if (this.edit_data.scheduleName.trim() =='')  return this.e('Schedule Name can not be empty! !')
			
			const response = await this.callApi('post', 'editSchedule', this.edit_data)
            if (response.status === 200) {
				this.data[this.editIndex] = response.data.schedule
				this.edit_data ={}
				this.editIndex = -1
				this.editModal = false
				this.s('Schedule Updated')
            }else{
                this.swr();
                console.log(response);
            }
             this.isSending = false
        },
          editSchedule(item,index){
			if(!confirm("WARNING!!! Are you sure to edit this info?")){
                return;
            }
			this.edit_data = _.cloneDeep(item)
			this.editIndex = index
			this.editModal = true
        },

       
        async addSchedule(){
            if (this.form_data.scheduleName.trim() =='') {
               return this.e('Schedule name can not be empty!')
            }
            const response = await this.callApi('post', 'addSchedule', this.form_data)
            if (response.status === 200) {
               if(response.data.success == false) this.e('This schedule is already added')
            
               else{
                  this.s('A New Schedule added');
                this.data.push(response.data.schedule)
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
   
    const res = await this.callApi('get',`showScheduleForSchedule`)
		if( res.status != 200){
      this.loaderCycle = true
    }
		if( res.status == 200){
      this.loaderCycle = false
      this.data = res.data.schedule.data
      this.pagination = res.data.schedule
      if(this.data.length == 0) this.nodata = true
		} else {
			this.swr()
		}
		this.isLoading = false
	},
}
</script>



