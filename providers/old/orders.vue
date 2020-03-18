<template>
    <div>
        
         <Modal
			v-model="addModal"
			title="Add a new order"
			:mask-closable="false"
            :closable="false"
		>

        
			<div class="row">
				<div class="col-6 col-md-6">
					<div class="_3login_input_group">
						<p class="registration_title">Users</p>
						<Select v-model="form_data.users" style="width:100%" size="large" multiple clearable filterable :remote-method="getUser">
                            <Option v-for="(item,index) in users" :key="index" :value="item.id">{{item.fullName}}</Option>
                        </Select>	
					</div>
				</div>
				<div class="col-6 col-md-6">
					<div class="_3login_input_group">
						<p class="registration_title">Menu Name</p>
						<Select v-model="form_data.menu_id" style="width:100%" size="large"  @on-change="selectWater">
                            <Option v-for="(item,index) in menu" :key="index" :value="item.id">{{item.menuName}}</Option>
                        </Select>	
					</div>
				</div>
				<div class="col-6 col-md-6">
					<div class="_3login_input_group">
						<p class="registration_title">Water Name</p>
						<Select v-model="waters" style="width:100%" size="large" multiple>
                            <Option v-for="(item,index) in water" :key="index" :value="item.water.waterName"><span v-if="item.water">{{item.water.waterName}}</span></Option>
                        </Select>	
					</div>
				</div>

				<div class="col-6 col-md-6">
                    <template v-if="loader2">
                        <span>Complementaries loading...</span>
                        <div class="loader-2"></div>
                    </template>
                    <template v-else>
                        <div class="_3login_input_group">
                            <div v-for="(c, i) in complementary" :key="i">
                                <p class="registration_title">Complementary option {{i+1}}</p>
                                <RadioGroup v-model="c.choosenOption">
                                    <Radio :label="c.complementary.complementaryOption1">
                                    <span>{{c.complementary.complementaryOption1}}</span>
                                    </Radio>
                                    <Radio :label="c.complementary.complementaryOption2">
                                        <span>{{c.complementary.complementaryOption2}}</span>
                                    </Radio>
                                    
                                </RadioGroup>

                            </div>
                        </div>
                    </template>
				</div>
				<div class="col-6 col-md-6">
					<div class="_3login_input_group">
						<p class="registration_title">Schedule</p>
						<Select v-model="form_data.schedule_id" style="width:100%" size="large" >
                            <Option v-for="(item,index) in schedule" :key="index" :value="item.id">{{item.scheduleName}}</Option>
                        </Select>	
					</div>
				</div>
			</div>
        
	     <div slot="footer">
                <Button type="default" @click="addModal=false">Close</Button>
                <Button type="primary" :disabled="isSending" :loading="isSending" @click="addOrder">{{isSending ? 'Please wait...' : 'Add order'}}</Button>
            </div>
    	</Modal>
         <Modal
		   v-model="editModal"
			:mask-closable="false"
            :closable="false"
			title="Edit Order"
		>
        <div class="row">
				<div class="col-6 col-md-6">
					<div class="_3login_input_group">
						<p class="registration_title">User</p>
						<Select v-model="edit_data.user_id" style="width:100%" size="large" >
                            <Option v-for="(item,index) in users" :key="index" :value="item.id">{{item.fullName}}</Option>
                        </Select>	
					</div>
				</div>
				<div class="col-6 col-md-6">
					<div class="_3login_input_group">
						<p class="registration_title">Menu Name</p>
						<Select v-model="edit_data.menu_id" style="width:100%" size="large"  @on-change="selectWaterEdit">
                            <Option v-for="(item,index) in menu" :key="index" :value="item.id">{{item.menuName}}</Option>
                        </Select>	
					</div>
				</div>
				<div class="col-6 col-md-6">
					<div class="_3login_input_group">
						<p class="registration_title">Water Name</p>
						<Select v-model="waters" style="width:100%" size="large" multiple>
                            <Option v-for="(item,index) in water" :key="index" :value="item.water.waterName">
                                <span v-if="item.water">{{item.water.waterName}}</span>
                            </Option>
                        </Select>	
					</div>
				</div>

				<div class="col-6 col-md-6">
                    <template v-if="complementary==''">
                         <span>Complementaries loading...</span>
                         <div class="loader-2"></div>
                    </template>
                    <template v-else>
                        <div class="_3login_input_group">
                            <div v-for="(c, i) in complementary" :key="i">
                                <p class="registration_title">Complementary option {{i+1}}</p>
                                <RadioGroup v-model="c.choosenOption">
                                    <Radio :label="c.complementary.complementaryOption1">
                                    <span>{{c.complementary.complementaryOption1}}</span>
                                    </Radio>
                                    <Radio :label="c.complementary.complementaryOption2">
                                        <span>{{c.complementary.complementaryOption2}}</span>
                                    </Radio>
                                    
                                </RadioGroup>

                            </div>
                        </div>
                    </template>
				</div>
				<div class="col-6 col-md-6">
					<div class="_3login_input_group">
						<p class="registration_title">Schedule</p>
						<Select v-model="edit_data.schedule_id" style="width:100%" size="large" >
                            <Option v-for="(item,index) in schedule" :key="index" :value="item.id">{{item.scheduleName}}</Option>
                        </Select>	
					</div>
				</div>
			</div>
        	
				
         <div slot="footer">
                <Button type="default" @click="editModal=false">Close</Button>
                <Button type="primary" :disabled="isSending" :loading="isSending" @click="updateOrder">{{isSending ? 'Please wait...' : 'Update order'}}</Button>
            </div>
	
    	</Modal> 
         <Modal
            v-model="customModal"
            :mask-closable="false"
            :closable="false"
            width="600px;"
            height="500px;"
            >
        <p>{{customorder}}</p>
        
        
        <div slot="footer">
            <Button type="default" @click="customModal=false">Close</Button>
        </div> 
        </Modal>  
        <div class="row">
		  <div class="col-12 col-md-12 col-lg-12">
                <div class="_1card _mar_b15 _b_radious7 _5box_shadow _0border">
		<div  class="_1card_header _padd20">
			<p class="_1card_header_title">Orders</p>
            <template v-if="loaderCycle">
                            <div class="row">
                                <div class="col-md-4"></div>
                                <div class="col-md-4">  <p class="_1card_header_title">Loading...</p></div>
                                <div class="col-md-4"></div>
                            </div>
                        </template>
           
			    <div class="_dashboard_actions _d_flex align-items-center">
                    <Select v-model="selectedDate"  @on-change="sortBy" placeholder="Sort By Date">
                        <Option value="1">Today's Order</Option>
                        <Option value="2">Tomorrow's Order</Option>
                        <Option value="3">Yesterday's Order</Option>
                        <Option value="4">All Order</Option>   
                    </Select>

                    <Select class="_mar_l10 _mar_r10" v-model="status" @on-change="sortBy" placeholder="Sort By Status">
                        <Option value="completed">Completed Orders</Option>
                        <Option value="pending">Pending Orders</Option> 
                        <Option value="all">All Orders</Option>  
                    </Select>

                    <button class="_btn_sm _btn"  @click="addModalOn"><i class="fas fa-plus"></i> Add orders</button>
                </div>
			  
		</div>
         <div class="_table_responsive">
             
            
                      <table class="_table">
                        <thead v-if="!nodata" class="bg-200 text-900">
                          <tr>
                            <th>
                              ID
                            </th>

                            <th>Order Date</th>
                            <th>User</th>
                            <th>Customer Order</th>
                            <th>Menu Name</th>
                            <th>Menu Image</th>
                            <th>Waters</th>
                            <th>Complementaries</th>
                            <th>Schedule</th>
                            <th>Status</th>
                            <th>Comment</th>
                            <th>Action</th>

                          </tr>
                        </thead>
                         <template v-if="nodata">
                          
                        <div class="row">
                            <div class="col-md-4"></div>
                            <div class="col-md-4"> <p class="_1card_header_title">No Data Found</p> </div>
                            <div class="col-md-4"></div>
                        </div>
                     
                    </template>
                    <tbody>
                      <tr v-for="(item,index) in data" :key="index">
                            <td>
                              {{item.id}}
                            </td>
                            <td>
                              {{item.order_date}}
                            </td>
                            <td v-if="item.user">
                                {{item.user.fullName}}
                            </td>
                            <td><button class="_btn _btn_outline_info _btn_sm" @click="customModalOn(item,index)">See Details</button></td>
                            <td v-if="item.menu">
                                {{item.menu.menuName}}
                            </td>
                            <td v-if="item.menu">
                                <img class="_menu_img" height="25px" width="25px" :src="item.menu.menuImage" alt=""  title="">
                            </td>
                            <td>
                                {{item.waters}}
                            </td>
                            <td>
                                {{item.complementary}}
                            </td>
                            <td v-if="item.schedule">
                                {{item.schedule.scheduleName}}
                            </td>
                            
                            <td>
                                {{item.status}}
                            
                            </td>
                            <td>
                                <span v-if="item.comment">{{item.comment}}</span>
                             <!-- <i  @click="changeStatus(item,index)" class="fas fa-edit"></i> -->
                            </td>
                            <td>
                                
                                    <span v-if="item.status=='pending'"><button class="_btn _btn_outline_success _btn_sm" @click="changeStatus(item,index)">Mark Complete</button> </span>
                                    <span v-if="item.status=='completed'"><button class="_btn _btn_outline_dark _btn_sm" @click="changeStatus(item,index)">Mark Pending</button> </span>
                                
                                <button class="_btn _btn_outline_danger _btn_sm" @click="deleteOrder(index)">Delete</button>
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
            customModal: false,
            editIndex:-1,
            data:[],
            users:[],
            menu:[],
            water:[],
            waters:null,
            complementary:[],
            schedule:[],
            comps:[],
            status:'',
            date:'',
            loaderCycle: true,
            loader2: false,
            nodata: false,
            pagination:{},
            page:1,
            c:{
                choosenOption:[]
            },
            selectedDate:'',
            form_data: {
                
                waters:'',
                menu_id:'',
                schedule_id:'',
                users:[],
                complementary:'',
                order_date:''
            },
            edit_data: {
                waters:'',
                menu_id:'',
                schedule_id:'',
                user_id:'',
                complementary:''
            },
            isSending: false,
            customorder: '',

		}
	},
    methods:{
        customModalOn(item,index){
            this.customModal = true,
            this.customorder = item.customorder
        },
         async getUser(query){
            const res = await this.callApi('get',`showValidUser?search=${query}`);
            if(res.status == 200){
                this.users = res.data.user
            }
            },
        async addModalOn(){
            this.addModal = true
            const res = await this.callApi('get','showValidUser')
            if(res.status == 200){
                this.users = res.data.user
            }
            this.form_data = {}
        },
         async pagination_result(e){

            this.page = e
            const res = await this.callApi('get',`showOrder?page=${this.page}`)
            if(res.status == 200){
                this.data = res.data.order.data
                this.pagination = res.data.order   
            }
        },
        async sortBy(){
			if(this.selectedDate == '1'){ 
            var d = new Date();
            d.setDate(d.getDate() - 1); 
            var date = d.getDate();
            var month = d.getMonth() + 1; // Since getMonth() returns month from 0-11 not 1-12
            var year = d.getFullYear();

            if(month<10 && date<10) this.date = year+ "-0" + month + "-0" + date;
            
            else if(month<10 && date>10) this.date = year+ "-0" + month + "-" + date;

            else if(month>10 && date<10) this.date = year+ "-" + month + "-0" + date;
            
            else this.date = year+ "-" + month + "-" + date;
            
     
                }
			
			if(this.selectedDate == '2'){ 
                var d = new Date();
 
            var date = d.getDate();
            var month = d.getMonth() + 1; // Since getMonth() s month from 0-11 not 1-12
            var year = d.getFullYear();
            
            if(month<10 && date<10) this.date = year+ "-0" + month + "-0" + date;
            
            else if(month<10 && date>10) this.date = year+ "-0" + month + "-" + date;

            else if(month>10 && date<10) this.date = year+ "-" + month + "-0" + date;
            
            else this.date = year+ "-" + month + "-" + date;
            
            }
           
            if(this.selectedDate == '3'){ 
            var d = new Date();
            d.setDate(d.getDate() - 2); 
            var date = d.getDate();
            var month = d.getMonth() + 1; // Since getMonth() s month from 0-11 not 1-12
            var year = d.getFullYear();
            
            if(month<10 && date<10) this.date = year+ "-0" + month + "-0" + date;
            
            else if(month<10 && date>10) this.date = year+ "-0" + month + "-" + date;

            else if(month>10 && date<10) this.date = year+ "-" + month + "-0" + date;
            
            else this.date = year+ "-" + month + "-" + date; 
            }

            if(this.selectedDate == '4'){ 
           
             this.date = ''; 
            }
           
     
            const res11 =await this.callApi('get',`showOrder?status=${this.status}&date=${this.date}`)
            if(res11.status == 200){
                this.data = res11.data.order.data
                this.pagination = res11.data.order
                
            }
                
			
			
			
		},
        async selectWater(){
            if(this.form_data.menu_id){

            }
            const [res1, res2] = await Promise.all([
            this.callApi('get',`showMenuWaterItems?menu_id=${this.form_data.menu_id}`),
            this.callApi('get',`showMenuComplementaryItems?menu_id=${this.form_data.menu_id}`)
        ])
        if(res2.status != 200) this.loader2 = true
        if(res1.status == 200 && res2.status == 200){
            this.water = res1.data.water
            this.complementary = res2.data.complementary 
            if(this.complementary.length != 0) this.loader2 = false
            
        }
            
        },
        async selectWaterEdit(){
            if(this.edit_data.menu_id){
                const [res1, res2] = await Promise.all([
                this.callApi('get',`showMenuWaterItems?menu_id=${this.edit_data.menu_id}`),
                this.callApi('get',`showMenuComplementaryItems?menu_id=${this.edit_data.menu_id}`)
                ])

        if(res1.status == 200 && res2.status == 200){
            this.water = res1.data.water
            this.complementary = res2.data.complementary  
        }
            }
            
        },

       async deleteOrder(index){
            // console.log(id)
            if(!confirm("WARNING!!! Are you sure to delete this info?")){
                return;
            }
            let ob = {
                id:this.data[index].id
            }

            const response = await this.callApi('post', 'deleteOrder',ob)
            if (response.status === 200) {
                this.data.splice(index,1)
                this.s('Order deleted');

            }else{
                console.log(response);
                this.swr()
            }
        },
        	
		 async updateOrder () {
		
             if (this.edit_data.user_id =='') {
               return this.e('User Name can not be empty!')
            }
            if (this.edit_data.menu_id =='') {
               return this.e('Menu Name can not be empty!')
            }
            if (this.waters =='') {
               return this.e('Water can not be empty!')
            }
            if (this.edit_data.schedule_id =='') {
               return this.e('Schedule can not be empty!')
            }
             let str = ''
            for(let c of this.complementary){
                
                if(c.choosenOption){
                    str += c.choosenOption + ','
                }

            }
            if(str != '') this.edit_data.complementary = str
             let str2 = ''
            for(let c of this.waters){
                
                if(c){
                    str2 += c + ','
                }

            }
            if(str2 != '') this.edit_data.waters = str2
			const response = await this.callApi('post', 'editOrder', this.edit_data)
            if (response.status == 200) {
				this.data[this.editIndex] = response.data.order
				this.edit_data ={}
				this.editIndex = -1
				this.editModal = false
				this.s('Order Updated')
            }else{
                this.swr();
             
            }
             this.isSending = false
        },
         async editOrder(item,index){
             
             if(!confirm("WARNING!!! Are you sure to edit this info?")){
                 return;
            }
            this.edit_data ={}
            this.waters = ''

            this.c.choosenOption =[]
			
        //call
        
          this.edit_data = _.cloneDeep(this.data[index])
         if(this.edit_data.menu_id){

             const [res1, res2] = await Promise.all([
             this.callApi('get',`showMenuWaterItems?menu_id=${this.edit_data.menu_id}`),
             this.callApi('get',`showMenuComplementaryItems?menu_id=${this.edit_data.menu_id}`)
         ])
        if(res1.status == 200 && res2.status == 200){
            this.water = res1.data.water
            this.complementary = res2.data.complementary    
           
        
        }
            }
        //call-end
        
			this.editIndex = index
			this.editModal = true
			delete this.edit_data.menu
			delete this.edit_data.user
			delete this.edit_data.schedule
		
        },
        async changeStatus(item,index){
            this.editIndex = index
            this.edit_data.id = item.id
            this.edit_data.menu_id = item.menu_id
            this.edit_data.user_id = item.user_id
            this.edit_data.schedule_id = item.schedule_id
            this.edit_data.waters = item.waters
            this.edit_data.status = item.status
            this.edit_data.complementary = item.complementary
            if(this.edit_data.status == 'completed') this.edit_data.status = '1'
            if(this.edit_data.status == 'pending') this.edit_data.status = '2'
            delete this.edit_data.menu
			delete this.edit_data.user
            delete this.edit_data.schedule
            const response = await this.callApi('post', 'editOrder', this.edit_data)
            if (response.status == 200) {
                this.data[this.editIndex].status = response.data.order.status
                this.s('Order status changed')
                this.editIndex = -1
            }else{
                this.swr();
            }
        },

        async addOrder(){
            
            if (this.form_data.users.length ==0) {
               return this.e('User Name can not be empty!')
            }
            if (this.form_data.menu_id =='') {
               return this.e('Menu Name can not be empty!')
            }
            if (this.waters =='') {
               return this.e('Water can not be empty!')
            }
            if (this.form_data.schedule_id =='') {
               return this.e('Schedule can not be empty!')
            }
           
            let str = ''
            for(let c of this.complementary){
                
                if(c.choosenOption){
                    str += c.choosenOption + ','
                }

            }
             this.form_data.complementary = str
            let str2 = ''
            for(let c of this.waters){
                if(c){
                str2 += c + ','
                }
            }
            this.form_data.waters = str2
            var d = new Date();
 
            var date = d.getDate();
            var month = d.getMonth() + 1; // Since getMonth() returns month from 0-11 not 1-12
            var year = d.getFullYear();
            
            this.form_data.order_date  = year + "-" + month + "-" + date;

            const response = await this.callApi('post', 'addOrder', this.form_data)
            if (response.status === 200) {
                this.s('A  order added');
                 this.nodata=false
                for(let c of response.data.order){
                this.data.unshift(c)
                }
                
                this.waters = null
                this.form_data = {}
                this.addModal = false
            
            }else{
                this.swr()
            }
            this.isSending = false
        }  
},

async created(){
     const [ res1, res2 , res4] = await Promise.all([
                this.callApi('get','showOrder'),
                this.callApi('get','showMenu'),
                this.callApi('get','showSchedule')
            ])
    
        
        if(res1.status != 200 ) this.loaderCycle = true
        if(res1.status == 200 ){

            this.loaderCycle = false
            this.data = res1.data.order.data
            this.pagination = res1.data.order
            if(this.data.length == 0){
                this.nodata= true
            }
        }
         
        if( res2.status == 200  && res4.status == 200){
           this.menu = res2.data.menu
           this.schedule = res4.data.schedule
        }    
    }
            
}
</script>



