# Mô tả sơ qua về Flutter Final

1. Tính năng
  - Màn hình hiển thị danh sách item
  - Chức năng thêm, sửa, xóa, tìm kiếm item
  - Đánh dấu item được quan tâm

2. Công nghệ
  - Dữ liệu được lưu trữ local đến khi người dùng xóa app thông qua **shared_preferences**
  - Chức năng Realtime Preview ở màn add và edit cho phép người dùng xem trực quan về những thay đổi khi nhập

## Yêu cầu

Trước khi bắt đầu, hãy đáp ứng các yêu cầu sau:

- Cài đặt [Flutter](https://flutter.dev/docs/get-started/install) SDK.
- Thiết lập IDE cho việc code như [Android Studio](https://developer.android.com/studio) hoặc [Visual Studio Code](https://code.visualstudio.com/).
- Có một thiết bị kết nối hoặc một trình giả lập được thiết lập, ở đây thường là Emulator của android.
- Run `flutter doctor` để đảm bảo chắc chắn các thiết lập đã sẵn sàng

## Cài đặt

Để cài đặt và chạy dự án này, hãy làm theo các bước sau:

1. **Clone repository**:
    ```bash
    git clone https://github.com/Ha-Quyen/flutter_final.git
    cd flutter_final
    ```

2. **Upgrading nếu cần**:
    ```bash
    flutter upgrade
    ```

3. **Lấy các dependencies**:
    ```bash
    flutter pub get
    ```

4. **Upgrading các dependencies nếu cần**:
    ```bash
    flutter pub upgrade
    ```

## Chạy ứng dụng

1. **Clean nếu cần**:
    ```bash
    flutter clean
    ```
    
2. **RUN***:
    ```bash
    flutter run
    ```

3. **RUN với 1 thiết bị cụ thể***:
    ```bash
    flutter run -d <device_id>
    ```
