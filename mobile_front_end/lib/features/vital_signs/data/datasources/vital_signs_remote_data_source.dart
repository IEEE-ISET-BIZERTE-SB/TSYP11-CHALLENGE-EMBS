import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobile_front_end/features/vital_signs/data/models/vital_signs_model.dart';

abstract class VitalSignsRemoteDataSource {
  Stream<List<VitalSignsModel>> getAllVitalSignsByPatient(String patientId);
}


class VitalSignsRemoteDataSourceImpl implements VitalSignsRemoteDataSource {
final CollectionReference vitalSignsCollection;

  VitalSignsRemoteDataSourceImpl({required this.vitalSignsCollection});
  
  @override
 Stream<List<VitalSignsModel>> getAllVitalSignsByPatient(String patientId) {
  return vitalSignsCollection
      .where("patientId", isEqualTo: patientId)
      .orderBy("created", descending: true)
      .snapshots()
      .map((snapshot) {
          return snapshot.docs.map(
            (doc) {
              final data = doc.data() as Map<String, dynamic>;
              data['id'] = doc.id;
              return VitalSignsModel.fromJson(data);
            },
          ).toList();
      });
}


}