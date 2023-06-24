<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\View;


class UsuarioController extends Controller
{

        public function index() {
            $datos=  DB::select("select * from usuario");
            return View("otraVista")->with("datos",$datos);
            // $data= [
            //     'name' => 'moises',
            //     'age' => 'edad'
            // ];
            // // return View::make('test',['datos' => 'pepe']);
            // return View("test")->with("data",$data);
        }
            
        // public function register(Request $request) {
        // $incomingFields = $request->validate([
        //     // 'name' => ['required', 'min:3', 'max:10', Rule::unique('users', 'name')],
        //     // 'email' => ['required', 'email', Rule::unique('users', 'email')],
        //     // 'password' => ['required', 'min:8', 'max:200']
        //     "usuEmail" => ['required', 'min:3', 'max:60'],
        //     "usuNombre1" => ['required', 'min:3', 'max:60'], 
        //     "usuNombre2"=> ['min:3', 'max:60'], 
        //     "usuApell1" => ['required','min:3', 'max:60'],
        //     "usuApell2" => ['min:3', 'max:60'],
        //     "usuFechNac"=> ['required','min:3', 'max:60'], 
        //     "usuPassword"=> ['required','min:3', 'max:60'],
        //     "usuUsername"=> ['required','min:3', 'max:60'],
        //     "usuPais"=> ['required','min:3', 'max:60'],
        //     "usuCiudad"=> ['required','min:3', 'max:60']
        // ]);

        // $incomingFields['password'] = bcrypt($incomingFields['password']);
        // $user = User::create($incomingFields);
        // auth()->login($user);
        // return redirect('/');
    
}
