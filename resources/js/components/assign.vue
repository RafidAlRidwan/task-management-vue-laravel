<template>
    <div class="task-create mt-3">
        <form class="form" method="post" @submit.prevent="submitData()">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <p class="title">ASSIGN TASK</p>
                <router-link
                    :to="{
                        path: '/dashboard',
                    }"
                    ><img
                        class="back-btn"
                        src="../../../assets/icons/arrow-left-24.svg"
                        alt=""
                    />
                </router-link>
            </div>
            <span>Select User</span>
            <label>
                <select class="input" v-model="taskForm.assigned_user_id">
                    <option value="" disabled>Select a car</option>
                    <option :value="user.id" v-for="user in users">
                        {{ user.name }}
                    </option>
                </select>
                <div
                    class="text-danger"
                    v-if="taskForm.errors.has('assigned_user_id')"
                    v-html="taskForm.errors.get('assigned_user_id')"
                />
            </label>

            <button class="submit">Submit</button>
        </form>
    </div>
</template>
<script>
import Form from "vform";
export default {
    props: ["id", "assigned_user_id"],

    data() {
        return {
            isLoading: false,
            users: [],
            taskForm: new Form({
                assigned_user_id: "",
            }),
        };
    },

    created() {
        this.taskForm.assigned_user_id = this.assigned_user_id;
        this.getUsers();
    },

    methods: {
        getUsers() {
            const user = this.$store.getters["userData"];
            this.taskForm
                .get("/api/v1/get/users", {
                    headers: {
                        Authorization: `Bearer ${user.access_token}`,
                    },
                })
                .then((response) => {
                    this.users = response.data.data;
                    console.log(this.users);
                });
        },
        submitData() {
            const user = this.$store.getters["userData"];
            this.taskForm
                .post("/api/v1/task/assign/" + this.id, {
                    headers: {
                        Authorization: `Bearer ${user.access_token}`,
                    },
                })
                .then((response) => {
                    this.msg = response.data.user_message;
                    this.$toast.success(response.data.user_message);
                    this.$router.push({ name: "Card" });
                });
        },
    },
};
</script>
<style scoped>
.back-btn {
    cursor: pointer;
    width: 30px;
    border: 1px solid black;
    border-radius: 50%;
}

.back-btn:hover {
    background-color: rgb(227, 234, 254);
    border: 1px solid royalblue;
}
.task-create {
    display: flex;
    align-items: center;
    justify-content: center;
}
.form {
    display: flex;
    flex-direction: column;
    gap: 10px;
    /* max-width: 350px; */
    min-width: 500px;
    background-color: #fff;
    padding: 20px;
    border-radius: 20px;
    position: relative;
}

.title {
    font-size: 28px;
    color: royalblue;
    font-weight: 600;
    letter-spacing: -1px;
    position: relative;
    display: flex;
    align-items: center;
    padding-left: 30px;
}

.title::before,
.title::after {
    position: absolute;
    content: "";
    height: 16px;
    width: 16px;
    border-radius: 50%;
    left: 0px;
    background-color: royalblue;
}

.title::before {
    width: 18px;
    height: 18px;
    background-color: royalblue;
}

.title::after {
    width: 18px;
    height: 18px;
    animation: pulse 1s linear infinite;
}

.message,
.signin {
    color: rgba(88, 87, 87, 0.822);
    font-size: 14px;
}

.signin {
    text-align: center;
}

.signin a {
    color: royalblue;
}

.signin a:hover {
    text-decoration: underline royalblue;
}

.flex {
    display: flex;
    width: 100%;
    gap: 6px;
}

.form label {
    position: relative;
}

.form label .input {
    width: 100%;
    padding: 10px 10px 20px 10px;
    outline: 0;
    border: 1px solid rgba(105, 105, 105, 0.397);
    border-radius: 10px;
}

.form label .input + span {
    position: absolute;
    left: 10px;
    top: 15px;
    color: grey;
    font-size: 0.9em;
    cursor: text;
    transition: 0.3s ease;
}

.form label .input:placeholder-shown + span {
    top: 15px;
    font-size: 0.9em;
}

.form label .input:focus + span,
.form label .input:valid + span {
    top: 30px;
    font-size: 0.7em;
    font-weight: 600;
}

.form label .input:valid + span {
    color: green;
}

.submit {
    border: none;
    outline: none;
    background-color: royalblue;
    padding: 10px;
    border-radius: 10px;
    color: #fff;
    font-size: 16px;
    transform: 0.3s ease;
}

.submit:hover {
    background-color: rgb(56, 90, 194);
}

@keyframes pulse {
    from {
        transform: scale(0.9);
        opacity: 1;
    }

    to {
        transform: scale(1.8);
        opacity: 0;
    }
}
@media (max-width: 450px) {
    .form {
        min-width: 320px;
    }
}
</style>
