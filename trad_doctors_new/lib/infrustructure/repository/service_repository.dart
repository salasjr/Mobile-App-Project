import 'package:trad_doctors_new/infrustructure/provider/service_data_provider.dart';

import 'package:trad_doctors_new/domain/service_dto.dart';

abstract class ServiceRepositoryInterface {
  Future<List<Service>> getServiceByID(token, id);
  Future<bool> addService(token, id);
  Future<bool> updateService(token, service);
  Future<bool> deleteService(token, id);
}

class ServiceRepositoryImp implements ServiceRepositoryInterface {
  ServiceApi serviceApi = ServiceApi();
  @override
  Future<List<Service>> getServiceByID(token, id) async {
    try {
      List<Service> services = await serviceApi.getServiceById(token, id);
      return services;
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<bool> addService(token, service) async {
    bool isValid = await serviceApi.addService(token, service);
    return isValid;
  }

  @override
  Future<bool> updateService(token, service) async {
    bool isEditied = await serviceApi.updateService(token, service);
    return isEditied;
  }

  @override
  Future<bool> deleteService(token, id) async {
    bool isDeleted = await serviceApi.deleteService(token, id);
    return isDeleted;
  }
}
