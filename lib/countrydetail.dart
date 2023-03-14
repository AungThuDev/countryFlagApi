import 'package:cached_network_image/cached_network_image.dart';
import 'package:countryapi/model/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CountryDetail extends StatefulWidget {
  Country country;
  CountryDetail(this.country, {super.key});

  @override
  State<CountryDetail> createState() => _CountryDetailState();
}

class _CountryDetailState extends State<CountryDetail> {
  late String _countryName;
  late String _flag;
  late String _capital;
  late String _region;
  late String _subregion;
  late int _population;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _countryName = widget.country.name;
    _flag = widget.country.alpha2Code;
    _region = widget.country.region;
    _subregion = widget.country.subregion;
    _capital = widget.country.capital;
    _population = widget.country.population;

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Country Detail"),
      ),
      body: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: CachedNetworkImage(imageUrl: 'https://countryflagsapi.com/png/${_flag}',fit: BoxFit.cover,),
          ),
          SizedBox(height: 20,),
          Center(child: Text(_countryName.toUpperCase(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.all(10),
            child: Text("${_countryName} is located in ${_subregion} region. It is one of the country which is located ${_region} continent.The capital city of ${_countryName} is ${_capital}. It has ${_population} of people who lived in ${_countryName}.",
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 18),)),
        ],
      )
    );
  }
}