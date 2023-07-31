<template>
    <section class="merchant-pagination">
        <div class="pagination">
            <!-- <p>Pages :</p> -->
            <!-- <a href="#">&laquo;</a> -->
            <div class="pagination-number">
                <div v-for="item in totalData">
                    <a
                        v-if="item >= firstIndex && item <= lastIndex"
                        :key="item"
                        :class="item == currentPage ? 'active' : ''"
                        @click="setCurrentPage(item)"
                        >{{ item }}</a
                    >
                </div>

                <span
                    class="dot"
                    v-if="totalData >= 4 && currentPage <= totalData - 2"
                    >.....</span
                >
                <div v-for="item in totalData">
                    <a
                        v-if="
                            item == totalData &&
                            totalData >= 4 &&
                            currentPage <= totalData - 2
                        "
                        :key="`last_item_${item}`"
                        :class="item == currentPage ? 'active' : ''"
                        @click="setCurrentPage(item)"
                        >{{ item }}</a
                    >
                </div>
            </div>
            <a href="#">&raquo;</a>

            <a href="#">&laquo;</a>
            <a
                @click="setCurrentPage(currentPage - 1)"
                :class="[currentPage == 1 ? 'btn-disable' : '']"
                >Previous</a
            >
            <a
                @click="setCurrentPage(currentPage + 1)"
                :class="[currentPage == totalData ? 'btn-disable' : '']"
                >Next</a
            >
            <a href="#">&raquo;</a>
        </div>
    </section>
</template>

<script>
export default {
    props: {
        currentPage: Number,
        totalData: Number,
        setCurrentPage: Function,
    },
    computed: {
        firstIndex() {
            return this.currentPage >= 4 ? this.currentPage - 2 : 1;
        },
        lastIndex() {
            return this.currentPage >= 4 ? this.currentPage + 1 : 4;
        },
    },
};
</script>

<style lang="scss" scoped>
.merchant-pagination {
    padding: 25px 0 70px 0;
    .pagination {
        display: flex;
        //justify-content: center;
        align-items: center;
        flex-wrap: wrap;
        gap: 20px;

        p {
            color: #4e4b66;
            font-size: 16px;
        }

        a {
            text-decoration: none;
            color: #a0a3bd !important;
            cursor: pointer;
            &:hover {
                color: #4e4b66 !important;
            }
        }
        .pagination-number {
            display: flex;
            gap: 5px;
            a {
                color: #a0a3bd;
                float: left;
                padding: 5px 11px;
                text-decoration: none;
                border: 2px solid #a0a3bd;
                border-radius: 6px;
                // margin-right: 5px;
                &:hover {
                    background: #eff0f7;
                    font-size: bold;
                    border: 2px solid #e6b400;
                    color: #e6b400;
                }
            }
            .dot {
                border: none;
                &:hover {
                    border: none;
                    background: none;
                    color: #a0a3bd;
                }
            }
            .active {
                background: #eff0f7;
                font-size: bold;
                border: 2px solid #e6b400;
                color: #e6b400;
            }
        }
    }
}

@media screen and (min-width: 930px) {
    .merchant-pagination {
        padding: 35px 0 90px 0;
        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            gap: 20px;
            .pagination-number {
                display: flex;
                a {
                    margin-right: 5px;
                    padding: 8px 16px;
                }
            }
        }
    }
}

.btn-disable {
    pointer-events: none;
}
</style>
