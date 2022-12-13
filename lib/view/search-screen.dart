import 'package:dailymed_search/controllers/daily-med-provider.dart';
import 'package:dailymed_search/models/daily-med-model.dart';
import 'package:dailymed_search/services/api-service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  DailyMedController? dailyMedController;
  @override
  void initState() {
    init();
    // TODO: implement initState
    super.initState();
  }

  init() async {
    dailyMedController = Provider.of<DailyMedController>(context,listen: false);
    await ApiService().fetchMedList(context);
    dailyMedController!.loading = false;
    setState(() {

    });
    // dailyMedController!.loading = false;
    // dailyMedController!.searchList.forEach((element) {
    //   search.add(element.name!);
    //   setState(() {
    //   });
    // });
    // print("awaited list on init state is ${search}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily med"),
      ),
      body: dailyMedController!.loading == true ? Center(child: CircularProgressIndicator(),)  : Consumer<DailyMedController>(
        builder: (ctx, dailyMed, child) => Padding(
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
          child: Autocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == '') {
                return const Iterable<String>.empty();
              }
              return dailyMed.searchFiles.where((String option) {
                print("options names are ${option}");
                return option.contains(textEditingValue.text.toString());
              });
            },
            onSelected: (String selection) {
              debugPrint('You just selected $selection');
            },
            fieldViewBuilder: (BuildContext context, TextEditingController textEditingController,
                FocusNode focusNode,
                VoidCallback onFieldSubmitted) {
              return TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(12),topRight: Radius.circular(12))
                    ),
                  hintText: 'Search here',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon:textEditingController.text.isNotEmpty ? GestureDetector(
                      onTap: (){
                        textEditingController.clear();
                        setState(() {

                        });
                      },
                      child: Icon(Icons.close)) : null
                ),
                onChanged: (val){
                  setState(() {

                  });
                },
                controller: textEditingController,
                focusNode: focusNode,
                onSubmitted: (String value) {

                },
              );
            },
            optionsViewBuilder: (BuildContext context, void Function(String) onSelected,
                Iterable<String> options){
              return Material(
                  child:SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(right: 40),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
                          border: Border.all(color: Colors.blue)
                        ),
                        child: Column(
                          children: options.map((opt){
                            return InkWell(
                                onTap: (){
                                  onSelected(opt);
                                },
                                child:Container(
                                    // padding: EdgeInsets.only(right:60),
                                    child:Card(
                                        child: Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.all(10),
                                          child:Text(opt),
                                        )
                                    )
                                )
                            );
                          }).toList(),
                        ),
                      )
                  )
              );
            },
          ),
        ),
      ),
    );
  }
}
