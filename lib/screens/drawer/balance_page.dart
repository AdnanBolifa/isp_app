import 'package:flutter/material.dart';
import 'package:isp_app/constants.dart';

class BalancePage extends StatelessWidget {
  const BalancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text('Balance & Quota'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildBalanceCard(),
            const SizedBox(height: 24),
            _buildActions(),
            const SizedBox(height: 24),
            _buildTransactionHistory(),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Your Balance',
            style: TextStyle(
              color: AppColors.light,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Current Balance:',
                    style: TextStyle(
                      color: AppColors.light,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    '\$100.00',
                    style: TextStyle(
                      color: AppColors.light,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  // Implement recharge functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.success,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                child: const Text(
                  'Recharge',
                  style: TextStyle(
                    color: AppColors.light,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Actions',
          style: TextStyle(
            color: AppColors.light,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        _buildActionCard(
          icon: Icons.shopping_cart,
          title: 'Buy Quota',
          subtitle: 'Top up your data',
          onPressed: () {
            // Implement buy quota functionality
          },
        ),
        const SizedBox(height: 16),
        _buildActionCard(
          icon: Icons.compare_arrows,
          title: 'Change Quota Plan',
          subtitle: 'Switch to a different plan',
          onPressed: () {
            // Implement change quota plan functionality
          },
        ),
      ],
    );
  }

  Widget _buildActionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: AppColors.secondary,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(icon, size: 36, color: AppColors.light),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: AppColors.light,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: AppColors.light,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, color: AppColors.light),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionHistory() {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Transaction History',
            style: TextStyle(
              color: AppColors.light,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildTransactionItem('Recharge', '+ \$50.00', '2 Jan 2024'),
          const SizedBox(height: 8),
          _buildTransactionItem('Buy Quota', '- \$20.00', '1 Jan 2024'),
          const SizedBox(height: 8),
          _buildTransactionItem('Change Plan', '- \$30.00', '31 Dec 2023'),
        ],
      ),
    );
  }

  Widget _buildTransactionItem(String title, String amount, String date) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(color: AppColors.light, fontSize: 18),
      ),
      subtitle: Text(
        '$amount • $date',
        style: const TextStyle(color: AppColors.light, fontSize: 14),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, color: AppColors.light),
    );
  }
}
