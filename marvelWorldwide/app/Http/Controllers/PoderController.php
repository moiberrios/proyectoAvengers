<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use marvelWorldwide\Poder;
use marvelWorldwide\Http\Requests\PoderFormRequest;
use DB;

class PoderController extends Controller
{
    public function __construct(){

    }
    public function index(Request $request){
        if ($request)
        {
            $query=trim($request->get('searchText'));
            $poderes=DB::table('poder')->where('poderNombre','LIKE','%'.$query.'%')
            ->orderBy('poderID','desc')
            ->paginate(7);
            return view('almacen.poder.index',["poderes"=>$poderes,"searchText"=>$query]);

        }
    }
    public function create(){
        return view("almacen.poder.create");
    }
    public function store(){
        $poder=new Poder;
        $poder->poderNombre=$request->get('poderNombre');
        $poder->poderDescripcion=$request->get('poderDescripcion');
        $poder->save();
        return Redirect::to('almacen/poder');
    }
    public function show($id){
        return view("almacen.poder.show",["poder"=>Poder::findOrFail($id)]);
    }
    public function edit($id){
        return view("almacen.poder.show",["poder"=>Poder::findOrFail($id)]);
    }
    public function update(PoderFormRequest $request,$id){
        $poder=Poder::findOrFail($id);
        $poder->poderNombre=$request->get('poderNombre');
        $poder->poderDescripcion=$request->get('poderDescripcion');
        $poder->update();
        return Redirect::to('almacen/poder');
    }
    // public function destroy(){
        // DB::connection('main')->delete("delete from poder where id = $",);
    // }
}
