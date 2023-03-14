import 'package:cached_network_image/cached_network_image.dart';
import 'package:countryapi/countrydetail.dart';

import 'package:countryapi/model/country.dart';
import 'package:countryapi/services/countryservice.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Country> _countries = [];
  bool _isLoading = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isLoading = true;
    fetchCountry();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Country API"),
        actions: [
          IconButton(onPressed: ()
          {

          }, icon: Icon(Icons.search))
        ],
      ),
      body: 
      Stack(
        children: [
          ListView.builder(
            itemCount: _countries.length,
            itemBuilder: (context,index){
              final country = _countries[index];
              return 
              
                 GestureDetector(
                  onTap: () {
                    showCountryDetail(context,_countries[index]);
                  },
                   child: Card(
                    child: ListTile(
                      leading: CachedNetworkImage(imageUrl: 'https://countryflagsapi.com/png/${country.alpha2Code}',
                      width: 100,
                      height: 80,
                      placeholder: (context, url) => CircularProgressIndicator(),
                      ),
                      title: Text(country.name),
                      subtitle: Text(country.region),
                    ),
                                 
                               ),
                 );
          }),
          if(_isLoading) 
          Container(child: Center(child: CircularProgressIndicator(),))
        ],
      ),
    );
  }

  fetchCountry()
  {
    var responseFuture = CountryService.shared.fetchCountry();
    responseFuture.then((countries){
      setState(() {
        _isLoading = false;
        _countries.addAll(countries);
      });
    });
  }

  showCountryDetail(BuildContext context,Country country) async
  {
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return CountryDetail(country);
    }));
  }
}