<template>
    <div>
       
         <Modal
			v-model="addModal"
			title="Add A New Complementary"
		
			:mask-closable="false"
			:closable="false"
		>
      
				<div class="row">
				<div class="col-6 col-md-6">
					<div class="_3login_input_group">
						<p class="registration_title">Complementary Option 1</p>
						<Input type="text" v-model="form_data.complementaryOption1" placeholder="Complementary Option 1"/>
					</div>
				</div>
				<div class="col-6 col-md-6">
					<div class="_3login_input_group">
						<p class="registration_title">Complementary Option 2</p>
						<Input type="text" v-model="form_data.complementaryOption2" placeholder="Complementary Option 2"/>
					</div>
				</div>
				</div>
        <div slot="footer">
                <Button type="default" @click="addModal=false">Close</Button>
                <Button type="primary" :disabled="isSending" :loading="isSending" @click="addComplementary">{{isSending ? 'Please wait...' : 'Add complementary'}}</Button>
            </div>
    	</Modal>
         <Modal
		   v-model="editModal"
			:mask-closable="false"
			:closable="false"
			title="Edit Complementary"
		>
        	
				
			<div class="row">
				<div class="col-6 col-md-6">
					<div class="_3login_input_group">
						<p class="registration_title">Complementary Option 1 </p>
						<Input type="text" v-model="edit_data.complementaryOption1" placeholder="Complementary Option 1"/>
					</div>
				</div>
				<div class="col-6 col-md-6">
					<div class="_3login_input_group">
						<p class="registration_title">Complementary Option 2 </p>
						<Input type="text" v-model="edit_data.complementaryOption2" placeholder="Complementary Option 2"/>
					</div>
				</div>
			</div>
              <div slot="footer">
                <Button type="default" @click="editModal=false">Close</Button>
                <Button type="primary" :disabled="isSending" :loading="isSending" @click="updateComplementary">{{isSending ? 'Please wait...' : 'Update complementary'}}</Button>
            </div>
	
    	</Modal>
         <div class="row">
		  <div class="col-12 col-md-12 col-lg-12">
                <div class="_1card _mar_b15 _b_radious7 _5box_shadow _0border">
		<div  class="_1card_header _padd20">
			<p class="_1card_header_title">Complementaries</p>
      <template v-if="loaderCycle">
                          
                        <div class="row">
                            <div class="col-md-4"></div>
                            <div class="col-md-4">  <p class="_1card_header_title">Loading...</p></div>
                            <div class="col-md-4"></div>
                        </div>
                          
                </template>
			<div class="_dashboard_actions ">
                      <button class="_btn_sm"  @click="addModal = true"><i class="fas fa-plus"></i> Add Complementary</button>
                    
         </div>
         </div>
         <div class="_table_responsive">
           
            
              <template v-if="!loaderCycle">
              <table class="_table">
                
                <thead v-if="!loaderCycle" class="bg-200 text-900">
                  <tr>
                    <th>
                      ID
                    </th>

                    <th>Complementary Option 1</th>
                    <th>Complementary Option 2</th>

                    <th>Action</th>

                  </tr>
                </thead>

                

                <template v-if="nodata">
                          
                        <div class="row">
                            <div class="col-md-4"></div>
                            <div class="col-md-4">  <p class="_1card_header_title">No Data Found</p></div>
                            <div class="col-md-4"></div>
                        </div>
                          
                      </template>

                <tbody>
              <tr v-for="(item,index) in data" :key="index">

                    <td>
                      {{item.id}}
                    </td>
                    <td>
                        {{item.complementaryOption1}}
                    </td>
                    <td>
                        {{item.complementaryOption2}}
                    </td>
                    <td>
                        <button class="_btn _btn_outline_info _btn_sm" @click="editComplementary(item,index)">Edit</button>
                        <button @click="deleteComplementary(index)" type="button" class="_btn _btn_outline_danger _btn_sm">Delete</button></td>
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
            loaderCycle: true,
            nodata: false,
            editIndex:-1,
            pagination:{},
            page:1,
            data:[],
			
            form_data: {
                
                complementaryOption1: '',
                complementaryOption2: '',
            },
            edit_data: {
                
                complementaryOption1: '',
                complementaryOption2: '',
            },
            isSending: false,
           
		}
	},
    methods:{
      async pagination_result(e){
        this.page = e
        const res = await this.callApi('get',`showComplementaryForC?page=${this.page}`)
        if(res.status == 200){
            this.data = res.data.complementary.data
            this.pagination = res.data.complementary
            }
        },

       async deleteComplementary(index){
            // console.log(id)
            if(!confirm("WARNING!!! Are you sure to delete this info?")){
                return;
            }
            let ob = {
                id:this.data[index].id
            }

            const response = await this.callApi('post', 'deleteComplementary',ob)
            if (response.status === 200) {
                this.data.splice(index,1)
                this.s('Complementary deleted');

            }else{
                console.log(response);
                this.swr()
            }
        },
        	
		 async updateComplementary () {
		
           if (this.edit_data.complementaryOption1.trim()=='')  return this.e('Complementary Option 1 can not be empty! !')
           if (this.edit_data.complementaryOption2.trim()=='')  return this.e('Complementary Option 2 can not be empty! !')
			
			const response = await this.callApi('post', 'editComplementary', this.edit_data)
            if (response.status === 200) {
				this.data[this.editIndex] = response.data.complementary
				this.edit_data ={}
				this.editIndex = -1
				this.editModal = false
				this.s('Complementary Updated')
            }else{
                this.swr();
                console.log(response);
            }
             this.isSending = false
        },
          editComplementary(item,index){
			if(!confirm("WARNING!!! Are you sure to edit this info?")){
                return;
            }
			this.edit_data = _.cloneDeep(item)
			this.editIndex = index
			this.editModal = true
        },

       
        async addComplementary(){
            if (this.form_data.complementaryOption1.trim() =='') {
               return this.e('Complementary  Option 1 can not be empty!')
            }
            if (this.form_data.complementaryOption2.trim() =='') {
               return this.e('Complementary  Option 2 can not be empty!')
            }
            const response = await this.callApi('post', 'addComplementary', this.form_data)
            if (response.status === 200) {
               if(response.data.success == false) this.e('This complementary is already added')
            
                else{
                  this.s('A New Complementary added');
                this.data.push(response.data.complementary)
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
   
  const res = await this.callApi('get',`showComplementaryForC`)
  if( res.status != 200){
     this.loaderCycle = true
  }
  if( res.status == 200){
    this.loaderCycle = false
    this.data = res.data.complementary.data
    this.pagination = res.data.complementary
    if(this.data.length == 0) this.nodata = true
  } else {
    this.swr()
  }
  this.isLoading = false
},
}
</script>



