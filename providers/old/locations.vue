<template>
    <div>
    <Modal
			v-model="addModal"
			title="Add a new location"
			:mask-closable="false"
            :closable="false"
		>
				<div class="row">
				<div class="col-12 col-md-12">
					<div class="_3login_input_group">
						<p class="registration_title">Location Name</p>
						<Input type="text" v-model="form_data.locationName" placeholder="Location Name"/>
					</div>
				</div>
				</div>

	     <div slot="footer">
                <Button type="default" @click="addModal=false">Close</Button>
                <Button type="primary" :disabled="isSending" :loading="isSending" @click="addLocation">{{isSending ? 'Please wait...' : 'Add location'}}</Button>
            </div>
    	</Modal>
         <Modal
		   v-model="editModal"
			:mask-closable="false"
            :closable="false"
			title="Edit location"
		>
        	
				
				<div class="row">
				<div class="col-12 col-md-12">
					<div class="_3login_input_group">
						<p class="registration_title">Location Name</p>
						<Input type="text" v-model="edit_data.locationName" placeholder="Location Name"/>
					</div>
				</div>
				</div>
         <div slot="footer">
                <Button type="default" @click="editModal=false">Close</Button>
                <Button type="primary" :disabled="isSending" :loading="isSending" @click="updateLocation">{{isSending ? 'Please wait...' : 'Update location'}}</Button>
            </div>
	
    	</Modal>


<div class="row">
		<div class="col-12 col-md-12 col-lg-12">
       <div class="_1card _mar_b15 _b_radious7 _5box_shadow _0border">
		<div  class="_1card_header _padd20">
			<p class="_1card_header_title">Locations</p>
      <template v-if="loaderCycle">
                            <div class="row">
                                <div class="col-md-4"></div>
                                <div class="col-md-4">  <p class="_1card_header_title">Loading...</p></div>
                                <div class="col-md-4"></div>
                            </div>
                        </template>
			  <div class="_dashboard_actions ">
          <button class="_btn_sm"  @click="addModal = true"><i class="fas fa-plus"></i> Add Location</button>
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
                    <th>Location</th>
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
                    <td> {{item.locationName}}</td>
                    <td>
                      <button class="_btn _btn_outline_info _btn_sm" @click="editLocation(item,index)">Edit</button> 
                      <button class="_btn _btn_outline_danger _btn_sm" @click="deleteLocation(index)">Delete</button>
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
            loaderCycle:true,
            nodata:false,
            data:[],
			
            form_data: {
                
                locationName: '',
            },
            edit_data: {
                
                locationName: '',
            },
            isSending: false,
           
		}
	},
    methods:{
       async pagination_result(e){

            this.page = e
            const res = await this.callApi('get',`showLocationForLocation?page=${this.page}`)
            if(res.status == 200){
                this.data = res.data.location.data
                this.pagination = res.data.location
               
            }
        },

       async deleteLocation(index){
            // console.log(id)
            if(!confirm("WARNING!!! Are you sure to delete this info?")){
                return;
            }
            let ob = {
                id:this.data[index].id
            }

            const response = await this.callApi('post', 'deleteLocation',ob)
            if (response.status === 200) {
                this.data.splice(index,1)
                this.s('Location deleted');

            }else{
                console.log(response);
                this.swr()
            }
        },
        	
		 async updateLocation () {
       
		
      if (this.edit_data.locationName.trim()=='')  return this.e('Location Name can not be empty! !')
			
			const response = await this.callApi('post', 'editLocation', this.edit_data)
            if (response.status === 200) {
				this.data[this.editIndex] = response.data.location
				this.edit_data ={}
				this.editIndex = -1
				this.editModal = false
				this.s('Location Updated')
            }else{
                this.swr();
                console.log(response);
            }
             this.isSending = false
        },
          editLocation(item,index){
			if(!confirm("WARNING!!! Are you sure to edit this info?")){
                return;
            }
			this.edit_data = _.cloneDeep(item)
			this.editIndex = index
			this.editModal = true
        },

       
        async addLocation(){
          
            if (this.form_data.locationName.trim() =='') {
               return this.e('Location  can not be empty!')
            }
            const response = await this.callApi('post', 'addLocation', this.form_data)
            if (response.status === 200) {
               if(response.data.success == false) this.e('This location is already added')
            
                else{
                  this.s('A New Location added');
                this.data.push(response.data.location)
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
   
        const res = await this.callApi('get',`showLocationForLocation`)
        	if( res.status != 200){
            this.loaderCycle = true
          }
		if( res.status == 200){
      this.data = res.data.location.data
                this.pagination = res.data.location
      this.loaderCycle = false
      if(this.data.length == 0) this.nodata = true
		} else {
			this.swr()
		}
		this.isLoading = false
	},
}
</script>



