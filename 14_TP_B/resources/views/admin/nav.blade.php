@extends('layouts.app')
@section('content')
<main class="small-4 medium-3 col auto">
    <h3>Reorder nav items by drag and drop</h3>
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
            this.classList.add("enter")
            to = this
        })
        item.addEventListener("dragleave", function(e) {
            this.classList.remove("enter")
        })
        item.addEventListener("dragend", function(e) {
            let temp = to.innerHTML
            to.innerHTML = from.innerHTML
            from.innerHTML = temp
            to.classList.remove("enter")
        })
    })
</script>
@endsection