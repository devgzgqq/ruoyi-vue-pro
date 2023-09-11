<script>
import { defineComponent } from 'vue'

export default defineComponent({
  name: 'login1'
})
</script>

<template>
<div class="gwc-login-warp">
  <header class="gwc-login-header">
    <div class="gwc-login-header-logo">
      <img src="/logo.svg" alt="logo" />
    </div>
    <div class="gwc-login-header-right">
<!--      <span>中文</span>-->
<!--      <span>English</span>-->
    </div>
  </header>
  <main>
    main
  </main>
  <footer>
    footer
  </footer>
</div>
</template>

<style scoped lang="scss">
.gwc-login-warp {
  @apply gw-flex gw-flex-col gw-h-screen gw-relative;
  background-image: url(../assets/images/assets-login-bg-white.png);
  background-size: cover;
}
.gwc-login-header {
  @apply gw-flex gw-justify-between gw-items-center gw-px-8;
  height: 56px;
}
.gwc-login-header-logo {
  @apply gw-flex gw-items-center;
}
.gwc-login-header-logo img {
  width: 188px;
  height: 56px;
}
.gwc-login-header-right {
  @apply gw-flex;
}
.gwc-login-header-right span {
  @apply gw-mx-4;
  color: #333;
  font-size: 14px;
}
</style>
