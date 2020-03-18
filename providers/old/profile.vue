<template>
    <div>
        <div class="_login">
         <template>
             <div>
                <Form v-model="form_data">
                    

                    <div class="_1input_group">
                        <p class="_1label">Current Password</p>
                        <Input type="password" v-model="form_data.current_password" placeholder="Enter Current Password"/>
                    </div>
                    <div class="_1input_group">
                        <p class="_1label">New Password</p>
                        <Input type="password" v-model="form_data.new_password" placeholder="Enter Current Password"/>
                    </div>
                    <div class="_1input_group">
                        <p class="_1label">Rewrite New Password</p>
                        <Input type="password" v-model="form_data.new_password2" placeholder="Enter Current Password"/>
                    </div>

                    <div class="_1input_button _text_center">
                        <button @click="changePassword" class="_btn _btn_info " :class="isLoading==true? '_btn_loader' : ''" type="button">{{isLoading ? 'Updating...' : 'Update'}}</button>
                    </div>
                </Form>
            </div>
         </template>
         
        </div>
    </div>
</template>
<script>
    export default {
        data () {
            return {
                isLoading: false,
                user:{},
                form_data: {
                current_password:'',
                new_password:'',
                new_password2:'',
                }
            }
        },
        methods:{
            async changePassword(){
                
                if(this.form_data.current_password.trim()=='' || this.form_data.new_password.trim()=='' ||  this.form_data.new_password2.trim()=='' ){
                    
                    this.i("Password con't be empty!");
                    return;
                }
                this.isLoading = true
                const res = await this.callApi('post','changePassword',this.form_data)
                
                if(res.status===200){
                    this.s('Password changed successfully!')  
                    this.$router.push('/dashboard') 
                    this.isLoading = false
                }
                 else{
                    this.e(res.data.msg)
                    this.isLoading = false
                }
               
                
            },
        },
        created(){
           
            
        }
    }
</script>
