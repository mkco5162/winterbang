# 자동 Git Commit 스크립트
param(
    [string]$message = ""
)

# 커밋 메시지가 없으면 기본 메시지 사용 (현재 시간)
if ($message -eq "") {
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $message = "Auto commit: $timestamp"
}

Write-Host "=== Git 자동 커밋 시작 ===" -ForegroundColor Green

# 변경사항 스테이징
Write-Host "`n1. 변경사항 추가 중..." -ForegroundColor Yellow
git add .

# 스테이징된 파일 확인
$status = git status --short
if ($status) {
    Write-Host "`n변경된 파일:" -ForegroundColor Cyan
    git status --short
    
    # 커밋
    Write-Host "`n2. 커밋 생성 중..." -ForegroundColor Yellow
    git commit -m $message
    
    # 푸시
    Write-Host "`n3. 원격 저장소에 푸시 중..." -ForegroundColor Yellow
    git push
    
    Write-Host "`n=== 완료! ===" -ForegroundColor Green
} else {
    Write-Host "`n변경사항이 없습니다." -ForegroundColor Gray
}
