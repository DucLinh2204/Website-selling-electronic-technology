<?php

use App\Http\Controllers\AboutController;
use App\Http\Controllers\BlogController;
use App\Http\Controllers\BlogSingleController;
use App\Http\Controllers\BlogSingleSidebarController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\CheckoutController;
use App\Http\Controllers\ContactController;
use App\Http\Controllers\DetailController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\MailController;
use App\Http\Controllers\PageController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ProductGridController;
use App\Http\Controllers\RegisterController;
use App\Http\Controllers\CommentController;
use Illuminate\Support\Facades\Route;


Route::get('/', [PageController::class, 'home'])->name('home');
Route::get('/about', [AboutController::class, 'about']);
Route::get('/blog', [BlogController::class, 'blog']);
Route::get('/blogsingle', [BlogSingleController::class, 'blogsingle']);
Route::get('/blogsinglesidebar', [BlogSingleSidebarController::class, 'blogsinglesidebar']);
Route::get('/cart', [CartController::class, 'cart']);
Route::get('/checkout', [CheckoutController::class, 'checkout']);
Route::get('/contact', [ContactController::class, 'contact']);
Route::get('/login', [LoginController::class, 'login'])->name('login');
Route::post('/login', [LoginController::class, 'postlogin']);
Route::get('/logout', function(){
    Auth::logout();
    return redirect()->route('login');
})->name('logout');
Route::get('/register', [RegisterController::class, 'register'])->name('register');
Route::post('/register', [RegisterController::class, 'postregister']);
Route::get('/product', [ProductController::class, 'product']);
Route::get('/product_grid', [ProductGridController::class, 'product_grid']);
Route::get('/detail/{slug}', [DetailController::class, 'detail'])->name('detail');
Route::get('/mailsuccess', [MailController::class, 'mailsuccess']);

Route::prefix('api')->group(function(){
    Route::get('/comments/product/{id}',[CommentController::class, 'product']);
    Route::resource('/comments', CommentController::class);
    Route::resource('/cart', CartController::class);
});
Route::post('/cart', [CartController::class, 'cart']);
