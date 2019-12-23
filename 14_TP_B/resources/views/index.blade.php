@extends('layouts.client')
@section('content')
@verbatim
<div id="app">
	<h1>Step 1: Select a symbol</h1>
	<div class="symbols">
		<label v-for="symbol in symbols">
			<input type="radio" name="symbol" v-model="order.symbol" :value="symbol">
			<img :src="symbol.path" alt="Symbol" />
		</label>
	</div>
	<div v-if="order.symbol" class="overlay"></div>
	<transition name="products">
		<div v-if="order.symbol" class="dialog">
			<div class="dialog-header">
				<button v-if="order.product !== null" class="back" @click="back">&laquo;</button>
				<span v-else ></span>
				<h2>{{ step }}</h2>
				<button class="close" @click="cancel">&times;</button>
			</div>
			<div class="products">
				<label v-for="product in products" v-show="order.product === null || order.product == product.name">
					<input type="radio" name="product" v-model="order.product" :value="product.name">
					<p class="info-name">{{ product.name }}</p>
					<p class="info-price">${{ product.price }}</p>
					<div class="img">
						<img :src="product.path[order.color]" alt="Product" />
						<img v-if="order.product !== null" :src="order.symbol.path" alt="Symbol" class="thumb" />
					</div>
				</label>
			</div>
			<div v-if="order.product">
				<div class="colors">
					<label v-for="color in colors">
						<input type="radio" name="color" v-model="order.color" :value="color">{{ color }}
					</label>
				</div>
				<button class="add">Add to cart</button>
			</div>
		</div>
	</transition>
</div>
@endverbatim
<script type="text/javascript">
	var app = new Vue({
		el: '#app',
		data: {
			symbols: [],
			products: [],
			colors: [],
			order: {
				symbol: null,
				product: null,
				color: null
			}
		},
		computed: {
			step: function() {
				return this.order.product === null ? 'Step 2: Select a product' : 'Step 3: Customize color'
			}
		},
		methods: {
			cancel: function() {
				this.order = {
					symbol: null,
					product: null,
					color: this.colors[0]
				}
			},
			back: function() {
				this.order.product = null; 
				this.order.color = this.colors[0]
			}
		},
		created() {
			axios.get('api/symbols')
			.then(response => this.symbols = response.data)
			axios.get('api/products')
			.then(response => this.products = response.data)
			axios.get('api/colors')
			.then(response => {
				this.colors = response.data
				this.order.color = response.data[0]
			})
		}
	})
</script>

@endsection