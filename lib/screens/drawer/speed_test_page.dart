import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:math';
import 'dart:async';
import 'package:isp_app/constants.dart';

class SpeedTestPage extends StatefulWidget {
  const SpeedTestPage({super.key});

  @override
  SpeedTestPageState createState() => SpeedTestPageState();
}

class SpeedTestPageState extends State<SpeedTestPage> {
  double downloadSpeed = 0;
  double uploadSpeed = 0;
  int ping = 0;
  bool isTesting = false;

  Future<void> startSpeedTest() async {
    setState(() {
      isTesting = true;
      downloadSpeed = 0;
      uploadSpeed = 0;
      ping = 0;
    });

    final double newDownloadSpeed = await _testDownloadSpeed();
    final double newUploadSpeed = await _testUploadSpeed();
    final int newPing = await _testPing();

    setState(() {
      downloadSpeed = newDownloadSpeed;
      uploadSpeed = newUploadSpeed;
      ping = newPing;
      isTesting = false;
    });
  }

  Future<double> _testDownloadSpeed() async {
    final url = Uri.parse('https://speed.hetzner.de/100MB.bin');
    final stopwatch = Stopwatch()..start();
    final response = await http.get(url);
    stopwatch.stop();

    if (response.statusCode == 200) {
      final bytesPerSecond =
          response.contentLength! / (stopwatch.elapsedMilliseconds / 1000);
      return (bytesPerSecond * 8) / 1e6; // Convert to Mbps
    } else {
      throw Exception('Failed to download file');
    }
  }

  Future<double> _testUploadSpeed() async {
    final url = Uri.parse('https://postman-echo.com/post');
    final data = List<int>.generate(
        5 * 1024 * 1024, (_) => Random().nextInt(256)); // 5 MB of random data
    final stopwatch = Stopwatch()..start();
    final response = await http.post(url, body: data);
    stopwatch.stop();

    if (response.statusCode == 200) {
      final bytesPerSecond =
          data.length / (stopwatch.elapsedMilliseconds / 1000);
      return (bytesPerSecond * 8) / 1e6; // Convert to Mbps
    } else {
      throw Exception('Failed to upload file');
    }
  }

  Future<int> _testPing() async {
    final url = Uri.parse('https://google.com');
    final stopwatch = Stopwatch()..start();
    final response = await http.get(url);
    stopwatch.stop();

    if (response.statusCode == 200) {
      return stopwatch.elapsedMilliseconds;
    } else {
      throw Exception('Failed to ping server');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        title: const Text('Speed Test'),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(),
            const SizedBox(height: 24),
            _buildGauge(),
            const SizedBox(height: 24),
            _buildResults(),
            const SizedBox(height: 24),
            _buildStartButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Center(
      child: Column(
        children: [
          Text(
            'Internet Speed Test',
            style: TextStyle(
              color: AppColors.light,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Measure your internet speed in real-time',
            style: TextStyle(
              color: AppColors.secondary,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGauge() {
    return Center(
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.secondary.withOpacity(0.2),
        ),
        child: Center(
          child: Text(
            isTesting
                ? 'Testing...'
                : '${downloadSpeed.toStringAsFixed(1)} Mbps',
            style: const TextStyle(
              color: AppColors.light,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResults() {
    return Column(
      children: [
        _buildResultRow('Download', '${downloadSpeed.toStringAsFixed(1)} Mbps'),
        const SizedBox(height: 8),
        _buildResultRow('Upload', '${uploadSpeed.toStringAsFixed(1)} Mbps'),
        const SizedBox(height: 8),
        _buildResultRow('Ping', '$ping ms'),
      ],
    );
  }

  Widget _buildResultRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.light,
            fontSize: 18,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: AppColors.light,
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Widget _buildStartButton() {
    return Center(
      child: ElevatedButton(
        onPressed: isTesting ? null : startSpeedTest,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          backgroundColor: AppColors.success,
        ),
        child: const Text(
          'Start Test',
          style: TextStyle(
            color: AppColors.light,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
