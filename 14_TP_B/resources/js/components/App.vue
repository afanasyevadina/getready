<template>
    <div>
        <header id="nav">
            <a v-for="link in links" :href="link.link" :key="link.name" @click.prevent="currentTab = link.link">
                {{ link.name }}
                <span v-if="link.name == 'Cart' && orders.length > 0" class="badge">{{ orders.length }}</span>
            </a>
        </header>
	    <component :is="currentComponent" :orders="orders"></component>
    </div>
</template>

<script>
    export default {
        data: function() {
            return {
                links: [],
                currentTab: '/',
                routes: {
                    '/': 'home-component',
                    '#': 'home-component',
                    'cart.php': 'cart-component',
                    'admin.php': 'admin-component'
                },
                orders: []
            }
        },
        computed: {
            currentComponent: function() {
                return this.routes[this.currentTab]
            }
        },
        created() {
            axios.get('api/links')
            .then(response => this.links = response.data)
        },
        mounted() {
            this.$on('add', function(order) {
                this.orders.push(order)
            })
        }
    }
</script>
