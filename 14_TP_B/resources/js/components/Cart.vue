<template>
    <div class="container">
        <h1>Cart</h1>
        <div class="flex">
            <div class="orders">
                <div v-for="(order, id) in orders" :key="id" class="preview">
                    <div class="img">
                        <img :src="order.product.path[order.color]" alt="Product" />
                        <img :src="order.symbol.path" alt="Symbol" class="thumb" />
                    </div>
                    <div class="info">
                        <p class="info-name">{{ order.product.name }}</p>
                        <p class="info-price">${{ order.product.price }}</p>
                    </div>
                </div>
            </div>
            <div class="purchase">
                <h2>Total price: ${{ total }}</h2>
                <button class="go" @click="purchase = true">Purchase</button>
            </div>
        </div>
        <div v-if="purchase" class="overlay"></div>
        <transition>
            <div v-if="purchase" class="dialog auto">
                <div class="dialog-header form-header">
                    <h2>Order</h2>
                </div>
                <form class="contact" @submit.prevent="send">
                    <input type="text" v-model="contact.lastname" placeholder="Last name" required>
                    <input type="text" v-model="contact.firstname" placeholder="First name" required>
                    <input type="email" v-model="contact.email" placeholder="E-mail" required>
                    <button type="submit" class="go">Place pre-order</button>
                    <button type="button" class="cancel" @click="purchase = false">Cancel</button>
                </form>
            </div>
        </transition>
    </div>
</template>

<script>
    export default {
        props: ['orders'],
        data: function() {
            return {
                purchase: false,
                contact: {
                    lastname: '',
                    firstname: '',
                    email: ''
                }
            }
        },
        computed: {
            total: function() {
                var sum = 0
                this.orders.forEach(element => {
                    sum += element.product.price
                })
                return sum
            }
        },
        methods: {
            send: function() {
                axios.post('api/orders', {
                    total: this.total,
                    contact: this.contact,
                    orders: this.orders.map(function(order) {
                        return {
                            symbol: order.symbol.name,
                            product: order.product.name,
                            color: order.color
                        }
                    })
                })
                .then(response => console.log(response))
                .catch(error => console.log(error))
            }
        }
    }
</script>
