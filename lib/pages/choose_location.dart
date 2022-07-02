import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(location: 'Dhaka', flag: 'asian_flag/bangladesh.png', url: 'Asia/Dhaka'),

    WorldTime(location: 'Abidjan', flag: 'african_flag/ivory_coast.png', url: 'Africa/Abidjan'),
    WorldTime(location: 'Accra', flag: 'african_flag/ghana.png', url: 'Africa/Accra'),
    WorldTime(location: 'Algiers', flag: 'african_flag/algeria.png', url: 'Africa/Algiers'),
    WorldTime(location: 'Bissau', flag: 'african_flag/guinea_bissau.png', url: 'Africa/Bissau'),
    WorldTime(location: 'Cairo', flag: 'african_flag/egypt.png', url: 'Africa/Cairo'),
    WorldTime(location: 'Casablanca', flag: 'african_flag/morocco.png', url: 'Africa/Casablanca'),
    WorldTime(location: 'Ceuta', flag: 'african_flag/ceuta.png', url: 'Africa/Ceuta'),
    WorldTime(location: 'El Aaiun', flag: 'african_flag/sahara.png', url: 'Africa/El_Aaiun'),
    WorldTime(location: 'Johannesburg', flag: 'african_flag/south_africa.png', url: 'Africa/Johannesburg'),
    WorldTime(location: 'Juba', flag: 'african_flag/sudan.png', url: 'Africa/Juba'),
    WorldTime(location: 'Khartoum', flag: 'african_flag/sudan.png', url: 'Africa/Khartoum'),
    WorldTime(location: 'Lagos', flag: 'african_flag/nigeria.png', url: 'Africa/Lagos'),
    WorldTime(location: 'Maputo', flag: 'african_flag/mozambique.png', url: 'Africa/Maputo'),
    WorldTime(location: 'Monrovia', flag: 'african_flag/liberia.png', url: 'Africa/Monrovia'),
    WorldTime(location: 'Nairobi', flag: 'african_flag/kenya.png', url: 'Africa/Nairobi'),
    WorldTime(location: 'Ndjamena', flag: 'african_flag/chad.png', url: 'Africa/Ndjamena'),
    WorldTime(location: 'Sao Tome', flag: 'african_flag/sao_tome.png', url: 'Africa/Sao_Tome'),
    WorldTime(location: 'Tripoli', flag: 'african_flag/libya.png', url: 'Africa/Tripoli'),
    WorldTime(location: 'Tunis', flag: 'african_flag/tunisia.png', url: 'Africa/Tunis'),
    WorldTime(location: 'Windhoek', flag: 'african_flag/namibia.png', url: 'Africa/Windhoek'),

    WorldTime(location: 'Seoul', flag: 'asian_flag/south_korea.png', url: 'Asia/Seoul'),
    WorldTime(location: 'Doha', flag: 'asian_flag/qatar.png', url: 'Asia/Qatar'),
    WorldTime(location: 'Jakarta', flag: 'asian_flag/indonesia.png', url: 'Asia/Jakarta'),

    WorldTime(location: 'London', flag: 'european_flag/uk.png', url: 'Europe/London'),
    WorldTime(location: 'Berlin', flag: 'european_flag/germany.png', url: 'Europe/Berlin'),
    WorldTime(location: 'Athens', flag: 'european_flag/greece.png', url: 'Europe/Athens'),

    WorldTime(location: 'Chicago', flag: 'american_flag/usa.png', url: 'America/Chicago'),
    WorldTime(location: 'New York', flag: 'american_flag/usa.png', url: 'America/New_York'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();

    //navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            );
          }
      ),
    );
  }
}
