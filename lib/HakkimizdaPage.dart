
import 'license_page.dart';

import 'package:flutter/material.dart';

class HakkimizdaPage extends StatelessWidget {
  const HakkimizdaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hakkımızda'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'ModülTespitçi Version 0.1',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            const Divider(),
            const SizedBox(height: 20.0),
            const SizedBox(height: 10.0),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                    'Merhaba! Ben İlkay, bu projenin geliştiricisiyim. Banyo ortamında yaşanan kazaları önlemeye yönelik termal kamera ve mobil uygulama tabanlı bir sistem geliştiriyoruz. Bu projenin amacı, banyo ortamındaki düşme kazalarını anlık olarak tespit ederek hızlı bir şekilde yardım çağrısı yapabilmektir.\n\n'
                    'Projemizin temel fikri, banyo ortamında yaşanan kazaların hızlı bir şekilde fark edilip müdahale edilmesini sağlamaktır. Termal kamera modülü sayesinde banyo ortamındaki kişilerin hareketlerini izleyebilir ve bir düşme durumunda hemen bildirim yapabiliriz. Böylece, kazaların sonuçları minimize edilerek yaralanmaların ve hatta can kayıplarının önüne geçebiliriz.\n\n'
                    'Bu projenin özellikle yaşlı, engelli veya yalnız yaşayan bireyler için büyük önemi bulunmaktadır. Onların güvenliğini sağlamak ve acil durumlarda hızlı müdahale imkanı sunmak amacıyla bu sistemi geliştirmekteyiz. Ayrıca, projemizin açık kaynak kodlu olması, topluluk katılımını teşvik etmekte ve bu alandaki yenilikleri desteklemekte önemli bir rol oynamaktadır.\n\n'
                    'Herkesin projeye katkıda bulunmasını ve geliştirmemize yardımcı olmasını dilerim.\n\n'
                    'Eğer projemize katkıda bulunmak, kullanmak veya herhangi bir geri bildirimde bulunmak isterseniz, lütfen bizimle iletişime geçmekten çekinmeyin. Birlikte daha güvenli bir yaşam alanı oluşturmak için buradayız.',
                      style: TextStyle(fontSize: 14.0),
                      textAlign: TextAlign.center,
                    ),
                    const Divider(),
                    const Text(
                      'Lisans',
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'GNU General Public License (GPL) Version 3',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10.0),
                          const Text(
                            'PsikoAnalizci, A system that offers popular psychological tests that people may want.\n',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          const Text(
                            'Copyright (C) 2023 Ilkay Onay',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          const SizedBox(height: 10.0),
                          const Text(
                            'This program is free software: you can redistribute it and/or modify\n'
                            'it under the terms of the GNU General Public License as published by\n'
                            'the Free Software Foundation, either version 3 of the License, or\n'
                            '(at your option) any later version.\n',
                            style: TextStyle(fontSize: 16.0),
                            textAlign: TextAlign.justify,
                          ),
                          const Text(
                            'This program is distributed in the hope that it will be useful,\n'
                            'but WITHOUT ANY WARRANTY; without even the implied warranty of\n'
                            'MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the\n'
                            'GNU General Public License for more details.\n',
                            style: TextStyle(fontSize: 16.0),
                            textAlign: TextAlign.justify,
                          ),
                          const Text(
                            'You should have received a copy of the GNU General Public License\n'
                            'along with this program. If not, see https://www.gnu.org/licenses/.',
                            style: TextStyle(fontSize: 16.0),
                            textAlign: TextAlign.justify,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const FullLicenseScreen()),
                              );
                            },
                            child: const Text('Learn More'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
