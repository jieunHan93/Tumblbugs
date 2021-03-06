<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>텀블벅스 :: tumblbugs</title>
	<link rel="icon" href="http://localhost:9090/tumblbugs/images/tumblbugs_img_logo.ico" type="image/x-icon">
	<script src="http://localhost:9090/tumblbugs/js/jquery-3.4.1.min.js"></script>
	<script src="http://localhost:9090/tumblbugs/js/slick.min.js"></script>
	<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/main.css">
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/gh/kenwheeler/slick@1.8.1/slick/slick.css"/>
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/gh/kenwheeler/slick@1.8.1/slick/slick-theme.css"/>
	<script src="http://localhost:9090/tumblbugs/js/isotope-docs.min.js"></script>
	<script src="http://localhost:9090/tumblbugs/js/infinite-scroll-docs.min.js"></script>
	<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<link rel="stylesheet" type="text/css" href="http://localhost:9090/tumblbugs/css/project_sort.css">
	<style>
		a#sharekakao{
			cursor:pointer;
		}
	</style>
	<script>
	$(document).ready(function(){
		var col_id='${col_id}';
			var $grid =  $('.grid').isotope({
  			  itemSelector: '.scroll-card',
  			  masonry: {
  			    columnWidth: '.grid__col-sizer',
  			    gutter: '.grid__gutter-sizer',
  			  },
  			  percentPosition: true,
  			  stagger: 30,
  			  // nicer reveal transition
  			  visibleStyle: { transform: 'translateY(0)', opacity: 1 },
  			  hiddenStyle: { transform: 'translateY(100px)', opacity: 0 },
  			});

  			//------------------//

  			// Get an API key for your demos at https://unsplash.com/developers
  			//var unsplashID = '9ad80b14098bcead9c7de952435e937cc3723ae61084ba8e729adb642daf0251';

  			// get Masonry instance
  			var iso = $grid.data('isotope');
  			var $container = $grid.infiniteScroll({
  			  // use path string with {{#}} for page number
  			  //path: 'https://api.unsplash.com/photos?page={{#}}&client_id=' + unsplashID,
			  path: 'http://localhost:9090/tumblbugs/collections_proc?page={{#}}&col_id='+col_id,
  			  // load response as flat text
  			  responseType: 'text',
  			  outlayer: iso,
  			  status: '.page-load-status',
  			  history: false,
  			});
			
			
  			$grid.on( 'load.infiniteScroll', function( event, response ) {
  			  // parse response into JSON data
  			  var data = JSON.parse( response );
  			 console.log( response );
  			  // compile data into HTML
  			  var itemsHTML = data.list.map( getItemHTML ).join('');
  			  // convert HTML string into elements
  			  var $items = $( itemsHTML );
  			  
  			  // append item elements
  			  $items.imagesLoaded( function() {
  			    $grid.infiniteScroll( 'appendItems', $items )
  			      .isotope( 'appended', $items );
  			  })
  			});
  		
  			// load initial page

  			$grid.infiniteScroll('loadNextPage');

  			//------------------//

  			var itemTemplateSrc = $('#photo-item-template').html();

  			function getItemHTML( photo ) {
  			  return microTemplate( itemTemplateSrc, photo );
  			}

  			// micro templating, sort-of
  			function microTemplate( src, data ) {
  			  // replace {{tags}} in source
  			  return src.replace( /\{\{([\w\-_\.]+)\}\}/gi, function( match, key ) {
  			    // walk through objects to get value
  			    var value = data;
  			    key.split('.').forEach( function( part ) {
  			      value = value[ part ];
  			    });
  			    return value;
  			  });
  			}
	});
	//카카오톡 공유
	function shareKakaotalk() {
        Kakao.init("77213dce7d91d4ec2bd5e608ef304498");      // 사용할 앱의 JavaScript 키를 설정
        Kakao.Link.sendDefault({
              objectType:"feed"
            , content : {
                  title:"2020 신년준비위원회"   // 콘텐츠의 타이틀
                , description:"텀블벅스에서 신년준비를 하세요"   // 콘텐츠 상세설명
                , imageUrl:"http://127.0.0.1:9090/tumblbugs/images/collections01.png"   // 썸네일 이미지
                , link : {
                      mobileWebUrl:"http://localhost:9090/tumblbugs/collections"   // 모바일 카카오톡에서 사용하는 웹 링크 URL
                    , webUrl:"http://localhost:9090/tumblbugs/collections" // PC버전 카카오톡에서 사용하는 웹 링크 URL
                }
            }
            , social : {
            	  viewCount:10       // 조회수
                , sharedCount:10     // 공유 회수
            }
            , buttons : [
                {
                      title:"컬렉션 확인"    // 버튼 제목
                    , link : {
                        mobileWebUrl:"http://localhost:9090/tumblbugs/collections"   // 모바일 카카오톡에서 사용하는 웹 링크 URL
                      , webUrl:"http://localhost:9090/tumblbugs/collections" // PC버전 카카오톡에서 사용하는 웹 링크 URL
                    }
                }
            ]
        });
    }
	</script>
	<script type="text/html" id="photo-item-template">
	<div class="scroll-card">
		<a href="http://localhost:9090/tumblbugs/project/{{pj_addr}}">
			<img id="product_img" src="http://localhost:9090/tumblbugs/upload/{{pj_simg}}">
			<div class="slick-card-content">
				<div class="slick-card-content-title">
					<h1>{{pj_title}}</h1>
					<p>{{name}}</p>
				</div>
				<div class="progress">
					<div class="progress-bar" role="progressbar" aria-valuenow="{{progress}}" aria-valuemin="0" aria-valuemax="100" style="width:{{progress}}%"></div>
				</div>
				<div class="slick-card-content-others">
					<div>
						<i class="{{icon}}" style="color:{{color}};"></i>
						<span style="color:{{color}};">{{remaining_days}}</span>
					</div>
					<div>
						<span>{{funding}}원</span>
						<span>{{progress}}%</span>
					</div>
				</div>
			</div>
		</a>
	</div>
	</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	
	<div>
		<section id="collections_back" style="background-color:${vo.col_bcolor}">
			<div id="collections_content">
				<div id="col_con_img">
					<img src="http://localhost:9090/tumblbugs/upload/${vo.col_simg }">
				</div>
				<div id="col_con_detail">
					<div id="con_detail_title">${vo.col_name }</div>
					<div id="con_detail_content">${vo.col_content }</div>
					<div id="con_detail_sns">
						<a href="https://www.facebook.com/sharer/sharer.php?u=http://127.0.0.1:9090/tumblbugs/collections" target="blank" onClick="window.open(this.href, '', 'width=400, height=550'); return false;"><span><i class="fab fa-facebook-f"></i></span></a>
						<a href="https://twitter.com/intent/tweet?url=http://localhost:9090/tumblbugs/index" target="blank" onClick="window.open(this.href, '', 'width=400, height=550'); return false;"><span><i class="fab fa-twitter"></i></span></a>
						<a id="sharekakao" onClick="shareKakaotalk();"><span><i class="fas fa-comment"></i></span></a>
					</div>
				</div>
			</div>
		</section>
		
		<section id="collections_main">
			<div class="grid">
					<div class="grid__col-sizer"></div>
					<div class="grid__gutter-sizer"></div>
				</div>
				
				<div class="page-load-status">
					<div class="loader-ellips infinite-scroll-request">
				    	<span class="loader-ellips__dot"></span>
				    	<span class="loader-ellips__dot"></span>
				    	<span class="loader-ellips__dot"></span>
				    	<span class="loader-ellips__dot"></span>
				  	</div>
				  	<!-- <p class="infinite-scroll-last">End of content</p> -->
				  	<div class="infinite-scroll-error"><div id="error_icon"></div><div>발견된 프로젝트가 없습니다.</div></div>
			</div>
		</section>
	</div>
	
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>