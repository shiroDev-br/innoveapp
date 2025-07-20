import 'package:flutter/material.dart';
import 'package:app_innove/components/elevatedButton.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';

class ContractCard extends StatelessWidget {
  final String contractNumber;
  final String description;
  final Color color;
  final VoidCallback onPressed;

  final String conctractualPhase;

  const ContractCard({
    super.key,
    required this.contractNumber,
    required this.description,
    required this.color,
    required this.onPressed,
    required this.conctractualPhase,
  });

  Widget _buildPhaseIcon(IconData icon, String phaseName) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 20,
            color: conctractualPhase == phaseName ? Colors.green : Colors.grey,
          ),
          const SizedBox(height: 4),
          Text(
            phaseName,
            style: const TextStyle(fontSize: 8, color: Colors.white),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            contractNumber,
            style: TextStyle(
              color: Colors.grey[300],
              fontSize: 17,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(
              color: Colors.grey[300],
              fontSize: 12,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Fase do Contrato",
            style: TextStyle(
              color: Colors.grey[300],
              fontSize: 12,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 2),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildPhaseIcon(Boxicons.bx_home, "Proposta"),
                _buildPhaseIcon(Boxicons.bx_message_square_edit, "Documentos"),
                _buildPhaseIcon(Boxicons.bx_file, "Contrato"),
                _buildPhaseIcon(Boxicons.bx_search_alt, "Assembleia"),
                _buildPhaseIcon(Boxicons.bx_check_circle, "Contemplação"),
                _buildPhaseIcon(Boxicons.bx_search, "Análise de Documentos"),
                _buildPhaseIcon(Boxicons.bx_news, "Vistoria"),
                _buildPhaseIcon(Boxicons.bx_key, "Faturamento"),
                _buildPhaseIcon(Boxicons.bx_building_house, "Posse do Bem"),
              ],
            ),
          ),
          const SizedBox(height: 8),
          ElevatedButtonComponentized(
            textButton: const Text(
              'Ver mais',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            onpressed: onPressed,
            backgroundColor: Colors.red.shade900,
          ),
        ],
      ),
    );
  }
}
