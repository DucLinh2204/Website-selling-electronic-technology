<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Comment;

class CommentSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Comment::insert([
            [
                'user_id'=>1,
                'product_id'=>1,
                'content'=>'Gia qua dep',
                'rating'=>5,
                'created_at'=>now()
            ],
            [
                'user_id'=>1,
                'product_id'=>1,
                'content'=>'Gia qua da',
                'rating'=>4,
                'created_at'=>now()
            ]
        ]);
    }
}
