@extends('layouts.app')
@section('content')
<main class="small-4 medium-3 col auto">
    <form action="nav" method="POST">
        @csrf
        <ul class="links">
        @foreach($links as $link)
            <li draggable="true">
                <input type="hidden" name="links[]" value="{{ $link->id }}" />
                {{ $link->name }}
            </li>
        @endforeach
        </ul>
        <input type="submit" value="Save">
    </form>    
</main>
<script type="text/javascript">
    var items = document.querySelectorAll('[draggable')
    var from = {}
    var to = {}
    items.forEach(function(item) {
        item.addEventListener("dragstart", function(e) {
            e.dataTransfer.effectAllowed = "move"
            from = this
        })
        item.addEventListener("dragover", function(e) {
            e.preventDefault()
            e.dataTransfer.dropEffect = "move"
        })
        item.addEventListener("dragenter", function(e) {
            this.style.border = "1px solid #333"
            to = this
        })
        item.addEventListener("dragleave", function(e) {
            this.style.border = "none"
        })
        item.addEventListener("dragend", function(e) {
            let temp = to.innerHTML
            to.innerHTML = from.innerHTML
            from.innerHTML = temp
            to.style.border = "none"
        })
    })
</script>
@endsection