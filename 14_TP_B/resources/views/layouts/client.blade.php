<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Shop</title>
	<link rel="stylesheet" type="text/css" href="public/css/style.css">
	<script src="public/js/vue.js"></script>
	<script src="public/js/axios.min.js"></script>
</head>
<body>
	@verbatim
	<header id="nav">
		<a v-for="link in links" :href="link.link">{{ link.name }}</a>
	</header>
	@endverbatim
	<div class="container">
		@yield('content')
	</div>
</body>
<script type="text/javascript">
	var nav = new Vue({
		el: '#nav',
		data: {
			links: []
		},
		created() {
			axios.get('api/links')
			.then(response => this.links = response.data)
		}
	})
</script>
</html>