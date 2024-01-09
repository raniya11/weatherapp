import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/services.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});



  TextEditingController citycontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherServiceProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App test",style: GoogleFonts.aBeeZee(color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            TextFormField(
              controller: citycontroller,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.cyan,width: 2)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan.shade700,width: 2),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  hintText: "City Name",
                  hintStyle: GoogleFonts.aBeeZee(color: Colors.cyan.shade900)
              ),
            ),
            SizedBox(height: 20,),
            if(weatherProvider.isloading)
              CircularProgressIndicator()
            else if(weatherProvider.error!.isNotEmpty)
              Text("${weatherProvider.error}")
            else if(weatherProvider.weather!=null)
                Container(
                  height: 200,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Temp : ${weatherProvider.weather!.main!.temp} °C",style: GoogleFonts.aBeeZee(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.cyan.shade900,),)
                    ],
                  ),
                ),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.cyan.shade900,
                      onPrimary: Colors.white,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                      )
                  ),
                  onPressed: (){
                    weatherProvider.fetchWeatherData(citycontroller.text);
                  },

                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 30),
                    child: Text("Load",style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.bold,),),
                  )),
            )
          ],
        ),
      ),
    );
  }
}