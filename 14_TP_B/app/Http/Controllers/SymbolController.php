<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use App\Symbol;

class SymbolController extends Controller
{
    public function index()
    {
        return Symbol::where('disabled', null)->get();
    }

    public function edit()
    {
        return view('admin.symbols', ['symbols' => Symbol::all()]);
    }

    public function update($id)
    {
        $symbol = Symbol::find($id);
        $symbol->disabled = $symbol->disabled ? null : 1;
        $symbol->save();
        return back();
    }

    public function store(Request $request)
    {
        foreach($request->file('symbols') as $file) {
            $symbol = new Symbol();
            $path = Storage::disk('public')->putFile('symbols', $file);
            $symbol->filename = $path;
            $symbol->name = pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME);
            $symbol->save();
        }
        return back();
    }

    public function destroy($id)
    {
        $symbol = Symbol::find($id);
        unlink('storage/app/public/'.$symbol->filename);
        $symbol->delete();
        return redirect()->route('symbols');
    }
}
