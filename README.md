# Báo cáo Bài 2 (Session 5): Tái cấu trúc lịch sử commit bằng Interactive Rebase

## 1. Tình huống và Mục tiêu
Trên nhánh tính năng hiện tại, tôi đã có 4 commit tạo ra trong quá trình phát triển (bao gồm commit tạo module, sửa lỗi nhỏ, thêm tính năng phụ và 1 file rác dùng để test).
Mục tiêu: Gộp 3 commit liên quan đến auth thành một commit duy nhất có thông điệp rõ ràng, và xóa bỏ (drop) hoàn toàn commit chứa file rác.

## 2. Quá trình cấu hình Interactive Rebase
Tôi sử dụng lệnh rebase tương tác lùi lại 4 bước:
```bash
git rebase -i HEAD~4
```

### Bước 2.1: Cấu hình thao tác
Trong trình soạn thảo cấu hình sequence, danh sách ban đầu là:
```text
pick e163965 feat: khoi tao module auth
pick e262b68 fix typo
pick c3877c3 adds utility functions
pick 62adf30 add temp file for debug
```

Tôi đã chỉnh sửa nội dung thành như sau:
```text
pick e163965 feat: khoi tao module auth
squash e262b68 fix typo
squash c3877c3 adds utility functions
drop 62adf30 add temp file for debug
```
- `squash`: gộp mã nguồn của commit này vào commit ngay phía trên nó.
- `drop`: xóa bỏ hoàn toàn commit (cả lịch sử lẫn thay đổi file).

### Bước 2.2: Sửa đổi thông điệp (Reword)
Sau khi lưu và đóng file cấu hình, Git mở tiếp một trình soạn thảo để chốt lại thông điệp cho khối commit vừa gộp. Tôi đã thay thế nội dung thành thông điệp chuẩn xác:
```text
feat: hoan thien module authentication
```

## 3. Kết quả kiểm tra
Lịch sử đã được tái cấu trúc thành công. Lệnh `git log --oneline` trả về:
```text
c507194 feat: hoan thien module authentication
ffc32de Initial commit
```
Lịch sử giờ đây hoàn toàn sạch sẽ. Các commit rác và vụn vặt đã bị loại bỏ, chỉ để lại duy nhất một commit đại diện cho toàn bộ tính năng và file `temp.txt` cũng không còn tồn tại trên nhánh.
