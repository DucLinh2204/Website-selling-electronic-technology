<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product; // Import the Product model

class CartController extends Controller
{
    public function cart(){
        return view('cart');
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        if (is_null(session('cart'))) {
            session()->put('cart', []);
        }

        $cart = session('cart');
        $inCart = false;

        foreach ($cart as $key => $sp) {
            if ($sp->id == $request->product_id) {
                $cart[$key]->quantity += $request->quantity;
                $inCart = true;
                break;
            }
        }

        if (!$inCart) {
            $sp = Product::find($request->product_id);
            $sp->quantity = $request->quantity;
            session()->push('cart', $sp);
        }

        $kq = [
            'status' => true,
            'message' => 'Đã thêm sản phẩm vào giỏ hàng!',
            'data' => session('cart'),
        ];
        return response()->json($kq, 200);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        session()->pull('cart', $id);
        $kq=[
            'status' => true,
            'message' => 'Đã xoá sản phẩm',
            'data' => session('cart'),
        ];
        return redirect()->route('cart');
    }
}
