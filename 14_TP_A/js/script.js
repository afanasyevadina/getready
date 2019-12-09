var app = new Vue({
	el: '#app',
	data: {
		selectedFunctions: [],
		modal: {
			text: '',
			show: false
		},
		easingFunctions: [],
		t: 0, //current time value
		w: 0, //chart size
		h: 0,
		showLink: false //back-to-top button
	},
	computed: {
		//style for slider
		progressStyle: function() {
			return {
				background: 'linear-gradient(90deg, #4c5f94 ' + this.t +'%, #c0c8dc ' + this.t + '%)'
			}
		},
	},
	methods: {
		//calculates transition function
		fun: function(t, formula) {
			if(this.current === null) return 0
			t = t/100
			let cur = eval(formula)
			t = 1
			let max = eval(formula)
			return cur * 100 / max
		},
		//generates curve from function
		path: function(time, formula) {
			var path = ['M 20,' + (this.h + 20)];
			for(let t = 0; t <= time; t += 1) {
				let x = t*this.w/100 + 20
				let y = (this.fun(t, formula)*this.h/-100)+this.h + 20
				path.push('L ' + x + ',' + y);
			}
			return path.join(' ')
		},
		//increases the time value to 100
		play: function() {
			var vm = this
			var inter = setInterval(function() {
				vm.t++;
				if(vm.t >= 100)
					clearInterval(inter)
			}, 30)
		},
		//checking if the back to top button must be shown
		onScroll: function() {
			this.showLink = window.scrollY > 50
		},
		calcSize: function() {
			this.w = this.$refs.graphic.clientWidth - 40
			this.h = this.$refs.graphic.clientHeight - 40
		}
	},
	created() {
		//load data from json file
		fetch('json/easing-functions-subset-2.json')
		.then(response => response.json())
		.then(json => {			
			app.modal.text = json.description
			.replace(/((https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?)/, '<a target="_blank" href="$1">$1</a>'); //replace url with hyperlink
			app.easingFunctions = json.easingFunctions;
		})
		window.addEventListener('scroll', this.onScroll)
		window.addEventListener('resize', this.calcSize) //adaptive in testing
		window.addEventListener('keydown', (e) => {if(e.keyCode == 27) this.modal.show = false}) //hide modal dialog by Esc
	},
	mounted() {
		this.calcSize() //sets the w and h properties
	}
})
