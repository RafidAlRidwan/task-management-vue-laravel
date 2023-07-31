<template>
    <div class="container" style="margin-top: 10px">
        <div class="row">
            <div class="col-12">
                <div class="title-heading">TASK LIST</div>
            </div>
        </div>

        <div class="row flex justify-content-center">
            <div
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
                                            },
                                        }"
                                        > 
                                       <div class="btn-border edit-icon">
                                        <img class="btn-icons" src="../../../assets/icons/edit-icon.svg" alt="">
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
                                            },
                                        }"
                                        >
                                       <div class="btn-border view-icon">
                                        <img class="btn-icons" src="../../../assets/icons/view-icon.svg" alt="">
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
                                            <img class="btn-icons" src="../../../assets/icons/asign-icon.svg" alt="">
                                        </div>
                                        </router-link
                                    >
                               
                            </div>
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
</style>
