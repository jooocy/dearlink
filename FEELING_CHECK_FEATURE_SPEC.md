# 하루에 한번 기분(감정) 확인 기능 명세서

## 📋 기능 개요
사용자가 하루에 한 번 자신의 감정 상태를 선택하고 기록할 수 있는 기능입니다. 질문 답변 시 감정 상태에 따라 다른 플로우를 제공하며, 메인 페이지 캐릭터를 통해 감정 확인 및 작성이 가능합니다.

## 🎯 주요 기능

### 1. 감정 선택 화면 (`select_question`과 동일한 UI)
- **선택지**: 12개 고정 감정 옵션
  - 멍함, 편안, 설렘, 좋아, 평범, 행복, 우울, 불안, 뿌듯, 속상, 화남, 지루
- **선택 방식**: 라디오 버튼으로 1개만 선택 가능
- **UI 구성**: 4행 3열 그리드 레이아웃
- **상태 관리**: 선택 전/후 시각적 피드백 제공

### 2. 하루에 한번 작성 제한
- **일일 제한**: 사용자당 하루에 1회만 감정 선택 가능
- **시간 기준**: UTC 기준 00:00:00 ~ 23:59:59
- **중복 방지**: 같은 날 재선택 시 경고 메시지 표시

### 3. 질문 답변 플로우 통합
- **조건부 라우팅**: 
  - 오늘 감정 미선택 시 → 감정 선택 페이지로 이동
  - 오늘 감정 선택 완료 시 → 기존 답변 페이지로 이동
- **상태 확인**: 질문 답변 전 감정 상태 체크

### 4. 메인 페이지 캐릭터 연동
- **캐릭터 클릭**: 감정 확인/작성 페이지로 이동
- **시각적 피드백**: 선택한 감정에 따른 캐릭터 표정/색상 변화
- **상태 표시**: 오늘 감정 선택 여부를 캐릭터로 표현

## 🗄️ 데이터베이스 설계

### 테이블: `daily_feelings`
```sql
CREATE TABLE daily_feelings (
    id VARCHAR(36) PRIMARY KEY,
    user_id VARCHAR(36) NOT NULL,
    link_id VARCHAR(36) NOT NULL,
    feeling VARCHAR(20) NOT NULL,
    selected_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    UNIQUE KEY unique_user_date (user_id, selected_date),
    INDEX idx_user_date (user_id, selected_date),
    INDEX idx_link_date (link_id, selected_date),
    
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (link_id) REFERENCES links(id)
);
```

### 감정 옵션 상수
```javascript
const FEELING_OPTIONS = [
    '멍함', '편안', '설렘', '좋아', '평범', '행복',
    '우울', '불안', '뿌듯', '속상', '화남', '지루'
];
```

## 🔌 API 명세

### 1. 오늘 감정 상태 확인
```
GET /api/feelings/today/{userId}
```
**Response:**
```json
{
    "success": true,
    "data": {
        "hasSelectedToday": boolean,
        "feeling": string | null,
        "selectedAt": timestamp | null
    }
}
```

### 2. 감정 선택 저장
```
POST /api/feelings/select
```
**Request Body:**
```json
{
    "userId": "string",
    "linkId": "string", 
    "feeling": "string"
}
```
**Response:**
```json
{
    "success": true,
    "data": {
        "id": "string",
        "feeling": "string",
        "selectedDate": "YYYY-MM-DD"
    }
}
```

### 3. 감정 목록 조회 (선택지)
```
GET /api/feelings/options
```
**Response:**
```json
{
    "success": true,
    "data": {
        "options": ["멍함", "편안", "설렘", ...]
    }
}
```

### 4. 링크별 오늘 감정 상태
```
GET /api/feelings/link/{linkId}/today
```
**Response:**
```json
{
    "success": true,
    "data": {
        "members": [
            {
                "userId": "string",
                "userName": "string",
                "hasSelectedToday": boolean,
                "feeling": string | null,
                "profileImageUrl": string
            }
        ]
    }
}
```

## 📱 프론트엔드 구현

### 1. 감정 선택 페이지 (`FeelingSelectPageWidget`)
```dart
class FeelingSelectPageWidget extends StatefulWidget {
    // 12개 감정 옵션을 4x3 그리드로 표시
    // 라디오 버튼으로 단일 선택
    // 선택 후 완료 버튼 활성화
}
```

