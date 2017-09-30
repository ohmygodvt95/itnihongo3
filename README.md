# 日本語のIT: 空チーム

### テーマ
-「旅行の場所」のレビューサイト

### メンバー
- Le Vinh Thien (20133740) GL
- Nguyen Thuy Trang (20134072) SL
- Do Duc Quyen (20133187)
- Nguyen Trung Kien (20132150)
- Duong Cong Nguyen (20132812)

### Hướng dẫn sử dụng
- B1: Fork repository gốc về tài khoản của mình, link gốc: `https://github.com/ohmygodvt95/itnihongo3.git`
. Sau khi fork về repository của bạn sẽ có dạng: `https://github.com/[yourusername]/itnihongo3.git`
- B2: Clone repository từ tài khoản của bạn `https://github.com/[yourusername]/itnihongo3.git` về máy bằng lệnh
`git clone https://github.com/[yourusername]/itnihongo3.git`.
- B3: Chạy lệnh: `bundle` để tải các thư viện cần thiết
- B4: Copy file `config/database.yml.example` đổi tên file mới thành `config/database.yml` làm tương tự với file `config/secrets.yml.example`.(giữ nguyên file có đuôi .example)
- B5: Chạy các lệnh cần thiết nếu có database: `rails db:create`, `rails db:migrate`, `rails db:seed`
- B6: Chạy lệnh `rails s` và vào `http://localhost:3000` xem kết quả.

### Flow làm việc với git
- Sau khi clone bạn luôn luôn có branch master là branch chính, tuyệt đối không sửa code hay làm bất kỳ điều gì lên branch này
- B1: Thêm remote tới branch gốc `git remote add itnihongo3 https://github.com/ohmygodvt95/itnihongo3.git`
- B2: Khi bắt đầu làm tính năng nào đó thì checkout từ nhánh master và bắt đầu code `git checkout -b name_of_branch`
- B3: Sau khi code xong thì push lên repo của chính mình: `git push origin name_of_branch`
- B4: Gửi pull request tới branch gốc để review, đợi merge
- B5: Khi được merge, or cần cập nhật thay đổi master thì checkout qua master và chạy `git pull itnihongo3 master`
- Ngoài ra còn có rebase, ... cần gì liên hệ [Facebook](http://fb.com/ohmygodvt95)

### 9/2017
