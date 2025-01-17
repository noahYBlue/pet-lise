<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="icon" href="/images/favicon.ico" />
    <link rel="apple-touch-icon" href="/images/favicon.ico" />
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="/css/admin/dashboard.css" />
    <link rel="stylesheet" href="/css/admin/aside.css" />
    <title>Pet LiSe</title>
  </head>
  <body>
    <div class="container">
      <aside id="asideMenu"></aside>
      <main>
        <p>대시보드</p>
        <div class="dataWrapper">
          <p class="totalTitle">일일 유저 데이터 통계</p>
          <div class="totalWrapper">
            <div>
              <p>오늘 신규 가입자 수</p>
              <p>20<span>명</span></p>
            </div>
            <div>
              <p>오늘 등록된 나만의 레시피 수</p>
              <p>10<span>개</span></p>
            </div>
            <div>
              <p>오늘 등록된 커뮤니티 수</p>
              <p>12<span>개</span></p>
            </div>
          </div>

          <div class="chartWrapper">
            <p>최근 7일간의 신규 가입자 수</p>
            <div class="chart">
              <canvas id="myChart"></canvas>
            </div>
          </div>
        </div>
      </main>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.bundle.js"></script>
    <script src="/js/admin/dashboard.js"></script>
    <script src="/js/admin/aside.js"></script>
  </body>
</html>
