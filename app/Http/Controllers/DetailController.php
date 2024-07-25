<?php

namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;

class DetailController extends Controller
{
    public function detail($slug){
        $sp = Product::where('slug', $slug)->first();
        return view('detail', compact(['sp']));
    }
}
