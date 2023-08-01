import { createStore } from "vuex";
const store = createStore({
  modules: {
  },
  state() {
    return { 
      user: [],
    isAuth :false  };
  },
  mutations: {
    userData:(state, payload) => {
      state.user = payload;
    },
    setAuth:(state, payload) => {
      state.isAuth = payload;
    },
    deleteUser:(state, payload) => {
      state.user = payload;
    },
  },
  getters: {
    userData(state) {
      return state.user;
    },
    isAuth(state){
      return state.isAuth;}
  },
  actions:{
    addUserData: (context, payload) => {
      context.commit("userData", payload);
    },
    setAuth: (context, payload) => {
      context.commit("setAuth", payload);
    },
    deleteUserData: (context, payload) => {
      context.commit("userData", payload);
    },
  }
});

export default store;
