<template>
    <div>
        <Form v-model="form_data">
            	<div class="col-3 col-md-3">
					<div class="_3login_input_group">
						<p class="registration_title">User Name</p>
						<Input type="text" v-model="form_data.fullName" placeholder="Enter Full Name"/>
					</div>
				</div>
				<div class="col-3 col-md-3">
					<div class="_3login_input_group">
						<p class="registration_title">Email</p>
						<Input type="text" v-model="form_data.email" placeholder="Enter Email"/>
					</div>
				</div>
				<div class="col-3 col-md-3">
					<div class="_3login_input_group">
						<p class="registration_title">Phone</p>
						<Input type="text" v-model="form_data.phone" placeholder="Enter Phone Number"/>
					</div>
				</div>
				<div class="col-3 col-md-3">
					<div class="_3login_input_group">
						<p class="registration_title">Password</p>
						<Input type="password" v-model="form_data.password" placeholder="Enter Password"/>
					</div>
				</div>
				<div class="col-3 col-md-3">
					<div class="_3login_input_group">
						<p class="registration_title">Password Confirmation</p>
						<Input type="password" v-model="form_data.password_confirmation" placeholder="Enter Password"/>
					</div>
				</div>
				<div class="col-3 col-md-3">
					<div class="_3login_input_group">
						<p class="registration_title">Address</p>
						<Input type="text" v-model="form_data.address" placeholder="Enter Address"/>
					</div>
				</div>
				
				<div class="col-4 col-md-4">
					<div class="_3login_input_group">
						<p class="registration_title">Location Name</p>
						<Select v-model="form_data.location_id" style="width:100%" size="large" clearable filterable :remote-method="getLocation">
                            <Option v-for="(item,index) in location" :key="index" :value="item.id">{{item.locationName}}</Option>
                        </Select>
						<!-- <Input type="text" v-model="form_data.productId" placeholder="Quantity"/> -->
					</div>
				</div>
				<div class="col-4 col-md-4">
					<div class="_3login_input_group">
						<p class="registration_title">Schedule Name</p>
						<Select v-model="form_data.schedule_id" style="width:100%" size="large" clearable filterable :remote-method="getSchedule">
                            <Option v-for="(item,index) in schedule" :key="index" :value="item.id">{{item.scheduleName}}</Option>
                        </Select>
						<!-- <Input type="text" v-model="form_data.productId" placeholder="Quantity"/> -->
					</div>
				</div>
					<div class="col-3 col-md-3">
					<div class="_3login_input_group">
						<p class="registration_title">Who Picks It?</p>
						<Input type="text" v-model="form_data.whoPicksIt" placeholder="Enter A Name"/>
					</div>
				</div>
                <button @click="registration" class="_btn _btn_info" type="button">Submit</button>
        </Form>


    </div>
</template>

<script>
export default {
    data(){
		return{
            
            
            
            location:[],
            schedule:[],
			
            form_data: {
                
                fullName: '',
            
				email: '',
				address:'',
				phone:'',
				location_id: '',
				schedule_id: '',
				 password:'',
				 password_confirmation:''
            },
            edit_data: {
                
                fullName: '',
                
				email: '',
				address:'',
				phone:'',
				location_id: '',
				schedule_id: ''
			},
			search:'',
			isSending : false
           
		}
	},
    methods:{
		  async getLocation(query){
            console.log(query);
            
            const res = await this.callApi('get',`showLocation?search=${query}`);
            if(res.status == 200){
                this.location = res.data.location
            }
            
        },
		  async getSchedule(query){
            console.log(query);
            
            const res = await this.callApi('get',`showSchedule?search=${query}`);
            if(res.status == 200){
                this.schedule = res.data.schedule
            }
            
        },
        async registration(){
              if(this.form_data.fullName=='' ) return this.i("Full Name is required!");
                if(this.form_data.email=='' ) return this.i("Email is required!");
                if(this.form_data.password=='' ) return this.i("Password is required!");
                if(this.form_data.password_confirmation=='' ) return this.i("Password Confirmation is required!");
                if(this.form_data.password != this.form_data.password_confirmation){
                    this.i("The password confirmation does not match.");
                    return;
                }
                const res = await this.callApi('post','registration',this.form_data)
                if(res.status===200){
                    this.s("registration Successfull ! Please Login.");
                    this.$router.push('/')
                    this.form_data = {}
                  
                }
                else if(res.status===422){
                    if(res.data.errors.email){
                        this.errorData.email = res.data.errors.email 
                        for(let e of res.data.errors.email  )
                            this.e(e);
                    }  
                    if(res.data.errors.password)
                    {
                        this.errorData.password = res.data.errors.password 
                        for(let e of res.data.errors.password  )
                            this.e(e);
                    }  
                    
                    if(res.data.errors.fullName)
                    {
                        this.errorData.fullName = res.data.errors.fullName 
                        for(let e of res.data.errors.fullName  )
                            this.e(e);
                    }    
                       
                }
                else{
                    this.swr();
                }

        },

      
        	
		

       
       
},
 async created(){
        
	},
}
</script>



