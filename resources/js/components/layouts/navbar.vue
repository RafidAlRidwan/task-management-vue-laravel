<template>
    <nav class="navbar navbar-expand-lg navbar-light bg-light p-2">
        <router-link to="/dashboard"
            ><a class="navbar-brand" href="#"
                >Task Management System</a
            ></router-link
        >
        <button
            @click="toggle"
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation"
        >
            <span class="navbar-toggler-icon"></span>
        </button>

        <div
            class="collapse navbar-collapse toggle-large"
            id="navbarSupportedContent"
        >
            <ul class="navbar-nav mr-auto">
                <li
                    class="nav-item active"
                    v-if="this.$store.getters['isAuth']"
                >
                    <a class="nav-link" href="#"
                        ><router-link to="/dashboard">Dashboard</router-link></a
                    >
                </li>
                <li class="nav-item" v-if="this.$store.getters['isAuth']">
                    <a class="nav-link" href="#"
                        ><router-link to="/task-create"
                            >Create New</router-link
                        ></a
                    >
                </li>

                <li class="nav-item" v-if="this.$store.getters['isAuth']">
                    <a class="nav-link" @click.prevent="logout" href="#"
                        >Logout</a
                    >
                </li>
            </ul>
        </div>

        <!-- mbl nav -->
        <div
            class="collapse navbar-collapse toggle-part"
            id="navbarSupportedContent"
        >
            <ul v-if="handleToggle" class="navbar-nav mr-auto">
                <li
                    class="nav-item active"
                    v-if="this.$store.getters['isAuth']"
                >
                    <a class="nav-link" href="#"
                        ><router-link to="/dashboard">Dashboard</router-link></a
                    >
                </li>
                <li class="nav-item" v-if="this.$store.getters['isAuth']">
                    <a class="nav-link" href="#"
                        ><router-link to="/task-create"
                            >Create New</router-link
                        ></a
                    >
                </li>

                <li class="nav-item" v-if="this.$store.getters['isAuth']">
                    <a class="nav-link" @click.prevent="logout" href="#"
                        >Logout</a
                    >
                </li>
            </ul>
        </div>
    </nav>
</template>
<script>
import axios from "axios";

export default {
    data() {
        return {
            handleToggle: false,
        };
    },
    methods: {
        toggle() {
            this.handleToggle = !this.handleToggle;
        },
        logout() {
            const user = this.$store.getters["userData"];

            axios
                .post(
                    "/api/v1/logout",
                    {},
                    {
                        headers: {
                            Authorization: `Bearer ${user.access_token}`,
                        },
                    }
                )
                .then(() => {
                    // Clear the token from  Vuex state.
                    this.$store.dispatch("deleteUserData", {});
                    this.$store.dispatch("setAuth", false);

                    // location.reload();
                    this.$router.push("/");
                    this.$toast.success(`Logged out`);
                });
        },
    },
};
</script>

<style>
@media (min-width: 451px) {
    .toggle-part {
        display: none;
    }
}

@media (max-width: 450px) {
    .toggle-large {
        display: none;
    }
}
</style>
