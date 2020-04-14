<template>
    <div class="app-container">
            <transition>
                <router-view v-if="isRouterAlive"></router-view>
            </transition>
    </div>
</template>

<style lang="css" scoped>

</style>

<script>
export default {
    provide(){
        return {
            reload:this.reload
        }
    },
    data() {
        return {
         isRouterAlive:true
        }
    },
    methods: {
        reload(){
            this.isRouterAlive = false
            this.$nextTick(function(){
                this.isRouterAlive = true
            })
        }
    },
}
</script>