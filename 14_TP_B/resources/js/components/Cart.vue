<template>
    <div class="container">
        <h1>Cart</h1>
        <div class="flex" v-if="orders.length > 0">
            <div class="orders">
                <div v-for="(order, index) in orders" :key="index" class="preview">
                    <div class="img">
                        <img :src="order.product.path[order.color.name]" alt="Product" />
                        <img :src="order.symbol.path" alt="Symbol" class="thumb" />
                    </div>
                    <div class="info">
                        <p class="info-name">{{ order.product.name }}</p>
                        <p class="info-price">Color: {{ order.color.name }}</p>
                        <p class="info-price">${{ order.product.price }}</p>
                        <button class="delete" @click="removeOrder(index)">Delete</button>
                    </div>
                </div>
            </div>
            <div class="purchase">
                <h2>Total price: ${{ total }}</h2>
                <button class="go" @click="purchase = true">Purchase</button>
            </div>
        </div>
        <div v-else-if="response" class="success"> {{ response }}</div>
        <div v-else>
            <h3 class="center">No items in cart yet...</h3>
        </div>
        <div v-if="purchase" class="overlay"></div>
        <transition>
            <div v-if="purchase" class="dialog auto">
                <div class="dialog-header form-header">
                    <h2>Order</h2>
                </div>
                <form class="contact" @submit.prevent="send">
                    <input type="text" v-model="contact.firstname" placeholder="First name" required>
                    <input type="text" v-model="contact.lastname" placeholder="Last name" required>
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
                response: false,
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
                            symbol_id: order.symbol.id,
                            product_id: order.product.id,
                            color_id: order.color.id
                        }
                    })
                })
                .then(response => {
                    this.purchase = false
                    this.response = response.data.message
                    this.$parent.$emit('fresh')
                })
                .catch(error => console.log(error))
            },
            removeOrder: function(index) {
                this.$parent.$emit('remove', index)
            }
        }
    }
</script>
