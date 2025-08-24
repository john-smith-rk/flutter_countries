class CountryData{
  final String? nameCommon;
  final String? nameOfficial;
  final String? flagPng;
  final String? flagSvg;
  final String? flagDescription;
  final String? region;
  final String? capital;
  final String? currencyCode;
  final String? currencyName;
  final String? currencySymbol;
  final String? callingCode;
  final List<String>? allCallingCode;
  final String? cca2;
  final String? ccn3;
  final String? cca3;
  final String? cioc;

  CountryData({
     this.nameCommon,
     this.nameOfficial,
     this.flagPng,
     this.flagSvg,
     this.flagDescription,
     this.region,
     this.capital,
     this.currencyCode,
     this.currencyName,
     this.currencySymbol,
     this.callingCode,
     this.allCallingCode,
     this.cca2,
     this.ccn3,
     this.cca3,
     this.cioc
  });

  factory CountryData.fromJson(Map<String, dynamic> json) {
    final currencyKey = json['currencies'] == null || json['currencies'].isEmpty?null:(json['currencies'] as Map<String, dynamic>).keys.first;
    final currency = currencyKey != null?json['currencies'][currencyKey] : null;

    return CountryData(
      nameCommon: json['name'] != null?json['name']['common']:null,
      nameOfficial: json['name'] != null?json['name']['official']:null,
      flagPng: json['flags'] != null?json['flags']['png']:null,
      flagSvg: json['flags'] != null?json['flags']['svg']:null,
      flagDescription: json['flags'] != null?json['flags']['alt']:null,
      region: json['region'],
      capital: json['capital'] != null?((json['capital'] as List).isNotEmpty ? json['capital'][0] : ''):null,
      currencyCode: currencyKey,
      currencyName: currency != null?currency['name']:null,
      currencySymbol: currency != null?currency['symbol']:null,
      callingCode: json['idd'] != null?(json['idd']['root'] + (json['idd']['suffixes'] != null && json['idd']['suffixes'].isNotEmpty ?json['idd']['suffixes'][0]:"")):null,
      allCallingCode : json['idd'] != null?((json['idd']['suffixes'] as List<dynamic>).map((e) => json['idd']['root'].toString() +e.toString()).toList()):null,
      cca2: json['cca2'],
      ccn3 : json['ccn3'],
      cca3: json['cca3'],
      cioc: json['cioc']
    );
  }


}

extension CountryDataExtension on List<CountryData> {

   void sortByName() {
    sort((a, b) => a.nameCommon!.compareTo(b.nameCommon!));
   }

   void sortByOfficialName() {
     sort((a, b) => a.nameOfficial!.compareTo(b.nameOfficial!));
   }

   void sortByCallingCode() {
     sort((a, b) => a.callingCode!.compareTo(b.callingCode!));
   }

   void sortByRegion() {
     sort((a, b) => a.region!.compareTo(b.region!));
   }

   void sortByCurrency() {
     sort((a, b) => a.currencyCode!.compareTo(b.currencyCode!));
   }

   void sortByCapital() {
     sort((a, b) => a.capital!.compareTo(b.capital!));
   }

   void sortByCurrencyName() {
     sort((a, b) => a.currencyName!.compareTo(b.currencyName!));
   }

   void sortByCICO(){
     sort((a, b) => a.cioc!.compareTo(b.cioc!));
   }

}