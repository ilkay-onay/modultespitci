import 'package:flutter/material.dart';

class YardimPage extends StatelessWidget {
  const YardimPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yardım'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Hoş Geldiniz!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'ModülTespitçi uygulamasının yardım sayfasına hoş geldiniz. Bu sayfa, uygulamanın temel özellikleri ve kullanımı hakkında size bilgi vermek için tasarlanmıştır.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Anasayfada Yapabilecekleriniz:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '1. Raspberry Pi Bağlantı Durumunu Kontrol Etme:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Anasayfada Raspberry Pi cihazıyla bağlantı durumunu kontrol edebilirsiniz. Bağlantı sağlanmışsa, yeşil renkte bir Raspberry Pi simgesi görüntülenir.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '2. Alarmı Etkinleştirme veya Devre Dışı Bırakma:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Anasayfada alarmı etkinleştirebilir veya devre dışı bırakabilirsiniz. Alarm etkinleştirildiğinde, yeşil renkte "Alarm Çalışıyor" yazısı görüntülenir.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '3. Fotoğraf Çekme:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Anasayfada yer alan "Fotoğraf Çek" düğmesine tıklayarak, fotoğraf çekebilir ve görüntüyü görebilirsiniz. Bu görüntü, cihaz tarafından algılanan son görüntüyü gösterir.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Sorularınız mı var?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Uygulama ile ilgili herhangi bir sorunuz veya öneriniz varsa, lütfen bize ulaşın: destek@modultespitci.com',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

