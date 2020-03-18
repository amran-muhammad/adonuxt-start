<template>
    <div> 
     <Modal
			v-model="addModal"
			title="Add a new menu"
		  :mask-closable="false"
      :closable="false"
		>
    <div class="row">
				<div class="col-6 col-md-6">
					<div class="_3login_input_group">
						<p class="registration_title">Menu Name</p>
						<Input type="text" v-model="form_data.menuName" placeholder="Menu Name"/>
					</div>
				</div>
				<div class="col-6 col-md-6">
					<div class="_3login_input_group">
						<p class="registration_title">Menu Description</p>
						<Input type="textarea" v-model="form_data.menuDescription" placeholder="Menu Name"/>
					</div>
				</div>
          <div class="col-12 col-md-12">
					        <div class="_3login_input_group">
					         	<p class="registration_title">Image</p>
					        </div>
					
   
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
                        <img  style="width: 100%;height: auto;" v-if="form_data.menuImage" :src="form_data.menuImage" >
                    </div>
                </Card>
  
						</template> 
				
				</div>
			</div>
           <div slot="footer">
                <Button type="default" @click="addModal=false">Close</Button>
                <Button type="primary" :disabled="isSending" :loading="isSending" @click="addMenu">{{isSending ? 'Please wait...' : 'Add menu'}}</Button>
            </div>
    	</Modal>
      <Modal
		   v-model="editModal"
			:mask-closable="false"
			:closable="false"
      title="Edit Menu"
			>
		  	
			<div class="row">
				<div class="col-6 col-md-6">
					<div class="_3login_input_group">
						<p class="registration_title">Menu Name</p>
						<Input type="text" v-model="edit_data.menuName" placeholder="Menu Name"/>
					</div>
				</div>

          <div class="col-6 col-md-6">
					<div class="_3login_input_group">
						<p class="registration_title">Menu Description</p>
						<Input type="textarea" v-model="edit_data.menuDescription" placeholder="Menu Name"/>
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
                        <img  style="width: 100%;height: auto;" v-if="edit_data.menuImage" :src="edit_data.menuImage" >
                    </div>
                </Card>
							
						</template> 
					</div>
				</div>
			</div>
    <div slot="footer">
                <Button type="default" @click="editModal=false">Close</Button>
                <Button type="primary" :disabled="isSending" :loading="isSending" @click="updateMenu">{{isSending ? 'Please wait...' : 'Update menu'}}</Button>
            </div>
    	</Modal>
            <div class="row">
		          <div class="col-12 col-md-12 col-lg-12">
                <div class="_1card _mar_b15 _b_radious7 _5box_shadow _0border">
	               	<div  class="_1card_header _padd20">
			               <p class="_1card_header_title">Menus</p>
                     <template v-if="loaderCycle">
                            <div class="row">
                                <div class="col-md-4"></div>
                                <div class="col-md-4">  <p class="_1card_header_title">Loading...</p></div>
                                <div class="col-md-4"></div>
                            </div>
                        </template>
			                 <div class="_dashboard_actions ">
                      <button class="_btn_sm"  @click="addModal = true"><i class="fas fa-plus"></i> Add Menu</button>
                    
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
                            <th>Menu Name</th>
                            <th>Menu Image</th>
                            <th>Description</th>
                            <th>Image</th>
                            <th>Status</th>
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

                            <td>{{item.id}}</td>
                            <td>{{item.menuName}}</td>
                            <td><img :src="item.menuImage" alt=""  title=""></td>
                            <td>{{item.menuDescription}}</td>
                            <td>
                            <Modal v-model="imageModal"
                            :mask-closable="false"
                            :closable="false"
                            width="600px;"
                            height="500px;"
                            >
                            
                            <img  :src="photo" alt=""  title="">
                            <div slot="footer">
                              <Button type="default" @click="imageModal=false">Close</Button>
                            </div>
                            </Modal>
                            <button class="_btn _btn_outline_dark _btn_sm" @click="imageModalOn(item,index)">See Image</button>
                             </td>
                             <td>{{item.status}}</td>
                            <td>
                              <span v-if="item.status=='Activated'"><button class="_btn _btn_outline_secondary _btn_sm" @click="editStatus(item,index)">Deactive</button> </span>
                              <span v-if="item.status=='Deactivated'"><button class="_btn _btn_outline_success _btn_sm" @click="editStatus(item,index)">Active</button></span>
                              <button class="_btn _btn_outline_info _btn_sm" @click="editMenu(item,index)">Edit</button> 
                              <button class="_btn _btn_outline_danger _btn_sm" @click="deleteMenu(index)">Delete</button>
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
            addModal:false,
            editModal: false,
            editIndex:-1,
            pagination:{},
            page:1,
            editIndex:-1,
            data:[],
            loaderCycle: true,
            nodata: false,
        
            imgName: '',
		      	visible: false,
            textVisible: false,
            listMethod:false,
              crfObj: {
                "X-CSRF-TOKEN": document
                .querySelector('meta[name="csrf-token"]')
                  // .getAttribute("content")
              },
			
			
            form_data: {
                
                menuName: '',
                menuImage: '',
                menuDescription: '',
            },
            edit_data: {
                menuName: '',
                menuImage: '',
                menuDescription: '',
            },
             isSending: false,
           
		}
	},
    methods:{
       async pagination_result(e){

            this.page = e
            const res = await this.callApi('get',`showMenuForMenu?page=${this.page}`)
            if(res.status == 200){
                this.data = res.data.menu.data
                this.pagination = res.data.menu
               
            }
        },
        imageModalOn(item,index){
            this.imageModal = true
            this.photo = item.menuImage
        },
         async handleImageUpload(res, file) {
		    	if (res) {
				  this.form_data.menuImage = res
		  	  }
			
		    },
         async handleEditImageUpload(res, file) {
		      	if (res) {
				
				   this.edit_data.menuImage = res
			    }
			
		},
      
      
       async deleteMenu(index){
            // console.log(id)
            if(!confirm("WARNING!!! Are you sure to delete this info?")){
                return;
            }
            let ob = {
                id:this.data[index].id
            }

            const response = await this.callApi('post', 'deleteMenu',ob)
            if (response.status === 200) {
                this.data.splice(index,1)
                this.s('Menu deleted');

            }else{
                console.log(response);
                this.swr()
            }
        },
        	
		 async updateMenu () {
		
      if (this.edit_data.menuName.trim()=='')  return this.e('Menu Name can not be empty!!')
      if (this.edit_data.menuDescription.trim()=='')  return this.e('Description can not be empty!!')
      if (this.edit_data.menuImage=='')  return this.e('Menu Image needed!')
		
		
			const response = await this.callApi('post', 'editMenu', this.edit_data)
      if (response.status === 200) {
				this.data[this.editIndex] = response.data.menu
				this.edit_data ={}
				this.editIndex = -1
        this.editModal = false
        this.listMethod = false
				this.s('Menu Updated')
        }
       else{
        this.swr();
        console.log(response);
          }
        this.isSending = false
        },
        async editStatus(item,index){
            this.editIndex = index
            this.edit_data.id = item.id
            this.edit_data.menuName = item.menuName
            this.edit_data.menuImage = item.menuImage
            this.edit_data.menuDescription = item.menuDescription
            this.edit_data.status = item.status
            if(this.edit_data.status == 'Activated') this.edit_data.status = '1'
            if(this.edit_data.status == 'Deactivated') this.edit_data.status = '2'
            const response = await this.callApi('post', 'editMenu', this.edit_data)
            if (response.status == 200) {
                this.data[this.editIndex].status = response.data.menu.status
                this.s('Menu status changed')
                this.editIndex = -1
            }else{
                this.swr();
            }
        },
      editMenu(item,index){
			if(!confirm("WARNING!!! Are you sure to edit this info?")){
        return;
       }
			this.edit_data = _.cloneDeep(item)
			this.editIndex = index
			this.editModal = true
        },
        async addMenu(){
            if (this.form_data.menuName.trim() =='') {
               return this.e('Menu name can not be empty!')
            }
            if (this.form_data.menuImage =='') {
               return this.e('Image can not be empty!')
            }
            if (this.form_data.menuDescription.trim() =='') {
               return this.e('Menu Description can not be empty!')
            }
        
            const response = await this.callApi('post', 'addMenu', this.form_data)
            if (response.status === 200) {
                if(response.data.success == false) this.e('This menu is already added')
                else{
                    this.s('A New Menu added');
                  this.data.push(response.data.menu)
                  this.nodata=false
                }
                this.form_data = {}
                this.listMethod = false
                this.addModal = false
            }else{
                this.swr()
            }
             this.isSending = false
        }  
},
 async created(){
    
    const res = await this.callApi('get',`showMenuForMenu`)
		if( res.status != 200){
			this.loaderCycle = true
		} 
		if( res.status == 200){
      this.loaderCycle = false
      this.data = res.data.menu.data
      this.pagination= res.data.menu
      if(this.data.length == 0) this.nodata = true
		} else {
			this.swr()
		}
		this.isLoading = false
	},
}
</script>



