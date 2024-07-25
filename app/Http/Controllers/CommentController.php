<?php

namespace App\Http\Controllers;

use App\Models\Comment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth; // Import the Auth facade

class CommentController extends Controller
{
    public function product($product_id)
    {
        $dsBL = Comment::where('product_id', $product_id)
            ->join('users', 'users.id', '=', 'user_id')
            ->select('comments.*', 'users.name AS user_fullname')
            ->get();
        $kq = [
            'status' => true,
            'message' => 'Lấy dữ liệu thành công!',
            'data' => $dsBL,
        ];
        return response()->json($kq, 200);
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
        $request->validate([
            'product_id' => 'required|exists:products,id',
            'content' => 'required|string',
            'rating' => 'required|integer|min:1|max:5',
        ]);

        $comment = new Comment();
        $comment->user_id = Auth::user()->id;
        $comment->product_id = $request->product_id;
        $comment->content = $request->content; // Fixed typo
        $comment->rating = $request->rating;
        $comment->save();

        $kq = [
            'status' => true,
            'message' => 'Thêm đánh giá thành công!',
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
        //
    }
}