### 2. 라우팅 로직 수정
```dart
// 질문 답변 시 감정 상태 확인
Future<void> checkFeelingAndRoute() async {
    final feelingStatus = await FeelingAPI.checkTodayFeeling();
    
    if (!feelingStatus.hasSelectedToday) {
        // 감정 선택 페이지로 이동
        context.pushNamed(FeelingSelectPageWidget.routeName);
    } else {
        // 기존 답변 페이지로 이동
        context.pushNamed(QAnswerPageWidget.routeName);
    }
}
```

### 3. 메인 페이지 캐릭터 연동
```dart
// 캐릭터 클릭 시 감정 페이지로 이동
InkWell(
    onTap: () {
        context.pushNamed(FeelingSelectPageWidget.routeName);
    },
    child: FeelingCharacterWidget(
        todayFeeling: userTodayFeeling,
        onFeelingChanged: (feeling) {
            setState(() {
                userTodayFeeling = feeling;
            });
        }
    ),
)
```

## 🔄 사용자 플로우

### 플로우 1: 질문 답변 시 감정 체크
1. 사용자가 질문 클릭
2. 오늘 감정 선택 여부 확인
3. 미선택 시 → 감정 선택 페이지
4. 선택 완료 시 → 기존 답변 페이지

### 플로우 2: 메인 페이지에서 직접 감정 선택
1. 메인 페이지 캐릭터 클릭
2. 감정 선택 페이지 이동
3. 감정 선택 및 저장
4. 메인 페이지로 복귀 (캐릭터 상태 업데이트)

### 플로우 3: 중복 선택 방지
1. 사용자가 감정 재선택 시도
2. "오늘 이미 감정을 선택하셨습니다" 메시지 표시
3. 기존 선택된 감정 표시 또는 선택 불가 처리

## 🎨 UI/UX 요구사항

### 감정 선택 페이지
- **레이아웃**: 4행 3열 그리드
- **각 옵션**: 둥근 모서리 박스 + 라디오 버튼 + 텍스트
- **선택 상태**: 파란색 체크마크 + 배경색 변경
- **완료 버튼**: 선택 전 비활성화, 선택 후 활성화

### 메인 페이지 캐릭터
- **기본 상태**: 중립적 표정
- **감정 반영**: 선택한 감정에 따른 표정/색상 변화
- **상태 표시**: 오늘 감정 선택 여부를 시각적으로 표현

## 🧪 테스트 시나리오

### 기능 테스트
1. ✅ 감정 선택 페이지 정상 표시
2. ✅ 12개 감정 옵션 모두 표시
3. ✅ 단일 선택만 가능 (라디오 버튼)
4. ✅ 선택 후 완료 버튼 활성화
5. ✅ 하루 1회 제한 동작
6. ✅ 중복 선택 방지
7. ✅ 질문 답변 시 조건부 라우팅
8. ✅ 메인 페이지 캐릭터 연동

### 에러 처리 테스트
1. ✅ 네트워크 오류 시 재시도 옵션
2. ✅ 서버 오류 시 사용자 친화적 메시지
3. ✅ 잘못된 감정 값 전송 시 검증
4. ✅ 타임존 처리 (UTC 기준 날짜)

## 📅 개발 일정

### Phase 1: 백엔드 API 개발 (2일)
- [ ] 데이터베이스 스키마 생성
- [ ] 감정 상태 확인 API
- [ ] 감정 선택 저장 API
- [ ] 링크별 감정 상태 API

### Phase 2: 프론트엔드 UI 개발 (3일)
- [ ] 감정 선택 페이지 구현
- [ ] 라우팅 로직 수정
- [ ] 메인 페이지 캐릭터 연동
- [ ] 상태 관리 구현

### Phase 3: 통합 테스트 (1일)
- [ ] 전체 플로우 테스트
- [ ] 에러 처리 테스트
- [ ] UI/UX 검증

## 🔧 기술 스택

### 백엔드
- **Database**: MySQL/PostgreSQL
- **API**: RESTful API
- **Validation**: Joi/Yup
- **Date Handling**: moment.js/dayjs

### 프론트엔드
- **Framework**: Flutter
- **State Management**: Provider/Riverpod
- **API Client**: Dio/HTTP
- **Date Handling**: intl package

---

*이 명세서는 하루에 한번 기분(감정) 확인 기능의 전체적인 구현 방향을 제시합니다. 실제 구현 시 세부 사항은 프로젝트 요구사항에 따라 조정될 수 있습니다.*
