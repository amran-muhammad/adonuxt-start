<template>
    <div>
        <Modal
			v-model="addModal"
			title="Add A New Water"
			:mask-closable="false"
            :closable="false"
		    >
        	
				
			<div class="row">
				<div class="col-12 col-md-12">
					<div class="_3login_input_group">
						<p class="registration_title">Water Name</p>
						    <Input type="text" v-model="form_data.waterName" placeholder="Water Name"/>
					</div>
				</div>
                <div class="col-12 col-md-12">
					<div class="_3login_input_group">
						<p class="registration_title">Image</p>
					
						<template>
							<Upload
                                ref="upload"
                                 type="drag"
                                :headers="crfObj"
                                :with-credentials="true"
                                :on-success="handleImageUpload"
                                name="img" action="/app/upload_image">
                                <div style="padding: 20px 0">
                                    <Icon type="ios-cloud-upload" size="52" style="color: #3399ff"></Icon>
                                    <p>Click or drag files here to upload</p>
                                </div>
                            </Upload>
                            <Card  span="10" offset="1">
                                <div style="text-align:center">
                                    <img  style="width: 100%;height: auto;" v-if="form_data.waterImage" :src="form_data.waterImage" >
                                </div>
                            </Card>
							
						</template> 
					</div>
				</div>
			</div>
             <div slot="footer">
                <Button type="default" @click="addModal=false">Close</Button>
                <Button type="primary" :disabled="isSending" :loading="isSending" @click="addWater">{{isSending ? 'Please wait...' : 'Add water'}}</Button>
            </div>
    	</Modal>
        <Modal
		   v-model="editModal"
			:mask-closable="false"
			:closable="false"
            title="Edit Water"
			>
            <div class="row">
				<div class="col-12 col-md-12">
					<div class="_3login_input_group">
						<p class="registration_title">Water Name</p>
						<Input type="text" v-model="edit_data.waterName" placeholder="Water Name"/>
					</div>
				</div>
                <div class="col-12 col-md-12">
                    <div class="_3login_input_group">
                        <p class="registration_title">Image</p>
                        <template>
                            <Upload
                                ref="upload"
                                type="drag"
                                :headers="crfObj"
                                :with-credentials="true"
                                :on-success="handleEditImageUpload"
                                name="img" action="/app/upload_image">

                                <div style="padding: 20px 0">
                                    <Icon type="ios-cloud-upload" size="52" style="color: #3399ff"></Icon>
                                    <p>Click or drag files here to upload</p>
                                </div>

                            </Upload>
                            <Card  span="10" offset="1">
                                <div style="text-align:center">
                                    <img  style="width: 100%;height: auto;" v-if="edit_data.waterImage" :src="edit_data.waterImage" >
                                </div>
                            </Card>
                            
                        </template> 
                    </div>
                </div>
			</div>
            <div slot="footer">
                <Button type="default" @click="editModal=false">Close</Button>
                <Button type="primary" :disabled="isSending" :loading="isSending" @click="updateWater">{{isSending ? 'Please wait...' : 'Update water'}}</Button>
            </div>
	
    	</Modal>
        
      
        <div class="row">
		    <div class="col-12 col-md-12 col-lg-12">
                <div class="_1card _mar_b15 _b_radious7 _5box_shadow _0border">
		            <div  class="_1card_header _padd20">
			            <p class="_1card_header_title">Waters</p>
                        <template v-if="loaderCycle">
                            <div class="row">
                                <div class="col-md-4"></div>
                                <div class="col-md-4">  <p class="_1card_header_title">Loading...</p></div>
                                <div class="col-md-4"></div>
                            </div>
                        </template>
			                <div class="_dashboard_actions ">
                                 <button class="_btn_sm"  @click="addModal = true"><i class="fas fa-plus"></i> Add Water</button>
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
                            <th>Water</th>
                            <th>Water Image</th>
                            <th>Image</th>
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
                                {{item.waterName}}</td>
                            <td>
                                <img class="_menu_img" height="25px" width="25px" :src="item.waterImage" alt=""  title="">
                            </td>
                            <td> 
                            <!-- <img  :src="item.waterImage" alt="" title=""> -->
                            <Modal v-model="imageModal"
                            
                            :mask-closable="false"
                            :closable="false"
                            width="600px;"
                            height="500px;"
                            title="Water">
                                <img  :src="photo" alt=""  title="">
                                <div slot="footer">
                                    <Button type="default" @click="imageModal=false">Close</Button>
                                </div>
                            </Modal>
                             <button  class="_btn _btn_outline_dark _btn_sm" @click="imageModalOn(item,index)">See Image</button>
                             </td>
                             <td>
                                <button class="_btn _btn_outline_info _btn_sm" @click="editWater(item,index)">Edit</button>
                              <button class="_btn _btn_outline_danger _btn_sm" @click="deleteWater(index)">Delete</button>
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
            photo:'',
            imageModal:false,
            loaderCycle:true,
            nodata:false,
            addModal:false,
            editModal: false,
            editIndex:-1,
            pagination:{},
            page:1,
            data:[],
            imgName: '',
			visible: false,
            textVisible: false,
            listMethod:true,
        
			
			
            form_data: {
                waterName: '',
                waterImage: '',
            },
            edit_data: {
                waterName: '',
                waterImage: '',
            },
             crfObj: {
               "X-CSRF-TOKEN": document
               .querySelector('meta[name="csrf-token"]')
                 // .getAttribute("content")
      },
       isSending: false, 
		}
	},
    methods:{
        async pagination_result(e){
            this.page = e
            const res = await this.callApi('get',`showWaterForWater?page=${this.page}`)
            if(res.status == 200){
                this.data = res.data.water.data
                this.pagination = res.data.water
               
            }
        },
        imageModalOn(item,index){
            this.imageModal = true
            this.photo = item.waterImage
        },
        async handleImageUpload(res, file) {
			if (res) {
				this.form_data.waterImage = res
                res = ''
			}
			
		},
         async handleEditImageUpload(res, file) {
			if (res) {
                this.edit_data.waterImage = res
                res = ''
			}
			
		},
                
        async deleteWater(index){
            // console.log(id)
            if(!confirm("WARNING!!! Are you sure to delete this info?")){
                return;
            }
            let ob = {
                id:this.data[index].id
            }

            const response = await this.callApi('post', 'deleteWater',ob)
            if (response.status === 200) {
                this.data.splice(index,1)
                this.s('Water deleted');

            }else{
                console.log(response);
                this.swr()
            }
        },
           
		async updateWater () {
		
           if (this.edit_data.waterName.trim()=='')  return this.e('Water Name can not be empty! !')
           if (this.edit_data.waterImage=='')  return this.e('Water Image needed!')
		
			const response = await this.callApi('post', 'editWater', this.edit_data)
            if (response.status === 200) {
				this.data[this.editIndex] = response.data.water
				this.edit_data ={}
				this.editIndex = -1
				this.editModal = false
                this.s('Water Updated')
            }else{
                this.swr();
                console.log(response);
            }
             this.isSending = false       
        },
        editWater(item,index){
			if(!confirm("WARNING!!! Are you sure to edit this info?")){
                return;
            }
			this.edit_data = _.cloneDeep(item)
			this.editIndex = index
			this.editModal = true
        },

       
        async addWater(){
            if (this.form_data.waterName.trim() =='') {
               return this.e('Water name can not be empty!')
            }
            if (this.form_data.waterImage=='')  return this.e('Water Image needed!')

        
            const response = await this.callApi('post', 'addWater', this.form_data)
            if (response.status === 200) {
                if(response.data.success == false) this.e('This Water is already added')
            
                else{
                    this.s('A New Water added')
                this.data.push(response.data.water)
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
     const res = await this.callApi('get',`showWaterForWater`)
        if(res.status != 200){
            this.loaderCycle = true 
        }
		if( res.status == 200){
            this.loaderCycle = false
            this.data = res.data.water.data
            this.pagination = res.data.water
            if(this.data.length == 0){
                this.nodata = true
            }
		} else {
			this.swr()
		}
		this.isLoading = false
	},
}
</script>



