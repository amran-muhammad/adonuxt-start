<template>
  <div>

    <Modal
    v-model="addModal"
    >

    </Modal>
    <div class="row">
      <div class="col-12 col-md-12 col-lg-12">
        <div class="_1card _mar_b15 _b_radious7 _5box_shadow _0border">
          <div class="_1card_header _padd20">
            <p class="_1card_header_title">Represntatives</p>
            <!-- <template v-if="loaderCycle">
              <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                  <p class="_1card_header_title">Loading...</p>
                </div>
                <div class="col-md-4"></div>
              </div>
            </template>-->

            <div class="_dashboard_actions">
              <button class="_btn_sm" @click="addModal=true">
                <i class="fas fa-plus"></i> Add represntative
              </button>
            </div>
          </div>

          <div class>
            <div class="_table_responsive">
              <template v-if="productData.total == 0">
                <div class="row">
                  <div class="col-md-4"></div>
                  <div class="col-md-4">
                    <p class="_1card_header_title">No Data Found</p>
                  </div>
                  <div class="col-md-4"></div>
                </div>
              </template>
              <template v-else>
                <table class="_table" rpv="content">
                  <thead class="bg-200 text-900">
                    <tr>
                      <th>ID</th>
                       <th>First Name</th>
                       <th>Last Name</th>
                      <th>User Type</th>
                      <th>Action</th>
                    </tr>
                  </thead>

                  <tbody>
                    <tr v-for="(item,index) in pvData" :key="index">
                      <td>{{item.id}}</td>
                      <td><span>{{item.firstName}}</span></td>
                      <td><span>{{item.lastName}}</span></td>
                      <td>{{item.userType}}</td>
                      <td>
                         <!-- <button class="_btn _btn_outline_info _btn_sm" @click="pvEdit(item,index)">Edit</button> -->
                        <button
                          class="_btn _btn_outline_danger _btn_sm"
                          @click="pvDelete(item,index)"
                         >Delete</button>
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
                        :page-size="1" 
                      />
                </div>  
                <!-- Pagination -->
              </template>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      addModal: false,
      editModal: false,
      loaderCycle: false,
      emptyData: false,
      editIndex: -1,
      page: 1,
      pagination:{},
      productData: [],
      productMetaData: [],
      pvData: [],
      search: "",
      isSending: false
    };
  },
  methods: {
     async pagination_result(e){
            this.page = e
            const res = await this.callApi('get',`/app/user/get/user?page=${this.page}`)
            if(res.status == 200){
                this.pvData = res.data.data
                this.pagination = res.data
               
            }
        },
    
  
    async pvDelete(item,index){
       if(!confirm("WARNING!!! Are you sure to delete this info?")){
                return;
            }
             let ob = {
                id:this.pvData[index].id
            }
              const response = await this.callApi('post', '/app/user/delete/user',ob)
            if (response.status === 200) {
                this.pvData.splice(index,1)
                this.s('user deleted');
            }else{  
                this.swr()
            }

    },
    

  },
  async created() {
    // const loading = this.$vs.loading({
    //   // target: this.$rpvs.content,
    //   color: "#3177f1",
    //   type: "points",
    //   text: "Please Wait..."
    // });
    

    const res2 = await this.callApi("get", `/app/user/get/user`)
    
    if(res2.status == 200){
      this.pvData = res2.data.data
      this.pagination = res2.data
    }
    else{
      this.swr();
    }
    //loading.close();
  }
};
</script>
<style>
.loader {
  border: 8px solid #f3f3f3;
  border-radius: 50%;
  border-top: 8px solid #3498db;
  width: 50px;
  height: 50px;
  -webkit-animation: spin 2s linear infinite; /* Safari */
  animation: spin 2s linear infinite;
}

.product_thumnail {
  width: 100px;
  height: 100px;
  object-fit: contain;
}

/* Safari */
@-webkit-keyframes spin {
  0% {
    -webkit-transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(360deg);
  }
}

@keyframes spin {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}
</style>



