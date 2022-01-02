import 'package:awesome_contact_app/contact_details_view.dart';
import 'package:awesome_contact_app/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  final List<Map<String, String>> data = [
    {
      "name": "Maryam Christensen",
      "phone": "(708) 401-1432",
      "email": "aliquet.metus.urna@protonmail.ca",
      "country": "United States",
      "region": "Akwa Ibom"
    },
    {
      "name": "Conan Newton",
      "phone": "1-245-615-3179",
      "email": "ac.fermentum@outlook.edu",
      "country": "Australia",
      "region": "Xīběi"
    },
    {
      "name": "Aphrodite Landry",
      "phone": "(870) 863-5867",
      "email": "magna@outlook.edu",
      "country": "India",
      "region": "Sachsen"
    },
    {
      "name": "Eugenia Levine",
      "phone": "(775) 735-8020",
      "email": "vitae.semper@hotmail.com",
      "country": "Russian Federation",
      "region": "New Brunswick"
    },
    {
      "name": "Fuller Ray",
      "phone": "1-546-386-4878",
      "email": "nunc@protonmail.ca",
      "country": "Mexico",
      "region": "Minnesota"
    },
    {
      "name": "Quin Crane",
      "phone": "1-500-381-7960",
      "email": "purus@aol.org",
      "country": "Germany",
      "region": "Mecklenburg-Vorpommern"
    },
    {
      "name": "Meredith Craig",
      "phone": "1-618-723-2387",
      "email": "orci.luctus.et@aol.org",
      "country": "Austria",
      "region": "Umbria"
    },
    {
      "name": "Bareina Lindsey",
      "phone": "1-638-212-4639",
      "email": "imperdiet.nec@protonmail.couk",
      "country": "South Korea",
      "region": "Antwerpen"
    },
    {
      "name": "Declan Mcmillan",
      "phone": "(840) 478-8507",
      "email": "interdum.libero@hotmail.net",
      "country": "Germany",
      "region": "Maranhão"
    },
    {
      "name": "Phillip Charles",
      "phone": "(626) 471-2874",
      "email": "justo.eu.arcu@hotmail.org",
      "country": "India",
      "region": "Andalucía"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'My Contacts',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Center(
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/avatar.png'),
              ),
            ),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  hintText: 'Search by name or number',
                  prefixIcon: const Icon(Icons.search)),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          controller: _scrollController,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Recent',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            ListView.separated(
              controller: _scrollController,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ContactDettailsView(
                            contact: Contact(
                                country: ' Ghana',
                                name: 'Nengi Aberenika',
                                phone: '+233 20 15 60 888',
                                email: 'eddynancy@mail.com',
                                region: 'Western Region'));
                      }));
                    },
                    leading: const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/person_1.png'),
                    ),
                    title: const Text(
                      'Nengi Aberenika',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    subtitle: const Text('+233 20 156 0888'),
                    trailing: const IconButton(
                      onPressed: null,
                      icon: Icon(Icons.more_horiz),
                    ));
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  indent: 25,
                  thickness: 2,
                );
              },
              itemCount: 3,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Contacts',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            GroupedListView<Map<String, String>, String>(
              shrinkWrap: true,
              elements: data,
              groupBy: (element) => element['name'].toString().substring(0, 1),
              groupSeparatorBuilder: (String groupByValue) => SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    groupByValue.substring(0, 1),
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
              ),
              itemBuilder: (context, Map<String, String> element) {
                Contact contact = Contact.fromJson(element);
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ContactDettailsView(
                            contact: contact,
                          );
                        }));
                      },
                      leading: const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/person_1.png'),
                      ),
                      title: Text(
                        '${element['name']}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text('${element['phone']}'),
                      trailing: const IconButton(
                        onPressed: null,
                        icon: Icon(Icons.more_horiz),
                      ),
                    ),
                    const Divider(
                      indent: 25,
                      thickness: 2,
                    )
                  ],
                );
              },
              itemComparator: (item1, item2) =>
                  item1['name']!.compareTo(item2['name']!), // optional
              useStickyGroupSeparators: true, // optional
              floatingHeader: true, // optional
              order: GroupedListOrder.ASC, // optional
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff1A4ADA),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
