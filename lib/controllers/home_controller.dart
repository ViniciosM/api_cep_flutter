import 'package:api_flutter/models/address_model.dart';
import 'package:api_flutter/services/api_service.dart';
import 'package:flutter/cupertino.dart';

class HomeController extends ChangeNotifier {
  ApiService apiService = ApiService();

  ValueNotifier<AddressModel?> address = ValueNotifier(null);
  ValueNotifier<bool> isLoading = ValueNotifier(false);

  Future<void> searchAddress({required String cep}) async {
    isLoading.value = true;

    AddressModel? addressModel = await apiService.getAddress(cep: cep);

    if (addressModel != null) {
      address.value = addressModel;
      isLoading.value = false;
      notifyListeners();
    } else {
      address.value = null;
      isLoading.value = false;
      notifyListeners();
    }
  }

  void clear() {
    address.value = null;
    isLoading.value = false;
    notifyListeners();
  }
}
