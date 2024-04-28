import 'package:flutter/material.dart';

class BagisPage extends StatelessWidget {
  const BagisPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bağış Yap'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Proje Destekleme',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Proje geliştirmeye devam edebilmemiz ve daha iyi hizmet sunabilmemiz için bağışlarınızı bekliyoruz.',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  // Bağış işlemleri için yönlendirme yapılacak.
                  // Örneğin: Navigator.pushNamed(context, '/donation_process');
                },
                child: const Text('Bağış Yap'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
