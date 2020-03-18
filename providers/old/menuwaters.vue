<template>
    <div>
         <Modal
			v-model="addModal"
			title="Add A Menu - Water"
		
			:mask-closable="false"
			:closable="false"
		>
        <div class="row">
				<div class="col-6 col-md-6">
					<div class="_3login_input_group">
						<p class="registration_title">Menu Name</p>
						<Select v-model="form_data.menu_id" style="width:100%" size="large" >
                            <Option v-for="(item,index) in menu" :key="index" :value="item.id">{{item.menuName}}</Option>
                        </Select>	
					</div>
				</div>
				<div class="col-6 col-md-6">
					<div class="_3login_input_group">
						<p class="registration_title">Water Name</p>
						<Select v-model="form_data.water_id" style="width:100%" size="large" >
                            <Option v-for="(item,index) in water" :key="index" :value="item.id">{{item.waterName}}</Option>
                        </Select>	
					</div>
				</div>
				</div>
        <div slot="footer">
                <Button type="default" @click="addModal=false">Close</Button>
                <Button type="primary" :disabled="isSending" :loading="isSending" @click="addMenuWaters">{{isSending ? 'Please wait...' : 'Add menu water'}}</Button>
            </div>
    	</Modal>
         <Modal
		   v-model="editModal"
			:mask-closable="false"
			:closable="false"
			title="Edit Menu Water"
		>	
			<div class="row">
				<div class="col-6 col-md-6">
					<div class="_3login_input_group">
						<p class="registration_title">Menu Name</p>
						<Select v-model="edit_data.menu_id" style="width:100%" size="large" >
                            <Option v-for="(item,index) in menu" :key="index" :value="item.id">{{item.menuName}}</Option>
                        </Select>	
					</div>
				</div>
				<div class="col-6 col-md-6">
					<div class="_3login_input_group">
						<p class="registration_title">Water Name</p>
						<Select v-model="edit_data.water_id" style="width:100%" size="large" >
                            <Option v-for="(item,index) in water" :key="index" :value="item.id">{{item.waterName}}</Option>
                        </Select>	
					</div>
				</div>
				</div>
              <div slot="footer">
                <Button type="default" @click="editModal=false">Close</Button>
                <Button type="primary" :disabled="isSending" :loading="isSending" @click="updateMenuWaters">{{isSending ? 'Please wait...' : 'Update menu water'}}</Button>
            </div>
	
    	</Modal>
         <div class="row">
		  <div class="col-12 col-md-12 col-lg-12">
                <div class="_1card _mar_b15 _b_radious7 _5box_shadow _0border">
		<div  class="_1card_header _padd20">
			<p class="_1card_header_title">Menu - Waters</p>
            <template v-if="loaderCycle">
                            <div class="row">
                                <div class="col-md-4"></div>
                                <div class="col-md-4">  <p class="_1card_header_title">Loading...</p></div>
                                <div class="col-md-4"></div>
                            </div>
                        </template>
           
			<div class="_dashboard_actions _d_flex align-items-center">
                 <!-- <p class="_flex_auto _1text _padd_r10">Sort By</p> -->
              <div class="_flex_auto _padd_r10">
                <Select v-model="search" style="width:100%" size="small" placeholder="Select Menu">
                  <Option v-for="(item,index) in menu" :key="index" :value="item.id">{{item.menuName}}</Option>
                  <Option  :value="''">All</Option>
                </Select>
              </div>
                      <button class="_btn_sm"  @click="addModal = true"><i class="fas fa-plus"></i> Add Menu Water</button>
                    
            </div>
         </div>
         <div class="_table_responsive">
             
            
            <template  v-if="!loaderCycle">
                      <table class="_table">
                        <thead v-if="!nodata" class="bg-200 text-900">
                          <tr>
                            <th>
                              ID
                            </th>

                            <th>Menu Name</th>
                            <th>Menu Image</th>
                            <th>Water Name</th>
                            <th>Water Image</th>

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
                      <tr v-for="(item,index) in filteredItems" :key="index">

                            <td>
                              {{item.id}}
                            </td>
                            <td v-if="item.menu">
                                {{item.menu.menuName}}
                            </td>
                             
                            <td v-if="item.menu">
                                 <img class="_menu_img" height="25px" width="25px" :src="item.menu.menuImage" alt=""  title="">
                            </td>
                            <td v-if="item.water">
                               {{item.water.waterName}}
                            </td>
                            <td v-if="item.water">
                                 <img class="_menu_img" height="25px" width="25px" :src="item.water.waterImage" alt=""  title="">
                            </td>
                            <td>
                                <button class="_btn _btn_outline_info _btn_sm" @click="editMenuWaters(item,index)">Edit</button>
                                <button @click="deleteMenuWaters(index)" type="button" class="_btn _btn_outline_danger _btn_sm">Delete</button>
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
            loaderCycle: true,
            nodata: false,
            editIndex:-1,
            pagination:{},
            page:1,
            data:[],
            menu:[],
            water:[],
            search:'',
            form_data: {
                menu_id:'',
                water_id:''   
            },
            edit_data: {
                 menu_id:'',
                water_id:''
              
            },
            isSending: false,   
		}
	},
    methods:{
        async pagination_result(e){

            this.page = e
            const res = await this.callApi('get',`showMenuWatersForMenuWaters?page=${this.page}`)
            if(res.status == 200){
                this.data = res.data.menuwaters.data
                this.pagination = res.data.menuwaters      
            }
        },

       async deleteMenuWaters(index){
            // console.log(id)
            if(!confirm("WARNING!!! Are you sure to delete this info?")){
                return;
            }
            let ob = {
                id:this.data[index].id
            }

            const response = await this.callApi('post', 'deleteMenuWaters',ob)
            if (response.status === 200) {
                this.data.splice(index,1)
                this.s('Menu Water deleted');

            }else{
                console.log(response);
                this.swr()
            }
        },
        	
             editMenuWaters(item,index){
               if(!confirm("WARNING!!! Are you sure to edit this info?")){
                   return;
               }
               this.editIndex = index
               this.edit_data = _.cloneDeep(item)
               this.editModal = true
               delete this.edit_data.menu
               delete this.edit_data.water
           },
		 async updateMenuWaters () {
		
             if (this.edit_data.menu_id =='') {
               return this.e('Menu name can not be empty!')
            }
            if (this.edit_data.water_id =='') {
               return this.e('Water name can not be empty!')
            }
			const response = await this.callApi('post', 'editMenuWaters', this.edit_data)
            if (response.status === 200) {
				this.filteredItems[this.editIndex] = response.data.menuwaters
				this.edit_data ={}
				this.editIndex = -1
				this.editModal = false
				this.s('Menu Water Updated')
            }else{
                this.swr();
                console.log(response);
            }
             this.isSending = false
        },

       
        async addMenuWaters(){
            if (this.form_data.menu_id =='') {
               return this.e('Menu name can not be empty!')
            }
            if (this.form_data.water_id =='') {
               return this.e('Water name can not be empty!')
            }
            const response = await this.callApi('post', 'addMenuWaters', this.form_data)
            if (response.status === 200) {
                if(response.data.success == false) this.e('This menu-water is already added')
            
               else{
                    this.s('A New Menu Water added');
                this.data.push(response.data.menuwaters)
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
    
            const [res1, res2 , res3] = await Promise.all([
            this.callApi('get','showMenuWatersForMenuWaters'),
            this.callApi('get','showMenu'),
            this.callApi('get','showWater'),
        ])
        if(res1.status != 200) this.loaderCycle = true
        if(res1.status == 200 && res2.status == 200 && res3.status == 200){
            this.loaderCycle = false
            this.data = res1.data.menuwaters.data
            this.pagination = res1.data.menuwaters
            this.menu = res2.data.menu
            this.water = res3.data.water

            if(this.data.length == 0) this.nodata = true
            
        }
            
        },


    computed: {
        filteredItems(){
            return this.data.filter((item) => {
                return item.menu_id.toString().match(this.search);
            });
        }
        }
}
</script>



