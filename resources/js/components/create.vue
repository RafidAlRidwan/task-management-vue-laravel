<template>
    <div class="task-create mt-3">
        <form class="form" method="post" @submit.prevent="submitData()">
            <p class="title">CREATE TASK</p>

            <span>Title</span>
            <label>
                <input
                    v-model="taskForm.title"
                    placeholder=""
                    type="text"
                    class="input"
                />
                <div
                    class="text-danger"
                    v-if="taskForm.errors.has('title')"
                    v-html="taskForm.errors.get('title')"
                />
            </label>

            <span>Description</span>
            <label>
                <textarea
                    v-model="taskForm.description"
                    class="form-control"
                    id="exampleFormControlTextarea1"
                    rows="3"
                ></textarea>
                <div
                    class="text-danger"
                    v-if="taskForm.errors.has('description')"
                    v-html="taskForm.errors.get('description')"
                />
            </label>

            <span>Deadline</span>
            <label>
                <input
                    v-model="taskForm.deadline"
                    placeholder=""
                    type="date"
                    class="input"
                />
                <div
                    class="text-danger"
                    v-if="taskForm.errors.has('deadline')"
                    v-html="taskForm.errors.get('deadline')"
                />
            </label>

            <span>Status</span>
            <label>
                <select class="input" v-model="taskForm.status">
                    <option value="" disabled>Select status</option>
                    <option value="open">Open</option>
                    <option value="in_progress">In Progress</option>
                    <option value="done">Done</option>
                </select>
                <div
                    class="text-danger"
                    v-if="taskForm.errors.has('status')"
                    v-html="taskForm.errors.get('status')"
                />
            </label>

            <button class="submit">Submit</button>
        </form>
    </div>
</template>
<script>
import Form from "vform";
export default {
    data() {
        return {
            isLoading: false,
            taskForm: new Form({
                title: "",
                description: "",
                deadline: "",
                status: "",
            }),
        };
    },
    methods: {
        submitData() {
            const user = this.$store.getters["userData"];
            this.taskForm
                .post("/api/v1/task/store", {
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
