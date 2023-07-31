<template>
    <div class="container" style="margin-top: 10px">
        <div class="row">
            <div class="col-12">
                <div class="title-heading">TASK LIST</div>
            </div>
        </div>
        <div class="d-flex justify-content-center m-5">
            <div class="search-box">
                <input v-model="searchTextValue" v-on:keyup="onSearch" class="search-input" type="text" placeholder="Search task..">
            </div>
        </div>
        <div class="row flex justify-content-center">
            <div v-if="tasks.length > 0"
                v-for="(task, index) in tasks"
                :key="index"
                class="col-lg-4 col-sm-4 col-md-4 col-xl-4 col-xs-12 mb-4"
            >
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">{{ task.title }}</h4>
                        <div class="card-image" style="color: #213661">
                            <i class="fas fa-laptop-code fa-5x">
                                Deadline: {{ task.deadline }}</i
                            >
                        </div>
                        <p class="card-text">
                            {{ task.description }}
                        </p>
                        <p class="card-text">
                            <p>Task Assign: {{ task.user ? task.user.name : 'Not Assign' }}</p>
                            
                        </p>
                        <p class="card-text">
                            <p v-if="task.status == 'open'">Status: Open</p>
                            <p v-else-if="task.status == 'in_progress'" >Status: In Progress</p>
                            <p v-else-if="task.status == 'done'" >Status: Done</p>
                            <p v-else >Status: No Status</p>
                        </p>
                        <div class="d-flex justify-content-center gap-3">
                            <div
                                class="card-btn"
                                style="marginright: 10px !important"
                            >
                                
                                    <router-link
                                        :to="{
                                            path: '/task-edit',
                                            query: {
                                                id: task.id,
                                                title: task.title,
                                                description: task.description,
                                                deadline: task.deadline,
                                                status: task.status,
                                            },
                                        }"
                                        > 
                                       <div class="btn-border edit-icon">
                                        <img class="btn-icons" src="../assets/icons/edit-icon.svg" alt="">
                                       </div>
                                        </router-link
                                    >
                                
                            </div>
                            <div class="card-btn">
                               
                                    <router-link
                                        :to="{
                                            path: '/task-details',
                                            query: {
                                                id: task.id,
                                                title: task.title,
                                                description: task.description,
                                                deadline: task.deadline,
                                                status: task.status,
                                            },
                                        }"
                                        >
                                       <div class="btn-border view-icon">
                                        <img class="btn-icons" src="../assets/icons/view-icon.svg" alt="">
                                       </div>
                                        </router-link
                                    >
                                
                            </div>
                            <div class="card-btn">
                               
                                    <router-link
                                        :to="{
                                            path: '/task-assign',
                                            query: {
                                                id: task.id,
                                                assigned_user_id: task.assigned_user_id,
                                            },
                                        }"
                                        >
                                        <div class="btn-border asign-icon">
                                            <img class="btn-icons" src="../assets/icons/asign-icon.svg" alt="">
                                        </div>
                                        </router-link
                                    >
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div v-else class="d-flex justify-content-center">
                <div class="container-fluid bg">
                    <div class="row h-100 w-100">
                        <div class="col-12 text-center my-auto">
                        <h1>NOTHING FOUND!</h1>
                        </div>
                    </div>
                </div>
            </div>

            <div class="flex justify-content item-center p-2">
                <div v-if="totalData > perPage" class="paginationComponent">
                    <Pagination
                        :currentPage="currentPage"
                        :totalData="totalPagination"
                        :setCurrentPage="setCurrentPage"
                    />
                </div>
            </div>

        </div>
        
    </div>
