<template>
    <div>
    <Modal
			v-model="addModal"
			title="Add A New Ingedient"
			:mask-closable="false"
			:closable="false"
		>
        	
			<Form v-model="form_data">	
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
						<p class="registration_title">Ingredient Name</p>
						<Input type="text" v-model="form_data.ingredientName" placeholder="Ingredient Name"/>
					</div>
				</div>
				<div class="col-6 col-md-6">
					<div class="_3login_input_group">
						<p class="registration_title">Ingredient Quantity</p>
						<Input type="number" v-model="form_data.ingQuantity" placeholder="Ingredient Quantity (gram unit)"/>
					</div>
				</div>
				<div class="col-6 col-md-6">
					<div class="_3login_input_group">
						<p class="registration_title">Ingredient Calory</p>
						<Input type="number" v-model="form_data.ingCalory" placeholder="Ingredient Calory  (calory unit)"/>
					</div>
				</div>

                
				</div>
			</Form>
	      <div slot="footer">
                <Button type="default" @click="addModal=false">Close</Button>
                <Button type="primary" :disabled="isSending" :loading="isSending" @click="addIngredient">{{isSending ? 'Please wait...' : 'Add ingredient'}}</Button>
            </div>
    	</Modal>
         <Modal
		   v-model="editModal"
			:mask-closable="false"
			:closable="false"
			
			title="Edit Ingredient"
		>
        	
				
				<Form v-model="edit_data">	
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
						<p class="registration_title">Ingredient Name</p>
						<Input type="text" v-model="edit_data.ingredientName" placeholder="Ingredient Name"/>
					</div>
				</div>
				<div class="col-6 col-md-6">
					<div class="_3login_input_group">
						<p class="registration_title">Ingredient Quantity</p>
						<Input type="number" v-model="edit_data.ingQuantity" placeholder="Ingredient Quantity (gram unit)"/>
					</div>
				</div>
				<div class="col-6 col-md-6">
					<div class="_3login_input_group">
						<p class="registration_title">Ingredient Calory</p>
						<Input type="number" v-model="edit_data.ingCalory" placeholder="Ingredient Calory  (calory unit)"/>
					</div>
				</div>

         
				</div>
			</Form>

      <div slot="footer">
        <Button type="default" @click="editModal=false">Close</Button>
        <Button type="primary" :disabled="isSending" :loading="isSending" @click="updateIngredient">{{isSending ? 'Please wait...' : 'Update ingredients'}}</Button>
      </div>
    </Modal>

    <div class="row">
		  <div class="col-12 col-md-12 col-lg-12">
        <div class="_1card _mar_b15 _b_radious7 _5box_shadow _0border">
          <div  class="_1card_header _padd20">
            <p class="_1card_header_title">Ingredients</p>
            <template v-if="loaderCycle">
              <div class="row">
                  <div class="col-md-4"></div>
                  <div class="col-md-4">  <p class="_1card_header_title">Loading...</p></div>
                  <div class="col-md-4"></div>
              </div>
            </template>

            <!-- <div class="_d_flex align-items-center">
              <p class="_flex_auto _1text _padd_r10">Sort By</p>
                      
              
            </div> -->

            <div class="_dashboard_actions _d_flex align-items-center">
              <!-- <p class="_flex_auto _1text _padd_r10">Sort By</p> -->
              <div class="_flex_auto _padd_r10">
                <Select v-model="search" style="width:100%" size="small" >
                  <Option v-for="(item,index) in menu" :key="index" :value="item.id">{{item.menuName}}</Option>
                  <Option :value="''">All</Option>
                  
                </Select>
              </div>
              <div class="_flex_auto">
                <button class="_btn_sm"  @click="addModal = true"><i class="fas fa-plus"></i> Add Ingredient</button>
              </div>
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
                  <th>Ingredient</th>
                  <th>Quantity</th>
                  <th>Calory</th>
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
                    <td v-if="item.menu">{{item.menu.menuName}}</td>
                  
                    <td v-if="item.menu">
                      <img class="_menu_img" height="25px" width="25px" :src="item.menu.menuImage" alt=""  title="">
                    </td> 
                  <td>
                    {{item.ingredientName}}
                  </td>
                  <td>
                    {{item.ingQuantity}}
                  </td>
                  <td>
                    {{item.ingCalory}}
                  </td>
                  <td><button class="_btn _btn_outline_info _btn_sm" @click="editIngredient(item,index)">Edit</button>  <button class="_btn _btn_outline_danger _btn_sm" @click="deleteIngredient(index)">Delete</button></td>
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
            pagination:{},
            page:1,
            editIndex:-1,
            data:[],
            menu:[],
			      form_data: {
                ingredientName: '',
                ingQuantity: '',
                ingCalory: '',
                menu_id: ''
            },
            edit_data: {
                ingredientName: '',
                ingQuantity: '',
                ingCalory: '',
                menu_id: ''
            },
            isSending: false,
            search:''
            	}
	},
    methods:{
      async pagination_result(e){

            this.page = e
            const res = await this.callApi('get',`showIngredient?page=${this.page}`)
            if(res.status == 200){
                this.data = res.data.ingredient.data
                this.pagination = res.data.ingredient       
            }
        },

        async getMenu(){
           
            
            const res = await this.callApi('get',`showMenu`);
            if(res.status == 200){
                this.menu = res.data.menu
            }
            
        },
        async deleteIngredient(index){
            // console.log(id)
            if(!confirm("WARNING!!! Are you sure to delete this info?")){
                return;
            }
            let ob = {
                id:this.data[index].id
            }

            const response = await this.callApi('post', 'deleteIngredient',ob)
            if (response.status === 200) {
                this.data.splice(index,1)
                this.s('Ingredient deleted');

            }else{
                console.log(response);
                this.swr()
            }
        },
        	
		async updateIngredient () {
          if(isNaN(this.edit_data.ingQuantity)) return this.e('Ingredient Quantity must be a number!')
          if(isNaN(this.edit_data.ingCalory))  return this.e('Ingredient Calory must be a number!')
           if (this.edit_data.menu_id=='')  return this.e('Menu can not be empty! !')
           if (this.edit_data.ingredientName.trim()=='')  return this.e('Ingredient Name can not be empty! !')
           if (this.edit_data.ingQuantity=='')  return this.e('Ingredient Quantity can not be empty! !')
           if (this.edit_data.ingCalory=='')  return this.e('Ingredient Calory can not be empty! !')
          
			   const response = await this.callApi('post', 'editIngredient', this.edit_data)
        if (response.status == 200) {
				this.filteredItems[this.editIndex] = response.data.ingredient
			//	this.data[this.editIndex].menu = response.data.ingredient.menu
				this.edit_data ={}
        this.editIndex = -1
        
				this.editModal = false
				this.s('Ingredient Updated')
            }else{
                this.swr();
                console.log(response);
            }
             this.isSending = false
        },
        editIngredient(item,index){
        if(!confirm("WARNING!!! Are you sure to edit this info?")){
                  return;
              }
        this.edit_data = _.cloneDeep(item)
        this.editIndex = index
        delete this.edit_data.menu
        this.editModal = true
        },

       
        async addIngredient(){
          if(isNaN(this.form_data.ingQuantity.trim())) return this.e('Ingredient Quantity must be a number!')
          if(isNaN(this.form_data.ingCalory.trim()))  return this.e('Ingredient Calory must be a number!')
           if (this.form_data.menu_id=='')  return this.e('Menu can not be empty!')
           if (this.form_data.ingredientName.trim()=='')  return this.e('Ingredient Name can not be empty!')
           if (this.form_data.ingQuantity=='')  return this.e('Ingredient Quantity can not be empty!')
           if (this.form_data.ingCalory=='')  return this.e('Ingredient Calory can not be empty!')
          
            const response = await this.callApi('post', 'addIngredient', this.form_data)
            if (response.status === 200) {
              if(response.data.success == false) this.e('This ingredient is already added')
            
               else{
                  this.s('A New Ingredient added');
                this.data.push(response.data.ingredient)
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
  
            const [res1, res2] = await Promise.all([
            this.callApi('get','showIngredient'),
            this.callApi('get','showMenu')
        ])

      if(res1.status != 200){
        this.loaderCycle = true
      }

        if(res1.status == 200 && res2.status == 200){
          this.loaderCycle = false
          this.data = res1.data.ingredient.data
          this.pagination = res1.data.ingredient
          this.menu = res2.data.menu

          if(this.data.length == 0){
            this.nodata = true
          }
            
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



