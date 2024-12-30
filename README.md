# be13-1st-showMeTheMoney-PosMos

![convenience_store_counter_with_logo_resized](https://github.com/user-attachments/assets/4703952c-99cd-4c29-895a-b05933e31a4d)

## 프로젝트명: Point Of Sales Management Of Sales

|<img src="https://avatars.githubusercontent.com/Sirius147" width="150" height="150"/>|<img src="https://avatars.githubusercontent.com/pppseojun" width="150" height="150"/>|<img src="https://avatars.githubusercontent.com/u/143144372?v=4" width="150" height="150"/>|<img src="https://avatars.githubusercontent.com/ericyum" width="150" height="150"/>|<img src="https://avatars.githubusercontent.com/kwonjiin" width="150" height="150"/>|
|:-:|:-:|:-:|:-:|:-:|
|이성일<br/>[@Sirius147](https://github.com/Sirius147)|박서준<br/>[@pppseojun](https://github.com/pppseojun)|오영광<br/>[@OhGlory](https://github.com/OhGlory)|염정운<br/>[@ericyum](https://github.com/ericyum)|권지민<br/>[@Kwonjiin](https://github.com/kwonjiin)|

<br/> <br/>

## 프로젝트 소개

<br/>

### 실시간 재고 관리

실시간으로 재고 상태를 추적하고, 물품 매입 또는 판매가 이루어질 때마다 자동으로 재고를 업데이트 합니다.

### 정확한 매출 분석

POS 시스템에서 발생한 거래 데이터를 기반으로 매출 분석을 자동적으로 진행하여 운영자는  더욱 정확한 예산 계획을 통해 원활한 운영에 도움을 줍니다.

### 고객 맞춤형 서비스

고객의 구매 패턴을 분석하여 자주 구매하는 제품을 추천하거나 자주 구매하는 상품의  할인 정보를 알려줌으로써 매장에 대한 고객 만족도를 높일 수 있습니다.

## 프로젝트 배경

![image](https://github.com/user-attachments/assets/886f3649-ef2b-4e1b-9c73-126eed05d60a)

![image](https://github.com/user-attachments/assets/fd2c993d-53ba-4d67-a253-ff97d1714157)


최근 넷플릭스에서 방영된 흑백요리사 가 큰 인기를 끌며, 해당 프로그램과 협업한 편의점 간편식 및 디저트 제품들이 대중의 폭발적인 관심을 받았습니다. 이로 인해 특정 제품이 빠르게 품절되는 **‘편의점 대란’** 현상이 발생하였고, 많은 사람들이 편의점을 자주 찾는 계기가 되었습니다.
최근 미디어 콘텐츠와 편의점 산업의 융합으로 인해 변화하는 소비 트렌드에 대응하며, 소상공인들에게 실질적인 도움을 주는 디지털 도구를 개발하는 데 초점을 맞추고 있습니다.

미디어 콘텐츠와 결합된 상품이 소비자들의 구매 패턴에 미치는 영향력이 증가하면서, **편의점 내 물품의 재고 관리와 현황 파악의 중요성**이 더욱 부각되고 있습니다을 느꼈습니다

## 주요기능소개

* **상품 등록 및 판매 관련 소비자와 의사소통을 도와준다**
* **결제 및 재고 관리 관련된 일련의 프로세스를 관리한다**
* **고객 관리 및 상품 이벤트 등록을 통해 프로모션을 진행한다**
* **직원관리를 통해 효율적인 매장관리에 기여한다**

## wbs

![wbs](https://github.com/user-attachments/assets/1753af09-eb02-495d-9742-22a4c37e3167)

## 요구사항명세서

![요구사항명세서1](https://github.com/user-attachments/assets/f11397ce-c921-4997-9780-dc99225dcd79)
![요구사항명세서2](https://github.com/user-attachments/assets/0d002e89-1dd4-43b4-9832-779694197d01)

## ERD

![image](https://github.com/user-attachments/assets/78cf728e-a0cc-4e05-83c9-7a9352264ddb)

## 테이블명세서

![테이블명세서1](https://github.com/user-attachments/assets/5891d4ef-68ed-4248-aabf-b153a64984e6)
![테이블명세서2](https://github.com/user-attachments/assets/5696eb6f-6424-4d5c-8fee-443b4c1704e5)

## 테스트 케이스
→ [테스트 케이스 바로가기](https://docs.google.com/spreadsheets/d/1djYNOycBP0-a5PDg302wS7SK1A8XTu9u7n0CP0yBa0A/edit?gid=353703156#gid=353703156)


  <details>
    <summary>판매 거래 관련 기능</summary>
        <details>
        <summary>1. 판매할 판매 기록 추가</summary>
            <img src="img/test_img/customer_test_img/회원 관리 기능/joinUser.gif" alt="판매기록_gif">
        </details>
        <details>
            <summary>2. 영수증 생성</summary>
            <img src="img/test_img/customer_test_img/회원 관리 기능/login.gif" alt="로그인_gif">
        </details>
        <details>
            <summary>3. 새로 생성된 영수증 ID저장</summary>
            <img src="img/test_img/customer_test_img/회원 관리 기능/findId.gif" alt="아이디찾기_gif">
        </details>
        <details>
            <summary>4. 판매테이블에 영수증ID 반영</summary>
            <img src="img/test_img/customer_test_img/회원 관리 기능/findPassword.gif" alt="임시비밀번호발급_gif">
        </details>
        <details>
            <summary>5. 총 금액 계산</summary>
            <img src="img/test_img/customer_test_img/회원 관리 기능/getUserInfo.gif" alt="회원정보조회_gif">
        </details>
        <details>
            <summary>6. 최근 영수증에 기입된 회원ID와 적용될 포인트 저장</summary>
            <img src="img/test_img/customer_test_img/회원 관리 기능/modifyUserInfo.gif" alt="회원정보수정_gif">
        </details>
        <details>
            <summary>7. 회원 포인트 적립</summary>
            <img src="img/test_img/customer_test_img/회원 관리 기능/getMyWaitingList.gif" alt="전체조회_gif">
        </details>
        <details>
            <summary>8. 회원이 포인트 사용시</summary>
            <img src="img/test_img/customer_test_img/회원 관리 기능/getMyReviewList.gif" alt="리뷰조회_gif">
        </details>
        <details>
            <summary>9. 최종 영수증</summary>
            <img src="img/test_img/customer_test_img/회원 관리 기능/modifyMyReview.gif" alt="리뷰수정_gif">
        </details>
    </details>
    <details>
    <summary>환불처리 관련 기능</summary>
        <details><summary>1.환불 정보 등록</summary>
            <img src="img/test_img/customer_test_img/웨이팅 등록 기능/고객_웨이팅,웨이팅알림등록.gif" alt="웨이팅,알람등록_gif">
        </details>
            <details><summary>2.마지막 삽입된 환불의 상품ID를 저장</summary>
            <img src="img/test_img/customer_test_img/웨이팅 등록 기능/고객_웨이팅입장확정.gif" alt="입장확정_gif">
        </details>
            <details><summary>3.환불시 재고 증가</summary>
            <img src="img/test_img/customer_test_img/웨이팅 등록 기능/고객_웨이팅입장취소.gif" alt="입장취소_gif">
        </details>
            <details><summary>4.영수증 환불반영</summary>
            <img src="img/test_img/customer_test_img/웨이팅 등록 기능/고객_웨이팅입장취소.gif" alt="입장취소_gif">
        </details>
            <details><summary>5.영주증 금액 수정</summary>
            <img src="img/test_img/customer_test_img/웨이팅 등록 기능/고객_웨이팅입장취소.gif" alt="입장취소_gif">
        </details>
            <details><summary>6.환불 완료 영수증</summary>
            <img src="img/test_img/customer_test_img/웨이팅 등록 기능/고객_웨이팅입장취소.gif" alt="입장취소_gif">
        </details>
    </details>
    <details>
    <summary>상품 재고 관련 기능</summary>
        <details><summary>1.상품 입고(재고 수량 추가)</summary>
            <img src="img/test_img/customer_test_img/음식점 검색 기능/고객_음식점이름검색.gif" alt="이름검색_gif">
        </details>
        <details><summary>2.상품 판매(재고 수량 감소)</summary>
            <img src="img/test_img/customer_test_img/음식점 검색 기능/고객_음식점메뉴검색.gif" alt="메뉴검색_gif">
        </details>
        <details><summary>3.불량재고량 수정</summary>
            <img src="img/test_img/customer_test_img/음식점 검색 기능/고객_음식점주소검색.gif" alt="주소검색_gif">
        </details>
        <details><summary>4.신상품 등록</summary>
            <img src="img/test_img/customer_test_img/음식점 검색 기능/고객_음식점태그검색.gif" alt="태그검색_gif">
        </details>
        <details><summary>5.상품ID 검색</summary>
            <img src="img/test_img/customer_test_img/음식점 검색 기능/고객_음식점카테고리검색.gif" alt="카테고리검색_gif">
        </details>
            <details><summary>6.상품명 검색</summary>
        <img src="img/test_img/customer_test_img/음식점 정렬 기능/고객_음식점별점순정렬.gif" alt="별점정렬_gif">
        </details>
        <details><summary>7.키워드 검색</summary>
            <img src="img/test_img/customer_test_img/음식점 정렬 기능/고객_음식점리뷰순정렬.gif" alt="리뷰정렬_gif">
        </details>
    </details>
    <details>
    <summary>직원 관리 관련 기능</summary>
        <details><summary>1.직원 등록</summary>
            <img src="img/test_img/customer_test_img/음식점 상세 조회 기능/음식점 상세 정보 조회.gif" alt="음식점상세정보조회_gif">
        </details>
        <details><summary>2.직원 삭제</summary>
            <img src="img/test_img/customer_test_img/음식점 상세 조회 기능/음식점 메뉴 상세 정보 조회.gif" alt="메뉴상세정보조회_gif">
        </details>
        <details><summary>3.근무자 출근</summary>
            <img src="img/test_img/customer_test_img/음식점 상세 조회 기능/음식점 전체 리뷰 조회.gif" alt="전체리뷰조회_gif">
        </details>
        <details><summary>4.근무자 퇴근</summary>
            <img src="img/test_img/customer_test_img/음식점 상세 조회 기능/음식점 사진 포함 리뷰 조회.gif" alt="사진포함리뷰조회_gif">
        </details>
        <details><summary>5.근무 확인</summary>
            <img src="img/test_img/customer_test_img/음식점 상세 조회 기능/음식점 전체 리뷰 별점 순 정렬.gif" alt="리뷰별점순조회_gif">
        </details>
    </details>
    <details>
    <summary>프로모션 및 할인</summary>
        <details><summary>1.쿠폰</summary>
            <img src="img/test_img/customer_test_img/음식점 리뷰 작성 기능/리뷰 별점 체크.gif" alt="음식점상세정보조회_gif">
        </details>
        <details><summary>2.타임할인</summary>
            <img src="img/test_img/customer_test_img/음식점 리뷰 작성 기능/음식점 입장 유무 체크.gif" alt="음식점상세정보조회_gif">
        </details>
        <details><summary>3.1+1행사</summary>
            <img src="img/test_img/customer_test_img/음식점 리뷰 작성 기능/음식점 리뷰 작성.gif" alt="음식점상세정보조회_gif">
        </details>   
    </details>
     <details>
    <summary>고객 관리</summary>
        <details><summary>1.고객등록</summary>
            <img src="img/test_img/customer_test_img/음식점 리뷰 작성 기능/리뷰 별점 체크.gif" alt="음식점상세정보조회_gif">
        </details>
        <details><summary>2.고객 구매 내역 확인</summary>
            <img src="img/test_img/customer_test_img/음식점 리뷰 작성 기능/음식점 입장 유무 체크.gif" alt="음식점상세정보조회_gif">
        </details>
    </details>
    <details>
    <summary>보고서 및 분석</summary>
        <details><summary>1.판매 데이터 수집</summary>
            <img src="img/test_img/customer_test_img/음식점 리뷰 작성 기능/리뷰 별점 체크.gif" alt="음식점상세정보조회_gif">
        </details>
        <details><summary>2.재고/손익 보고</summary>
            <img src="img/test_img/customer_test_img/음식점 리뷰 작성 기능/음식점 입장 유무 체크.gif" alt="음식점상세정보조회_gif">
        </details>
       <details><summary>2.카테고리별 보고</summary>
            <img src="img/test_img/customer_test_img/음식점 리뷰 작성 기능/음식점 입장 유무 체크.gif" alt="음식점상세정보조회_gif">
        </details>
    </details>







## 회고록

| 조원 이름 | 회고 |
| ------ | --- |
| 이성일 | 아이디어 설계의 구체화 과정의 중요성을 깨달았다 | <br/>
| 권지민 |  | <br/>
| 박서준 | POS기의 결제 프로세스를 이해하고 ERD설계와 데이터 구성, 참조 참조관계설정 등 프로젝트의 초기 구축 단계의 중요성을 깨달았다. | <br/>
| 염정운 | 편의점 POS의 시스템을 mariaDB를 통해 구현 하면서 테이블과 테이블 사이를 어떻게 잇는지와 쿼리문을 짜고 실행하는 기초를 다질 수 있었다. | <br/>
| 오영광 | POS 시스템의 전반적인 프로세스를 이해하고 팀원들과 협업하는 과정에서 소통의 중요성을 느꼈다. 데이터모델링을 하면서 나온 문제를 디버깅하면서 뜻 깊은 시간이었고 너무 잘해준 우리 팀원들 앞으로도 화이팅! | <br/>






