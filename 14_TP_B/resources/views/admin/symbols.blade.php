@extends('layouts.app')
@section('content')
<main class="small-4 medium-3 col auto">
    <form action="symbols" method="POST" enctype="multipart/form-data">
        @csrf
        <input type="file" name="symbols[]" accept="*.png" multiple>
        <input type="submit" value="Upload">
    </form>
    <ul class="symbols">
        @foreach($symbols as $symbol)
        <li>
            <img src="{{ $symbol->path }}"/>
            <div class="buttons">
                @if ($symbol->disabled)
                <a href="symbols/{{ $symbol->id }}/update">Enable</a>
                <a href="symbols/{{ $symbol->id }}/delete" class="delete">Delete</a>
                @else
                <a href="symbols/{{ $symbol->id }}/update">Disable</a>
                @endif
            </div>
        </li>
        @endforeach
    </ul>
</main>
@endsection