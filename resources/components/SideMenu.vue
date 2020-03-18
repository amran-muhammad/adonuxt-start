<template>
  <div>
    <!-- Side bar -->
    <div class="_1sidebar">
      <div class="_1sidebar_main _bg_default">
        <div class="logo">
          <template>
            <nuxt-link to="/">
              <img class="logo_img" src="/img/logoolv.png" alt title />
            </nuxt-link>
          </template>
         
        </div>

        <template>
          <ul class="_navbar">                                 
            <li>
              <nuxt-link to="/users/">
                <div class="nav_item">
                  <div class="nav_item_icon">
                    <i class="fas fa-chart-line"></i>
                  </div>
                  <span class="nav_item_text">Users</span>
                </div>
              </nuxt-link>
            </li>
             
          </ul>
        </template>
      </div>
    </div>
    <!-- Side bar -->
  </div>
</template>

<script>
export default {
  data() {
    return {
     // isLoggedIn: true
    };
  }
};
</script>