var app = new Vue({
	el: '#app',
	data: {
		dates : [],
		progress: 0,
		point: '',
		audios: {},
		modal: false,
		sun: false
	},
	watch: {
		point: function() {
			this.audios.alligator.pause()
			switch(this.point) {
				case 'music':
					this.audios.music.play()
					break
					break
				case 'alligator':
					this.audios.alligator.play()
					break
				case 'end':
					this.audios.end.play()
					break
			}
		},
		progress: function() {
			if(this.progress > 10 && this.progress < 40) {
				let offset = this.progress > 25 ? this.progress - 25 : 25 - this.progress
				this.audios.music.volume = (15 - offset) / 15
				this.audios.music.play()
			} else {
				this.audios.music.pause()
			}
			if(this.progress > 50 && this.progress < 80) {
				let offset = this.progress > 65 ? this.progress - 65 : 65 - this.progress
				this.audios.alligator.volume = (15 - offset) / 15
				this.audios.alligator.play()
			} else {
				this.audios.alligator.pause()
			}
			if(this.progress > 35) this.sun = true
			window.scrollTo(8000 * this.progress / 100, 0)
		}
	},
	methods: {
		goTo: function(point) {
			var box
			switch(point) {
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
				case 'end':
					box = this.$refs.portOfManausEnd.getBoundingClientRect()
					break
			}
			var newProgress = (window.scrollX + box.x - (window.innerWidth - box.width) / 2) / 80
			var interval = setInterval(() => {
				if(newProgress > this.progress) {
					this.progress ++
					if(this.progress > newProgress) {
						clearInterval(interval)
						this.point = point
					}
				} else {
					this.progress --
					if(this.progress < newProgress) {
						clearInterval(interval)
						this.point = point
					}
				}
			}, 25) 			
		},
		scroll: function(e) {
			var box = this.$refs.portOfManausStart.getBoundingClientRect()
			if(box.x >= -500) this.point = 'start'
			box = this.$refs.meetingWaters.getBoundingClientRect()
			if(box.x + box.width <= window.innerWidth * 1.2 && box.width + box.x >= window.innerWidth / 3) this.point = 'meeting'
			box = this.$refs.classicMusic.getBoundingClientRect()
			if(box.x + box.width <= window.innerWidth * 1.2 && box.width + box.x >= window.innerWidth / 3) this.point = 'music'
			box = this.$refs.piranhas.getBoundingClientRect()
			if(box.x + box.width <= window.innerWidth * 1.2 && box.width + box.x >= window.innerWidth / 3) this.point = 'piranhas'
			box = this.$refs.alligator.getBoundingClientRect()
			if(box.x + box.width <= window.innerWidth * 1.2 && box.width + box.x >= window.innerWidth / 3) this.point = 'alligator'
			box = this.$refs.portOfManausEnd.getBoundingClientRect()
			if(box.x + box.width <= window.innerWidth) {
				this.point = 'end'
			} else {
				this.progress = (window.scrollX - e.wheelDelta / 3) / 80
			}
		},
		depart: function() {
			window.scrollTo(0, 0)
			this.point = 'start'
			this.audios.start.play()
			this.audios.background.play()
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
		this.audios.background.loop = true
		this.audios.end.onended = () => {this.modal = true}		
	}
})