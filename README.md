# Final Project
## Food Social App
## 필수 구현 기능
1. 특정 뷰에 구글 맵 띄우기 - OK
2. 복수의 Annotation Mark를 설정하기 - (예정)
3. Annotation Mark 를 Custom 구현
	1) 타이틀 구현 - OK
	2) 터치했을 때, 그림이 추가가 가능한지 검토
	3) 터치했을 때, 상세 설명 페이지로 이동
	4) 터치했을 때, 하단에 스크롤 뷰 구현(심화? 선택..)

### 2017.11.26일 작성
* 구글 맵에 대한 전반적인 내용 학습
* 구글 SDK 관련한 API 문서 확인


### 2017.11.27일 작성
* 구글맵적용시, 전체 view에는 일괄적용되는 것을 확인하였으나, 개별 선언한 객체에 대해서는 적용되지 않는 이슈 발견
* 구글 검색 결과, IBoutlet 선언할 시, 클래스 명을 GMSMapView 로 선언 후, 작업할 것을 추천
* GMSMapView 클래스를 상속 받는 변수를 만들고, 구글 맵 라이브러리에 적용되는 위도/경도와, 특정 뷰의 위도 경도를 같이 맞추는 것으로 문제 해결
* Current Location 기능 구현함
* FireBase에서 더미데이터를 만든 후, 해당 데이터를 이용하여 중복 Marker를 생성(예정)

### 2017.11.28일 작성
* Firebase를 활용하여, 위도 / 경도 Data를 저장함
* Firebase를 활용하여, 저장된 Data 를 가져옴
* 다중 Marker를 적용하기 위한 DataModel을 작성
* Reload시, 다중 Marker적용 확인
* 현재 작성된 코드는 다음날 리팩토링을 통해 수정 예정임


### 2017.11.29일 작성
* 작성한 코드를 조금더 알기 쉽게 리팩토링 진행
* 샘플 메서드들을 활용하여, 다음주 메인 프로젝트에 적용할 예정
* Google Map에서 현재 보여지는 지도 기준, 각 사각의 끝점의 위도/경도를 확인하는 작업진행
* 각 작성한 코드에 주석 작업 진행 중

### 2017.12.04일 작성
* Main PJ에 콜라보 등록 및 지난주 정리한 파일 Commit & PR 요청
* Collection View Sample 코드 구현 및 기초적인 작업 진행중
* CollectionView의 CustomCell 구현을 위한 학습 진행중
* 금주중, Main 화면에 표시될 필수 Layout 에 대하여 구현 예정

### 2017.12.05일 작성
* CollectionView의 기본적인 구조 작성 및 샘플 코드 테스트
* CollectionView를 선택하였을때, Navigation구조에 따라 Push되도록 설정
* 기본적인 DataModel이 구현되면, 코드 리팩토링을 통해 개선 예정
* CustomItem Cell을 작성하여, 원하는 Label을 DetailView에 표기

### 2017.12.06일 작성
* Firebase에 입력할 DataTree구조 작성
* Firebase에 기본적인 자료를 입력하고, 해당 Data를 조회하는 작업을 진행 할 예정
* Firebase에서 사진을 Storage에 저장하여 참조파일을 DataTree에 넣는 방법 학습중


### 2017.12.07일 작성
* 장소검색에 사용할, GooglePlacePicker기본 기능 구현
* 처음 진행시 Custom UI구현에 어려움이 있었지만, GooglePlacePicker내 다른 delegate를 사용하여, 구현 함
* 현재 프로젝트 색에 맞게, UINavigation Bar에 대한 Custom UI 구현 완료
* Collection View에 Upload될 데이터에 대하여 Firebase에 어떻게 올릴지 학슴중


### 2017.12.11일 작성
* GooglePlacePicker를 활용하여, 실제 검색하고자 하는 장소에 GoogleMarker표기
* Firebase / Network에 대하여 계속해서 학습중
* 지난주부터, 샘플 코드 및 작성 코드를 실제 PJ에 적용하여, Commit 하고 있음
* 다른 팀원이 작성한 코드에 대한 리뷰 및 분석현황에 대하여, 해당 Repository에 정리 할 예정임

### 2017.12.12일 작성
* GoogleMap PlacePicker에 필요한 파일들을 병합
* Map에 필요한 내용 추가 및 다른 ViewController에 연결 예정