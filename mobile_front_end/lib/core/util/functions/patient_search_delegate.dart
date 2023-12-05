import 'package:flutter/material.dart';
import 'package:mobile_front_end/features/patients/domain/entities/patient.dart';
import 'package:mobile_front_end/features/patients/presentation/pages/patient_detail_page.dart';

class PatientSearchDelegate extends SearchDelegate<String> {
  final List<Patient> patients;

  PatientSearchDelegate({required this.patients});

  @override
  String get searchFieldLabel => 'Search by Matricule';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults(context);
  }

  Widget _buildSearchResults(BuildContext context) {
    final List<Patient> results = patients
        .where((patient) => patient.matricule.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.separated(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('${results[index].firstName} ${results[index].lastName}'),
          subtitle: Text('Matricule: ${results[index].matricule}'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PatientDetailPage(patient: results[index]),
              ),
            );
          },
        );
      },
      separatorBuilder: (context, index) => Divider(thickness: 2),
    );
  }
}
