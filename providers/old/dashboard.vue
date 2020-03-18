<template>
  <div>
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
      <div class="col-12 col-md-3 col-lg-3">
        <div class="_1card _padd20 _mar_b15 _b_radious7 _5box_shadow one _0border">
          <p class="price_card_title">Total Users </p>
          <p class="price_card_price">{{users}}</p>
        </div>
      </div>
        
      <div class="col-12 col-md-3 col-lg-3">
        <div class="_1card _padd20 _mar_b15 _b_radious7 _5box_shadow one _0border">
          <p class="price_card_title">Pending Orders</p>
          <p class="price_card_price">{{orders}}</p>
        </div>
      </div>

      <div class="col-12 col-md-3 col-lg-3">
        <div class="_1card _padd20 _mar_b15 _b_radious7 _5box_shadow two _0border">
          <p class="price_card_title">Members </p>
          <p class="price_card_price">{{members}}</p>
        </div>
      </div>
        
      <div class="col-12 col-md-3 col-lg-3">
        <div class="_1card _padd20 _mar_b15 _b_radious7 _5box_shadow three _0border">
          <p class="price_card_title">Completed Orders</p>
          <p class="price_card_price">{{completed}}</p>
        </div>
      </div>
    </div>

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

            <div class="">
              <button class="_btn _btn_outline_success _btn_sm" @click="completedAll">Complete All</button>
              <Select style="width:200px" v-model="search"  @on-change="sortBy" placeholder="Sort By Date">
                <Option value="1">Today's Order</Option>
                <Option value="2">Tomorrow's Order</Option>
                <Option value="3">Yesterday's Order</Option>
                <Option value="4">All Order</Option>   
              </Select> 
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
                  <th>Order Date</th>
                  <th>User</th>
                  <th>Customer Order</th>
                  <th>Menu Name</th>
                  <th>Menu Image</th>
                  <th>Waters</th>
                  <th>Complementaries</th>
                  <th>Schedule</th>
                  <th>Status</th>
                  <th>Action</th>
                </tr>
              </thead>
                <template v-if="nodata">
              <div class="row">
                  <div class="col-md-4"></div>
                  <div class="col-md-4"> <p class="_1card_header_title">No Data Found</p></div>
                  <div class="col-md-4"></div>
              </div>                    
            </template>
                       

                <tbody>
                  <tr v-for="(item,index) in filteredItems" :key="index">
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
                            <button class="_btn _btn_outline_success _btn_sm" @click="completedOrder(item,index)">Complete</button>
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
        orders:'' ,
        users:'' ,
        members:'' ,
        completed:'' ,
        orderslist:[] ,
        checklist:[] ,
        search:'',
        loaderCycle: true,
        customModal: false,
        nodata: false,
        pagination:{},
        page:1,
        search1:'',
        edit_data: {
            waters:'',
            menu_id:'',
            schedule_id:'',
            users:null,
            complementary:''

          },
          customorder : ''
           
		}
	},
    methods:{

        customModalOn(item,index){
            this.customModal = true,
            this.customorder = item.customorder
        },
       async pagination_result(e){

            this.page = e
            const res = await this.callApi('get',`showOrder?page=${this.page}`)
            if(res.status == 200){
                this.orderslist = res.data.pendings.data
                this.pagination = res.data.pendings
                
                 
                
                
            }
        },
     sortBy(){
			if(this.search == '1'){ 
            var d = new Date();
            d.setDate(d.getDate() - 1); 
            var date = d.getDate();
            var month = d.getMonth() + 1; // Since getMonth() returns month from 0-11 not 1-12
            var year = d.getFullYear();

            if(month<10 && date<10){
                var dateStr = year+ "-0" + month + "-0" + date;
            }
            else if(month<10){
                var dateStr = year+ "-0" + month + "-" + date;
            }
            else{
                var dateStr = year+ "-" + month + "-0" + date;
            }
            
            console.log(dateStr)
               return this.search1 = dateStr; 
                }
			
			if(this.search == '2'){ 
                var d = new Date();
 
            var date = d.getDate();
            var month = d.getMonth() + 1; // Since getMonth() returns month from 0-11 not 1-12
            var year = d.getFullYear();
            
            if(month<10 && date<10){
                var dateStr = year+ "-0" + month + "-0" + date;
            }
            else if(month<10){
                var dateStr = year+ "-0" + month + "-" + date;
            }
            else{
                var dateStr = year+ "-" + month + "-0" + date;
            }   
                     
               return this.search1 = dateStr;
            }
           

            if(this.search == '3'){ 
            var d = new Date();
            d.setDate(d.getDate() - 2); 
            var date = d.getDate();
            var month = d.getMonth() + 1; // Since getMonth() returns month from 0-11 not 1-12
            var year = d.getFullYear();
            
            if(month<10 && date<10){
                var dateStr = year+ "-0" + month + "-0" + date;
            }
            else if(month<10){
                var dateStr = year+ "-0" + month + "-" + date;
            }
            else{
                var dateStr = year+ "-" + month + "-0" + date;
            }
            console.log(dateStr)
            
            return this.search1 = dateStr; 
            }

            if(this.search == '4'){ 
            
            
            var dateStr = ''
            
            
            return this.search1 = dateStr; 
            }
     
    },
     async completedOrder(item,index){
            this.edit_data.id = item.id
            this.edit_data.menu_id = item.menu_id
            this.edit_data.user_id = item.user_id
            this.edit_data.schedule_id = item.schedule_id
            this.edit_data.waters = item.waters
            this.edit_data.complementary = item.complementary
            this.edit_data.status = 'completed'
            delete this.edit_data.menu
			      delete this.edit_data.users
            delete this.edit_data.schedule
            const response = await this.callApi('post', 'editOrder', this.edit_data)
            if (response.status === 200) {
            this.orderslist.splice(index,1)
            this.completed++
            this.orders--
            this.s('Order Completed and removed from here')
            }else{
                this.swr();
             
            }

        },
        async completedAll(){
          const response = await this.callApi('post','completedAll')
          if(response.status == 200){
            this.s('All pending orders are completed!');
            this.orderslist = []
            this.completed += this.orders
            this.orders = 0
          }

        }
},

async created(){
    
    
            const [res1, res3] = await Promise.all([
            this.callApi('get','dashboard'),
            this.callApi('get','showOrder')
        ])
        if(res3.status!=200) this.loaderCycle = true
        
        if(res3.status==200){
         this.loaderCycle = false
         this.orderslist = res3.data.pendings.data
         this.pagination = res3.data.pendings
         if(this.orderslist.length == 0) this.nodata = true
        }

        if(res1.status == 200){
            this.orders = res1.data.orders
            this.users = res1.data.users
            this.members = res1.data.members
            this.completed = res1.data.completed
           
            
        }
            
        },
         computed: {
        filteredItems(){
            return this.orderslist.filter((item) => {
                return item.order_date.toString().match(this.search1);
            });
        }
        }
        



}
</script>




              
