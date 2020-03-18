<template>
    <div>
    <Drawer
        v-model="addModal"
        title="Add a new Language"
        width="920"
        
		>
	            <div class="row">
                    <div class="col-12 col-md-12">
                        <div class="_3login_input_group">
                            <p class="registration_title">Language Name</p>
                            <Input type="text" v-model="form_data.name" placeholder="Language Name"/>
                        </div>
                    </div>
                    <div class="col-12 col-md-12">
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
                                <img  style="width: 100%;height: 250px;" v-if="form_data.flag_language" :src="form_data.flag_language" >
                            </div>
                        </Card>
  
						</template> 
                    </div>
                    <div class="col-12 col-md-12">
                         <Input type="textarea" :rows="8" v-model="form_data.translation" placeholder="TRANSLATION"/>
                    </div>
				</div>
                

	    <div>
            <Button type="default" @click="addModal=false">Close</Button>
            <Button type="primary" :disabled="isSending" :loading="isSending" @click="addLanguage">{{isSending ? 'Please wait...' : 'Add Language'}}</Button>
        </div>
    	</Drawer>
       

        

<div class="row">
		<div class="col-12 col-md-12 col-lg-12">
       <div class="_1card _mar_b15 _b_radious7 _5box_shadow _0border">
		<div  class="_1card_header _padd20">
			<p class="_1card_header_title">Languages</p>
      <template v-if="loaderCycle">
                            <div class="row">
                                <div class="col-md-4"></div>
                                <div class="col-md-4">  <p class="_1card_header_title">Loading...</p></div>
                                <div class="col-md-4"></div>
                            </div>
                        </template>
			  <div class="_dashboard_actions ">
          <button class="_btn_sm"  @click="addModal = true"><i class="fas fa-plus"></i> Add Language</button>
        </div>
                    
		</div>
         <div class="_table_responsive">
            <template v-if="!loaderCycle">
              <table class="_table">
                <thead v-if="!nodata" class="bg-200 text-900">
                  <tr>
                    <th>ID</th>
                    <th>Language</th>
                    <th>Flag</th>
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
                    <td>{{item.id}}</td>
                    <td>{{item.name}}</td>
                    <td>
                        <img class="_menu_img" height="25px" width="25px" :src="item.flag_language" alt=""  title="">
                    </td>
                    <td>
                      <button class="_btn _btn_outline_info _btn_sm" @click="editLanguage(item,index)">Edit</button> 
                      <button class="_btn _btn_outline_danger _btn_sm" @click="deleteLanguage(index)">Delete</button>
                      </td>
                  </tr>
                </tbody>
              </table>
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
            loaderCycle:true,
            nodata:false,
            data:[],
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
                name: '',
                flag_language: '',
                translation: '',
            },
                
            edit_data: {
                name: '',
                flag_language: '',
                translation: '',
            },
            isSending: false,
           
		}
	},
    methods:{
        async handleImageUpload(res, file) {
		    	if (res) {
				  this.form_data.flag_language = res
		  	  }
			
		    },
        async handleEditImageUpload(res, file) {
		      	if (res) {
				
				   this.edit_data.flag_language = res
                }
        },

       async deleteLanguage(index){
            // console.log(id)
            if(!confirm("WARNING!!! Are you sure to delete this info?")){
                return;
            }
            let ob = {
                id:this.data[index].id
            }
            const response = await this.callApi('post', 'deleteLanguage',ob)
            if (response.status === 200) {
                this.data.splice(index,1)
                this.s('Language deleted');

            }else{
                console.log(response);
                this.swr()
            }
        },

        	
		async updateLanguage () {
       
		
        if (this.edit_data.name.trim()=='')  return this.e('Language Name can not be empty! !')
			
			const response = await this.callApi('post', 'editLanguage', this.edit_data)
            if (response.status === 200) {
				this.data[this.editIndex] = response.data.language
				this.edit_data ={}
				this.editIndex = -1
				this.editModal = false
				this.s('Language Updated')
            }else{
                this.swr();
                console.log(response);
            }
            this.isSending = false
        },
        editLanguage(item,index){
			this.$router.push(`/editlang/${item.id}`)
        },

       
        async addLanguage(){
          
            if (this.form_data.name.trim() =='') {
               return this.e('Language  can not be empty!')
            }
            if (this.form_data.translation.trim() =='') {
               return this.e('Language Translation  can not be empty!')
            }
            if (this.form_data.flag_language.trim() =='') {
               return this.e('Language Flag  is reqired!')
            }
            //this.form_data.translation = JSON.stringify(this.form_data.translation)
            const response = await this.callApi('post', 'addLanguage', this.form_data)
            if (response.status === 200) {
               if(response.data.success == false) this.e('This Language is already added')
            
                else{
                  this.s('A New Language added');
                this.data.push(response.data.language)
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
   
        const res = await this.callApi('get',`showLanguage`)
        	if( res.status != 200){
            this.loaderCycle = true
          }
		if( res.status == 200){
      this.data = res.data.language
      this.loaderCycle = false
      if(this.data.length == 0) this.nodata = true
		} else {
			this.swr()
		}
		this.isLoading = false
	},
}
</script>



