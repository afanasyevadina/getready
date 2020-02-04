document.getElementById('modal').onclick=function (){
	document.getElementById('modal').setAttribute('class','');
	return false;
}

document.onload = function() {
	window.scrollTo(0, 0)
}
var app = new Vue({
	el: '#app',
	data: {
		dates : [],
		progress: 0,
		point: '',
		audios: {},
		modal: false
	},
	watch: {
		point: function() {
			this.audios.alligator.pause()
			this.audios.music.pause()
			switch(this.point) {
				case 'start':
					this.audios.start.play()
					break
				case 'meeting':					
					break
				case 'music':
					this.audios.music.play()
					break
					break
				case 'alligator':
					this.audios.alligator.play()
					break
				case 'end':
					this.audios.end.play().then(res => this.modal = true)
					break
			}
		},
		progress: function() {
			window.scrollTo(8000 * this.progress / 100, 0)
		}
	},
	methods: {
		goTo: function(point) {
			this.point = point
			var box
			switch(point) {
				case 'start':
					box = this.$refs.portOfManausStart.getBoundingClientRect()
					break
				case 'meeting':
					box = this.$refs.meetingWaters.getBoundingClientRect()
					break
				case 'music':
					box = this.$refs.classicMusic.getBoundingClientRect()
					break
				case 'piranhas':
					box = this.$refs.piranhas.getBoundingClientRect()
					break
				case 'alligator':
					box = this.$refs.alligator.getBoundingClientRect()
					break
			}
			this.progress = (window.scrollX + box.x - (window.innerWidth - box.width) / 2) / 80
		},
		scroll: function(e) {
			var box = this.$refs.portOfManausStart.getBoundingClientRect()
			if(box.x >= -500) this.point = 'start'
			box = this.$refs.meetingWaters.getBoundingClientRect()
			if(box.x + box.width <= window.innerWidth + 500 && box.width + box.x >= 500) this.point = 'meeting'
			box = this.$refs.classicMusic.getBoundingClientRect()
			if(box.x + box.width <= window.innerWidth && box.width + box.x >= 500) this.point = 'music'
			box = this.$refs.piranhas.getBoundingClientRect()
			if(box.x + box.width <= window.innerWidth && box.width + box.x >= 500) this.point = 'piranhas'
			box = this.$refs.alligator.getBoundingClientRect()
			if(box.x + box.width <= window.innerWidth && box.width + box.x >= 500) this.point = 'alligator'
			box = this.$refs.portOfManausEnd.getBoundingClientRect()
			if(box.x + box.width <= window.innerWidth + 500) {
				this.point = 'end'
			} else {
				this.progress = (window.scrollX - e.wheelDelta) / 80
			}
		}
	},
	created() {
		fetch('dates.json')
		.then(response => response.json())
		.then(json => this.dates = json.dates)
		window.onmousewheel = e => this.scroll(e)
		this.audios = {
			start: new Audio('audio/cruise_departure.mp3'),
			background: new Audio('audio/background.mp3'),
			music: new Audio('audio/classic_music.mp3'),
			alligator: new Audio('audio/alligator.mp3'),
			end: new Audio('audio/cruise_arrival.mp3')
		}		
	},
	mounted() {
		this.point = 'start'
	}
})