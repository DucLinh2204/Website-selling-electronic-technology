<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Contracts\Session\Session;
use Illuminate\Http\Request;

class RegisterController extends Controller
{
    public function register(){
        return view('register');
    }
    public function postregister(Request $req){
        $email = $req->input('email');
        $password = $req->input('password');
        $repassword = $req->input('repassword');
        $name = $req->input('name');


        if($password!=$repassword){
            session()->put('message', 'Mật khẩu nhập lại không trùng khớp');
            return back();
        }


        $user = User::where('email', $email)->first();
        if (isset($user)) {
            session()->put('message', 'Email đã tồn tại! Vui lòng sử dụng email khác để đăng ký');
            return back();
        }


        $user = new User();
        $user->name = $name;
        $user->password = $password;
        $user->email = $email;
        $user->password = $password;
        $user->save();
        return redirect()->route('login');
    }


    
}
