<template>
    <navbar />
    <!-- <master /> -->
    <!-- <Login /> -->
    <!-- <Card /> -->
    <!-- <Create /> -->
    <RouterView />
</template>

<script setup>
import Navbar from "./components/layouts/navbar.vue";


components: {
    Navbar;
}
</script>
<style>
.router-link-active {
    text-decoration: none;
    color: #e6b400 !important;
}
a {
    color: #000 !important;
    text-decoration: none;
}
a:hover {
    text-decoration: none !important;
}
.router-link-active:hover {
    text-decoration: none;
    color: #e6b400 !important;
}



</style>
