<template>
    <div>
        <header id="nav">
            <!-- Nav links -->
            <a v-for="link in links" :href="link.link" :key="link.name" @click.prevent="route(link.link)">
                {{ link.name }}
                <!-- Badge with counter -->
                <span v-if="link.name == 'Cart' && orders.length > 0" class="badge">{{ orders.length }}</span>
            </a>
        </header>
        <!-- Main view -->
	    <component :is="currentComponent" :orders="orders"></component>
    </div>
</template>

<script>
    export default {
        data: function() {
            return {
                links: [],
                currentComponent: 'home-component',
                //relations between links and components
                routes: {
                    '/': 'home-component',
                    'cart.php': 'cart-component',
                },
                orders: []
            }
        },
        methods: {
            //handle click to link
            route: function(link) {
                if(link != '#') {
                    if(link == 'admin.php') location.href = 'login'
                    else {
                        this.currentComponent = this.routes[link]
                    }
                }
            }
        },
        created() {
            axios.get('api/links')
            .then(response => this.links = response.data)
            //orders are stored
            this.orders = JSON.parse(localStorage.getItem('orders'))
            if(!this.orders) this.orders = []
        },
        mounted() {
            //listening events from children
            this.$on('add', function(order) {
                this.orders.push(order)
                localStorage.setItem('orders', JSON.stringify(this.orders))
            })
            this.$on('remove', function(index) {
                this.orders.splice(index, 1)
                localStorage.setItem('orders', JSON.stringify(this.orders))
            })
            this.$on('fresh', function() {
                this.orders = []
                localStorage.removeItem('orders')
            })
        }
    }
</script>
