@extends('layout')
@section('title')
    {{$sp->name}}
@endsection

@section('noidung')
<!-- Start Breadcrumbs -->
<div class="breadcrumbs">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6 col-md-6 col-12">
                <div class="breadcrumbs-content">
                    <h1 class="page-title">Single Product</h1>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-12">
                <ul class="breadcrumb-nav">
                    <li><a href="index.html"><i class="lni lni-home"></i> Home</a></li>
                    <li><a href="index.html">Shop</a></li>
                    <li>Single Product</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- End Breadcrumbs -->

<!-- Start Item Details -->
<section class="item-details section" ng-controller="tcCtrl">
    <div class="container">
        <div class="top-area">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-12 col-12">
                    <div class="product-images">
                        <div id="product-images" class="carousel slide">
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img src="{{ asset('images/' . $sp->image) }}" class="d-block w-100" alt="{{ $sp->name }}">
                                </div>
                                @foreach ($sp->images as $item)
                                    <div class="carousel-item">
                                        <img src="{{ asset('images/' . $item->image) }}" class="d-block w-100" alt="{{ $sp->name }}">
                                    </div>
                                @endforeach
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#product-images" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#product-images" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                        <main id="gallery">
                            <div class="images">
                                <img data-bs-target="#product-images" data-bs-slide-to="0" src="{{ asset('images/' . $sp->image) }}" class="img" alt="{{ $sp->name }}">
                                @php $i = 1 @endphp
                                @foreach ($sp->images as $item)
                                    <img data-bs-target="#product-images" data-bs-slide-to="{{ $i++ }}" src="{{ asset('images/' . $item->image) }}" class="img" alt="{{ $sp->name }}">
                                @endforeach
                            </div>
                        </main>
                    </div>
                </div>
                <div class="col-lg-6 col-md-12 col-12">
                    <div class="product-info">
                        <h2 class="title">{{$sp->name}}</h2>
                        <p class="category"><i class="lni lni-tag"></i> Category:<a href="javascript:void(0)">{{$sp->category->name}}</a></p>
                        <h3 class="price">
                            @if (isset($sp->sale_price))
                                <span>{{ number_format($sp->price) }} VNĐ</span>
                                {{ number_format($sp->sale_price) }} VNĐ
                            @else
                                {{ number_format($sp->price) }} VNĐ
                            @endif
                        </h3>
                        <div class="row align-items-end">
                            <div class="col-lg-4 col-md-4 col-12">
                                <div class="form-group quantity">
                                    <label for="quantity">Quantity</label>
                                    <input type="number" class="form-control form-control-lg" value="1" min="1" max="{{$sp->instock}}" ng-model="quantity">
                                </div>
                            </div>
                            <div class="col-lg-8 col-md-8 col-12">
                                <div class="button cart-button">
                                    <button class="btn" style="width: 100%;" ng-click="addToCart({{$sp->id}}, quantity)">Add to Cart</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="product-details-info">
            <div class="single-block">
                <h4>Details</h4>
                <p>{{$sp->description}}</p>
            </div>
            <div class="row">
                <div class="col-lg-4 col-12">
                    <div class="single-block give-review">
                        <h4>{{ number_format($sp->rating, 1) }} (Overall)</h4>
                        <ul>
                            <li><span>5 stars - 38</span> <i class="lni lni-star-filled"></i><i class="lni lni-star-filled"></i><i class="lni lni-star-filled"></i><i class="lni lni-star-filled"></i><i class="lni lni-star-filled"></i></li>
                            <li><span>4 stars - 10</span> <i class="lni lni-star-filled"></i><i class="lni lni-star-filled"></i><i class="lni lni-star-filled"></i><i class="lni lni-star-filled"></i><i class="lni lni-star"></i></li>
                            <li><span>3 stars - 3</span> <i class="lni lni-star-filled"></i><i class="lni lni-star-filled"></i><i class="lni lni-star-filled"></i><i class="lni lni-star"></i><i class="lni lni-star"></i></li>
                            <li><span>2 stars - 1</span> <i class="lni lni-star-filled"></i><i class="lni lni-star-filled"></i><i class="lni lni-star"></i><i class="lni lni-star"></i><i class="lni lni-star"></i></li>
                            <li><span>1 star - 0</span> <i class="lni lni-star-filled"></i><i class="lni lni-star"></i><i class="lni lni-star"></i><i class="lni lni-star"></i><i class="lni lni-star"></i></li>
                        </ul>
                        <button type="button" class="btn review-btn" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            Leave a Review
                        </button>
                    </div>
                </div>
                <div class="col-lg-8 col-12">
                    <div class="single-block">
                        <div class="reviews">
                            <h4 class="title">Latest Reviews</h4>

                            <!-- Start Single Review -->
                            <div ng-repeat="bl in dsBL" class="single-review">
                                <img src="{{ asset('images/blog/comment2.jpg') }}" alt="#">
                                <div class="review-info">
                                    <h4>@{{ bl.user_fullname }} <span>@{{ bl.created_at | date:'dd/MM/yyyy HH:mm:ss' }}</span></h4>
                                    <ul class="stars">
                                        <li ng-repeat="item in [] | range:bl.rating"><i class="lni lni-star-filled"></i></li>
                                        <li ng-repeat="item in [] | range:(5 - bl.rating)"><i class="lni lni-star"></i></li>
                                    </ul>
                                    <p>@{{ bl.content }}</p>
                                </div>
                            </div>
                            <!-- End Single Review -->

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End Item Details -->

<!-- Review Modal -->
<div class="modal fade review-modal" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Leave a Review</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="review-name">Your Name</label>
                    <input class="form-control" type="text" id="review-name" required ng-model="user_fullname">
                </div>
                <div class="form-group">
                    <label for="review-rating">Rating</label>
                    <select class="form-control" id="review-rating" ng-model="rating">
                        <option value="5">5 Stars</option>
                        <option value="4">4 Stars</option>
                        <option value="3">3 Stars</option>
                        <option value="2">2 Stars</option>
                        <option value="1">1 Star</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="review-message">Review</label>
                    <textarea class="form-control" id="review-message" rows="8" required ng-model="content"></textarea>
                </div>
            </div>
            <div class="modal-footer button">
                <button type="button" ng-click="sendComment()" class="btn">Submit Review</button>
            </div>
        </div>
    </div>
</div>
<!-- End Review Modal -->
@endsection

@section('viewFunction')
    <script>
        viewFunction = function($scope, $http) {
            $scope.dsBL = [];
            $scope.quantity = 1;

            $scope.getComment = function() {
                $http.get('/api/comments/product/{{$sp->id}}').then(
                    function(res) {
                        $scope.dsBL = res.data.data;
                        console.log(res);
                    },
                    function(res) {
                        console.error(res);
                    }
                );
            };

            $scope.getComment();

            $scope.sendComment = function() {
                $http.post('/api/comments', {
                    'product_id': {{$sp->id}},
                    'content': $scope.content,
                    'rating': $scope.rating,
                }).then(
                    function(res) {
                        $scope.getComment();
                        document.querySelector('.btn-close').click();
                    },
                    function(res) {
                        console.error(res);
                    }
                );
            };
        };
    </script>
@endsection
