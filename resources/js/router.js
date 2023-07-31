import store from '@/store/index.js';
import { createRouter, createWebHistory } from "vue-router";
import Assign from "./components/assign.vue";
import Card from "./components/cardList.vue";
import Create from "./components/create.vue";
import Details from "./components/details.vue";
import Edit from "./components/edit.vue";
import Login from "./components/login.vue";
import NotFound from "./components/notFound.vue";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/",
      name: "Login",
      component: Login,
      meta:{
        isAuth: false
    }
    },
    {
      path: "/task-create",
      name: "Create",
      component: Create,
      meta:{
        isAuth: true
    }},
    {
      path: "/task-details",
      props: (route) => (
        { 
          id: route.query.id, 
          title: route.query.title, 
          description: route.query.description, 
          deadline: route.query.deadline,
          status: route.query.status,
        }
      ),
      name: "Details",
      component: Details,
      meta:{
        isAuth: true
    },
  },
  {
    path: "/task-edit",
    props: (route) => (
      { 
        id: route.query.id, 
        title: route.query.title, 
        description: route.query.description, 
        deadline: route.query.deadline,
        status: route.query.status,
      }
    ),
    name: "Edit",
    component: Edit,
    meta:{
      isAuth: true
  },
},
{
  path: "/task-assign",
  props: (route) => (
    { 
      id: route.query.id, 
      assigned_user_id: route.query.assigned_user_id, 
    }
  ),
  name: "Assign",
  component: Assign,
  meta:{
    isAuth: true
},
},
    {
      path: "/dashboard",
      name: "Card",
      component: Card,
      meta:{
        isAuth: true
    }
      
    },
    { path: "/:notFound(.*)", component: NotFound },
  ],
});

router.beforeEach((to,from,next)=>{
  if(to.matched.some(record => record.meta.isAuth)){
      let user = store.getters["isAuth"];
      if(!user){
          next('/')
      }
  }
  next()
})

export default router;
