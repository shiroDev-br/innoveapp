import 'dart:convert';

import 'package:app_innove/components/contracts_componentss/contract_card.dart';
import 'package:app_innove/utils/cache.dart';
import 'package:flutter/material.dart';
import 'package:app_innove/components/general_components/bottom_appbar.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class ContractsPage extends StatefulWidget {
  const ContractsPage({super.key});

  @override
  State<ContractsPage> createState() => _ContractsPageState();
}

class _ContractsPageState extends State<ContractsPage> {
  List<dynamic> adhesions = [];
  DateTime? initialDate;
  DateTime? finalDate;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    checkLogin(context);
    getAdhesions(context);
  }

  Future<void> getAdhesions(BuildContext context) async {
    final tokenData = await fetchData('token');
    final response = await http.get(
      Uri.parse(
        "https://innoveappapi-production.up.railway.app/adhesion/visualize-all?page=1&size=10",
      ),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': "Bearer ${tokenData?['access_token']}",
      },
    );

    if (!context.mounted) return;
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        adhesions = data['items'];

        isLoading = false;
      });
    } else if (response.statusCode == 401) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Login Inválido. Entre na sua conta novamente.',
            style: TextStyle(color: Colors.white),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          backgroundColor: Colors.redAccent,
          duration: const Duration(milliseconds: 1500),
        ),
      );
      deleteFile('token');
      Navigator.of(context).pushReplacementNamed('/');
    } else {
      isLoading = false;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Houve um erro ao buscar seus contratos.',
            style: TextStyle(color: Colors.white),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          backgroundColor: Colors.redAccent,
          duration: const Duration(milliseconds: 1500),
        ),
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child:
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : adhesions.isEmpty
                ? const Center(
                  child: Text(
                    'Nenhum contrato encontrado.',
                    style: TextStyle(color: Colors.white),
                  ),
                )
                : SingleChildScrollView(
                  child: Column(
                    children:
                        adhesions.map((adhesion) {
                          return Column(
                            children: [
                              SizedBox(height: 60),
                              ContractCard(
                                contractNumber:
                                    'Contrato Nº ${adhesion['identifier'] ?? 'N/A'}',
                                description:
                                    '${DateFormat("dd/MM/yyyy").format(DateTime.parse(adhesion['initial_date']))} - ${DateFormat("dd/MM/yyyy").format(DateTime.parse(adhesion['final_date']))}',
                                color: Colors.red.shade400,
                                onPressed: () {
                                  launchUrl(
                                    Uri.parse(
                                      "https://innoveconsorcios.up.railway.app/visualize-adhesion/${adhesion['id']}",
                                    ),
                                    mode: LaunchMode.externalApplication,
                                  );
                                },
                                conctractualPhase:
                                    adhesion['adhesion_progress'] ?? '',
                              ),
                              const SizedBox(height: 20),
                            ],
                          );
                        }).toList(),
                  ),
                ),
      ),
      bottomNavigationBar: BottomAppBarComponentized(),
    );
  }
}
