import { createApp } from 'vue';
import App from "./App.vue";
import './bootstrap';
import router from "./router";
import store from "./store/index.js";
import Toaster from '@meforma/vue-toaster';


const app = createApp(App);

app.use(Toaster);
app.use(router);
app.use(store);
app.mount('#app');
