
<template>
  <div>
    <div class="full-item">
      <div class="sidebar-item">
        <side-menu />
      </div>

      <div class="_content">
        <my-header />
        <nuxt />
      </div>
    </div>
  </div>
</template>

<script>
import MyHeader from "~/components/Header.vue";
import SideMenu from "~/components/SideMenu.vue";
import MyFooter from "~/components/Footer.vue";

export default {
  components: {
    MyHeader,
    SideMenu,
    MyFooter
  },

  async created() {
    // const res = await this.callApi("get", "/app/product/get/allCategory");

    // if (res.status == 200) {
    //   this.$store.commit("setProductCategory", res.data);
    // } else {
    //   this.i("Product Category didn't load. Please Try again!");
    // }
  }
};
</script>