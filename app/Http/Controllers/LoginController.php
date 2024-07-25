<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class LoginController extends Controller
{
    public function login(){
        return view('login');
    }
    public function postlogin(Request $req){
        $email = $req->input('email');
        $password = $req->input('password');
        $remember = $req->input('remember');


        $user = User::where('email', $email)->first();
        $canLogin = false;
        if (isset($user)) {
            $canLogin = Hash::check($password, $user->password);

        }
        if($canLogin){ //cho phép đăng nhập
            Auth::login($user, $remember);
            return redirect()->route('home');
        }else{
            session()->put('message', 'Email hoặc mật khẩu không đúng!');
            return back();
        }
    }
}
