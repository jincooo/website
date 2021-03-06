<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>간단한 지도 표시하기</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=dl4sr4ygcb"></script>
    <script src = "https://code.jquery.com/jquery-3.2.1.min.js"> </script>
</head>

<body>
<!-- 
    <script>
    $(document).ready(function()
    { 
    	$.getJSON('https://8oi9s0nnth.apigw.ntruss.com/corona19-masks/v1/storesByGeo/json', function(data)
    		{
    		var html = [];
    		$.each(data["stores"], function(i, item) 
    		{
    			alert("i : "+i+" item.lat :"+item.lat +" item.lng : "+item.lng);

    		});
    	});
    });
 -->
    </script>

    
	<div id="map" style="width:100%;height:900px;"></div>

	<script>
	
	var center_lat = 37.498566;
	var center_lng = 127.028036;
	
	var suwon_lat = 37.258302;
	var suwon_lng = 127.023449;
	
	var mapOptions = 
	{
	    center: new naver.maps.LatLng(center_lat, center_lng),
	    zoom: 14
	    
	};
	
	var map = new naver.maps.Map('map', mapOptions);
	
	var mask_lat = suwon_lat;
	var mask_lng = suwon_lng;
	var markerOptions;
	var imgurl = '/assets/images/';
	
	
    $(document).ready(function()
    { 
    	$.getJSON('https://8oi9s0nnth.apigw.ntruss.com/corona19-masks/v1/storesByAddr/json', function(data)
    		{
    		var html = [];
    		$.each(data["stores"], function(i, item) 
    		{
    			//alert("i : "+i+" item.lat :"+item.lat +" item.lng : "+item.lng);
    			mask_lat = item.lat;
    			mask_lng = item.lng;
    			
    			 if(item.remain_stat == "plenty")
		        {
   					imgurl = '/assets/images/mask_green.png';
		        }
		        else if(item.remain_stat == "some")
	        	{
		        	imgurl = '/assets/images/mask_yellow.png';
	        	}
		        else if(item.remain_stat == "few")
	        	{
		        	imgurl = '/assets/images/mask_red.png';
	        	}
		        else
	        	{
		        	imgurl = '/assets/images/mask_gray.png';
	        	}
    			
    			markerOptions = 
    			{
    				//position: new naver.maps.LatLng(item.lat, item.lng),
    				position: new naver.maps.LatLng(mask_lat, mask_lng),
    			    map: map,
    			  	
    			    icon: {
    			        //url: HOME_PATH +'/img/example/sally.png',
    			        //url: MARKER_ICON_URL+ 'mask_green.png',
    			        url: imgurl,
    			        size: new naver.maps.Size(50, 50),
    			        origin: new naver.maps.Point(0, 0),
    			        anchor: new naver.maps.Point(11, 35)
    			    }
    			
    			};

        		var marker = new naver.maps.Marker(markerOptions);
    			//alert("i : "+i+" mask_lat :"+mask_lat +" mask_lng : "+mask_lng);
    			//alert("i : "+i+" item.lat :"+item.lat +" item.lng : "+item.lng);
    		});

    	});
    });
    
	
	
	
		
		
	//alert(window.HOME_PATH);
	</script>
	</body>
	
<!--
 
<body>
	<strong>처음시작하는4 index.jsp</strong>
	<div>
        <form action="/sample.do" method="post">
            <button onclick="submit"><img class="btn-img" src="/assets/images/mask_green.png">처음 만든 버튼111111</button>
        </form>
    </div>
</body>
 -->
</html>