@extends('layouts.app')
@section('content')
<main class="small-4 medium-3 col auto">
    <form action="symbols" method="POST" enctype="multipart/form-data">
        @csrf
        <!-- file input -->
        <label class="file-input">
            <div><!-- here will be pa preview --></div>
            <img class="bg" src="{{ asset('public/img/select.png') }}" alt="Select files">
            <input type="file" id="file" name="symbols[]" accept="*.png" multiple required>
        </label>
        <input type="submit" value="Upload">
    </form>
    <ul class="symbols">
        @foreach($symbols as $symbol)
        <!-- list of symbols -->
        <li>
            <img src="{{ $symbol->path }}" class="{{ $symbol->disabled ? 'disabled' : '' }}"/>
            <div class="buttons">
                <!-- show buttons according to state -->
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
<script type="text/javascript">
    //upload files by drag and drop
    document.getElementById('file').addEventListener('change', function(){
        for(var i = 0; i < this.files.length; i++) {
            if(this.files[i].type.indexOf('image') != -1) {
                var reader = new FileReader();
                reader.onload = (function(theFile) {
                    return function(e) {
                            // Render thumbnail.
                            var span = document.createElement('span');
                            span.innerHTML = ['<img class="thumbnail" title="', theFile.name, '" src="', e.target.result, '" />'].join('');
                            document.querySelector('.file-input > div').insertBefore(span, null);
                            document.querySelector('.file-input').classList.add('filled');
                        };
                    })(this.files[i]);
                    reader.readAsDataURL(this.files[i]);
                }
            }
        });
    </script>
    @endsection