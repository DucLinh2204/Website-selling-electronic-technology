<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>
        @yield('title')
    </title>
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.svg" />
    <link rel="stylesheet" href="{{asset('assets/css/bootstrap.min.css')}}" />
    <link rel="stylesheet" href="{{asset('assets/css/LineIcons.3.0.css')}}" />
    <link rel="stylesheet" href="{{asset('assets/css/tiny-slider.css')}}" />
    <link rel="stylesheet" href="{{asset('assets/css/glightbox.min.css')}}" />
    <link rel="stylesheet" href="{{asset('assets/css/main.css')}}" />
</head>
<body ng-app="tcApp" ng-controller="tcCtrl">
    <div class="preloader">
        @include('loader')
    </div>


    <header class="header navbar-area">
        @include('header')
    </header>


    <div ng-controller="viewCtrl">
        @yield('noidung')
    </div>



    <footer class="footer">
        @include('footer')
    </footer>


</body>
    <a href="#" class="scroll-top">
        <i class="lni lni-chevron-up"></i>
    </a>
    <script src="{{asset('assets/js/angular.min.js')}}"></script>
    <script src="{{asset('assets/js/bootstrap.min.js')}}"></script>
    <script src="{{asset('assets/js/tiny-slider.js')}}"></script>
    <script src="{{asset('assets/js/glightbox.min.js')}}"></script>
    <script src="{{asset('assets/js/main.js')}}"></script>
    <script type="text/javascript">
        tns({
            container: '.hero-slider',
            slideBy: 'page',
            autoplay: true,
            autoplayButtonOutput: false,
            mouseDrag: true,
            gutter: 0,
            items: 1,
            nav: false,
            controls: true,
            controlsText: ['<i class="lni lni-chevron-left"></i>', '<i class="lni lni-chevron-right"></i>'],
        });

        tns({
            container: '.brands-logo-carousel',
            autoplay: true,
            autoplayButtonOutput: false,
            mouseDrag: true,
            gutter: 15,
            nav: false,
            controls: false,
            responsive: {
                0: {
                    items: 1,
                },
                540: {
                    items: 3,
                },
                768: {
                    items: 5,
                },
                992: {
                    items: 6,
                }
            }
        });

    </script>
    <script>
        const finaleDate = new Date("February 15, 2023 00:00:00").getTime();

        const timer = () => {
            const now = new Date().getTime();
            let diff = finaleDate - now;
            if (diff < 0) {
                document.querySelector('.alert').style.display = 'block';
                document.querySelector('.container').style.display = 'none';
            }

            let days = Math.floor(diff / (1000 * 60 * 60 * 24));
            let hours = Math.floor(diff % (1000 * 60 * 60 * 24) / (1000 * 60 * 60));
            let minutes = Math.floor(diff % (1000 * 60 * 60) / (1000 * 60));
            let seconds = Math.floor(diff % (1000 * 60) / 1000);

            days <= 99 ? days = `0${days}` : days;
            days <= 9 ? days = `00${days}` : days;
            hours <= 9 ? hours = `0${hours}` : hours;
            minutes <= 9 ? minutes = `0${minutes}` : minutes;
            seconds <= 9 ? seconds = `0${seconds}` : seconds;

            document.querySelector('#days').textContent = days;
            document.querySelector('#hours').textContent = hours;
            document.querySelector('#minutes').textContent = minutes;
            document.querySelector('#seconds').textContent = seconds;

        }
        timer();
        setInterval(timer, 1000);
    </script>
    <script>
        window.onload = function () {
        window.setTimeout(fadeout, 500);
        }

        function fadeout() {
        document.querySelector('.preloader').style.opacity = '0';
        document.querySelector('.preloader').style.display = 'none';
        }
  </script>
  <script>
    var app = angular.module('tcApp',[]);
    app.controller('tcCtrl', function($scope, $http) {
        $scope.cart = {!! json_encode(session()->get('cart')) !!} || [];

        $scope.addToCart = function(product_id, quantity) {
            $http.post('/api/cart', {
                product_id: product_id,
                quantity: quantity,
            }).then(function(res) {
                $scope.cart = res.data.data;
            });
        }

        $scope.deleteFormCart = function(index) {
            $http.delete('/api/cart/' + index).then(function(res) {
                $scope.cart = res.data.data;
            })
        }

    });

    var viewFunction = function($scope){

    };
  </script>
  @yield('viewFunction')
  <script>
    app.controller('viewCtrl', viewFunction);
  </script>
</html>