</template>
<script>
import Pagination from "./Pagination/pagination.vue";
export default {
    components: {
        Pagination,
    },
    data() {
        return {
            isLoading: false,
            tasks: [],
            currentPage: 1,
            totalData: 1,
            perPage: 5,
        };
    },
    computed: {
        totalPagination() {
            return Math.ceil(parseInt(this.totalData) / this.perPage);
        },
    },
    watch: {
        currentPage(val) {
            this.getTasks(val);
        },
    },
    created() {
        this.getTasks(this.currentPage);
    },
    methods: {
        onSearch(){
            const user = this.$store.getters["userData"];
            axios
                .get("/api/v1/task/list?page=" + this.currentPage +"&search="+this.searchTextValue, {
                    headers: {
                        Authorization: `Bearer ${user.access_token}`,
                    },
                })
                .then((response) => {
                    // Clear the token from  Vuex state.
                    this.tasks = response.data.data;
                    this.totalData = response.data.total;
                    this.perPage = response.data.perPage;
                });
            },
        setCurrentPage(currentPage) {
            this.currentPage = currentPage;
        },
        getTasks(currentPage) {
            const user = this.$store.getters["userData"];

            axios
                .get("/api/v1/task/list?page=" + currentPage, {
                    headers: {
                        Authorization: `Bearer ${user.access_token}`,
                    },
                })
                .then((response) => {
                    // Clear the token from  Vuex state.
                    this.tasks = response.data.data;
                    this.totalData = response.data.total;
                    this.perPage = response.data.perPage;
                });
        },
    },
};
</script>
<style scoped>
.paginationComponent {
    flex-basis: 100%;

    .merchant-pagination {
        padding: 25px 0 0 0 !important;
    }
}
.card {
    margin: 10px auto;
    box-shadow: 0px 2px 4px 0 rgba(0, 0, 0, 0.2);
    border-radius: 6px;
    height: 100%;
    transition: 0.3s;
}
.card:hover {
    box-shadow: 1px 10px 16px 0 rgba(0, 0, 0, 0.3);
}
.card-title {
    text-align: center;
    color: #666666;
    font-weight: bold;
}
.card-text {
    font-weight: 500;
    color: #66686b;
}
.card-image {
    text-align: center;
    margin: 2vh 0;
}
.card-text {
    text-align: center;
}
.card-btn {
    text-align: center;
}

.btn-icons{
    width: 20px;
    height: 20px;
}

.btn-border{
    border: 1.77px solid black;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 5px;
}

.edit-icon:hover{
    background-color: rgb(255, 255, 214);
    border: 1.77px solid rgb(206, 206, 131);
}

.view-icon:hover{
    background-color: rgb(225, 255, 244);
    border: 1.77px solid rgb(8, 137, 90);
}

.asign-icon:hover{
    background-color: rgb(255, 242, 242);
    border: 1.77px solid rgb(188, 11, 11);
}

.title-heading {
    font-size: 2em;
    text-align: center;
    color: royalblue;
    font-weight: bold;
}

body {
  text-align: center;
  min-height: 93vh;
  background-color: #485461;
background-image: linear-gradient(315deg, #485461 0%, #28313b 74%);

}

h1 {
  font-family: 'Montserrat', sans-serif;
  color: #fff;
}

/* You just need to get this field - start */

.search-box {
  width: 350px;
  position: relative;
  display: flex;
	bottom: 0;
	left: 0;
	right: 0;
	margin: auto;
}

.search-input {
  width: 100%;
  font-family: 'Montserrat', sans-serif;
  font-size: 16px;
  padding: 15px 45px 15px 15px;
  background-color: #d6d6f0;
  color: #6c6c6c;
  border-radius: 6px;
  border:none;
  transition: all .4s;
}

.search-input:focus {
  border:none;
  outline:none;
  box-shadow: 0 1px 12px #b8c6db;
  -moz-box-shadow: 0 1px 12px #b8c6db;
  -webkit-box-shadow: 0 1px 12px #b8c6db;
}

.search-btn {
  background-color: transparent;
  font-size: 18px;
  padding: 6px 9px;
  margin-left:-45px;
  border:none;
  color: #6c6c6c;
  transition: all .4s;
  z-index: 10;
}

.search-btn:hover {
  transform: scale(1.2);
  cursor: pointer;
  color: black;
}

.search-btn:focus {
  outline:none;
  color:black;
}

/* You just need to get this field - end */

.footer {
  position:fixed;
  bottom:5px;
}

.footer p {
  font-family: 'Montserrat', sans-serif;
  font-size:12px;
  color:#000;
}

.footer a {
  color: #fff;
  transition: all .4s;
}

.footer a:hover {
  color: #eaeaeb;
}

.container-fluid {
  font-family: 'Roboto', serif;
  font-weight: bold;
}

.bg {
  background: transparent;
}

h1 { 
background: ransparent;
color: #999;
border-radius: 0.25em;
}

.row {
  margin: 0;
}
.col-12 {
  margin: 0;
}
</style>
