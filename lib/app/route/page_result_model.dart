import '../../core/utils/extensions.dart';

class PageResult {
  dynamic data;
  bool isCreated;
  bool isDeleted;
  bool isUpdated;
  String? toastMsg;
  ToastStyle toastStyle;
  PageResult(
      {this.data,
      this.isDeleted = false,
      this.isCreated = false,
      this.isUpdated = false,
      this.toastMsg,
      this.toastStyle = ToastStyle.SUCCESS});
}
