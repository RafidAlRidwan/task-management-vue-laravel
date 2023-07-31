<template>
    <div class="content mt-3">
        <form
            method="post"
            @submit.prevent="submitRegData()"
            class="form"
            v-if="isReg"
        >
            <p class="title">REGISTER</p>
            <p class="message">Signup now and get full access to our app.</p>

            <label>
                <input
                    v-model="registrationForm.name"
                    placeholder=""
                    type="text"
                    class="input"
                />
                <div
                    class="text-danger"
                    v-if="registrationForm.errors.has('name')"
                    v-html="registrationForm.errors.get('name')"
                />
                <span>Name</span>
            </label>
            <label>
                <input
                    v-model="registrationForm.email"
                    placeholder=""
                    type="email"
                    class="input"
                />
                <div
                    class="text-danger"
                    v-if="registrationForm.errors.has('email')"
                    v-html="registrationForm.errors.get('email')"
                />
                <span>Email</span>
            </label>
            <label>
                <input
                    v-model="registrationForm.password"
                    placeholder=""
                    type="password"
                    class="input"
                />
                <div
                    class="text-danger"
                    v-if="registrationForm.errors.has('password')"
                    v-html="registrationForm.errors.get('password')"
                />
                <span>Password</span>
            </label>
            <p class="text-danger">{{ msgReg }}</p>
            <button class="submit">Submit</button>
            <p class="signin">
                Already have an acount ?
                <a v-on:click="toggle()" href="#">Signin</a>
            </p>
        </form>

        <form class="form" method="post" @submit.prevent="submitData()" v-else>
            <p class="title">LOGIN</p>

            <label>
                <input
                    placeholder=""
                    v-model="loginForm.email"
                    type="email"
                    class="input"
                />
                <div
                    class="text-danger"
                    v-if="loginForm.errors.has('email')"
                    v-html="loginForm.errors.get('email')"
                />
                <span>Email</span>
            </label>
            <label>
                <input
                    placeholder=""
                    type="password"
                    class="input"
                    v-model="loginForm.password"
                />
                <div
                    class="text-danger"
                    v-if="loginForm.errors.has('password')"
                    v-html="loginForm.errors.get('password')"
                />
                <span>Password</span>
            </label>
            <p class="text-danger">{{ msg }}</p>

            <div v-if="isLoading" class="d-flex justify-content-center">
                <div class="spinner-border text-primary" role="status"></div>
            </div>
            <button v-else class="submit">Submit</button>
            <p class="signin">
                Have no account ? <a v-on:click="toggle()" href="#">Signup</a>
            </p>
        </form>
    </div>
</template>
<script>
import Form from "vform";
export default {
    data() {
        return {
            isReg: false,
            isLoading: false,
            loginForm: new Form({
                email: "",
                password: "",
            }),
            registrationForm: new Form({
                name: "",
                email: "",
                password: "",
            }),
            msg: "",
            msgReg: "",
        };
    },

    methods: {
        toggle() {
            this.isReg = !this.isReg;
        },
        submitData() {
            this.loginForm.post("/api/v1/login").then((response) => {
                this.msg = response.data.user_message;

                if (response.data.data) {
                    this.$toast.success(`Logged in`);
                    this.$store.dispatch("addUserData", response.data.data);
                    this.$store.dispatch("setAuth", true);
                    this.$router.push({ name: "Card" });
                }
            });
        },
        submitRegData() {
            this.registrationForm
                .post("/api/v1/registration")
                .then((response) => {
                    this.$toast.success(`Registration successfully done`);
                    this.isReg = !this.isReg;
                });
        },
    },
};
</script>
<style scoped>
* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}
body {
    height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: #e8e8e8;
    font-family: arial;
}
.content {
    display: flex;
    align-items: center;
    justify-content: center;
}
.form {
    display: flex;
    flex-direction: column;
    gap: 10px;
    min-width: 350px;
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
</style>
