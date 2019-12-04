var app = new Vue({
	el: '#app',
	data: {
		selectedFunctions: [],
		modal: {
			text: '',
			show: false
		},
		easingFunctions: [],
		t: 0,
		max: 0,
		w: 0, 
		h: 0,
		showLink: false
	},
	computed: {
		/*f: function() {
			return Math.round(this.fun(this.t))
		},*/
		scrolled: function() {
			return window.scrollY > 0
		}
	},
	methods: {
		fun: function(t, formula) {
			if(this.current === null) return 0
			t = t/100
			let cur = eval(formula)
			t = 1
			let max = eval(formula)
			return cur * 100 / max
		},
		path: function(time, formula) {
			var path = ['M 20,' + (this.h + 20)];
			for(let t = 0; t <= time; t += 1) {
				let x = t*this.w/100 + 20
				let y = (this.fun(t, formula)*this.h/-100)+this.h + 20
				path.push('L' + x+','+y);
			}
			return path.join(' ')
		},
		play: function() {
			var vm = this
			var inter = setInterval(function() {
				vm.t++;
				if(vm.t >= 100)
					clearInterval(inter)
			}, 30)
		},
		onScroll: function() {
			this.showLink = window.scrollY > 50
		},
		calcSize: function() {
			this.w = this.$refs.graphic.clientWidth - 40
			this.h = this.$refs.graphic.clientHeight - 40
		}
	},
	created() {
		window.addEventListener('scroll', this.onScroll)
		window.addEventListener('resize', this.calcSize)
	},
	mounted() {
		fetch('json/easing-functions-subset-2.json')
		.then(response => response.json())
		.then(json => {			
			app.modal.text = json.description;
			app.easingFunctions = json.easingFunctions;
		})
		this.calcSize()
	}
})
