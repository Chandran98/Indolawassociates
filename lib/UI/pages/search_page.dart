import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/UI/components/snack_bar.dart';
import 'package:indolawassociates/UI/constant/constant.dart';
import 'package:indolawassociates/UI/utils/cards/lawyercard.dart';
import 'package:indolawassociates/UI/provider/search_provider.dart';
import 'package:indolawassociates/UI/routes/route.dart';
import 'package:indolawassociates/UI/utils/empty_screen.dart';
import 'package:provider/provider.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({Key? key}) : super(key: key);

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
   onback() {
    Navigator.pushNamed(context, homeroute);
  }
  var _scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        onback();
        return Future.value(false);
      },
      child: SafeArea(
          child: Scaffold(
        key: _scaffoldkey,
        appBar: AppBar(
          title: searchbar(),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 10, left: 15, right: 15),
              child: Text(
                context.watch<Searchprovider>().searchstarted == false
                    ? "recent search"
                    : "we have found",
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
            context.watch<Searchprovider>().searchstarted == false
                ? Suggestionbox()
                : Resultsearch()
          ],
        ),
      )),
    );
  }

  Widget searchbar() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        autofocus: true,
        controller: context.watch<Searchprovider>().textcontroller,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "search...",
          hintStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          suffixIcon: IconButton(
              onPressed: () {
                context.read<Searchprovider>().setsearchinit();
              },
              icon: Icon(CupertinoIcons.clear,color: black,)),
        ),
        textInputAction: TextInputAction.search,
        onFieldSubmitted: (value) {
          if (value.isEmpty) {
            openSnacbar(_scaffoldkey, "Type something");
          } else {
            context.read<Searchprovider>().setsearchtext(value);
          }
        },
        
      ),
    );
  }
}

class Suggestionbox extends StatelessWidget {
  const Suggestionbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: EmptyPage(
          icon: Icons.search,
          message: "search lawyers",
          message1: "Empty can't find any"),
    );
  }
}

class Resultsearch extends StatelessWidget {
  const Resultsearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: context.watch<Searchprovider>().getdata(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // if (snapshot.hasData) {
          //   if (snapshot.data.length == 0) {
          //     return EmptyPage(
          //         icon: Icons.search,
          //         message: "search lawyer",
          //         message1: "Empty can't find any");
          //   } else {
          //     ListView.separated(
          //       itemCount: snapshot.data.length,
          //       separatorBuilder: (BuildContext context, int index) {
          //         return spaced10;
          //       },
          //       itemBuilder: (BuildContext context, int index) {
          //         return Card4(
          //             d: snapshot.data[index], herotag: "search$index");
          //       },
          //     );
          //   }
          // }
          // return ListView.separated(
          //   itemCount: 10,
          //   separatorBuilder: (BuildContext context, int index) {
          //     return spaced10;
          //   },
          //   itemBuilder: (BuildContext context, int index) {
          //     return const LoadingCard(
          //       height: 120,
          //     );
          //   },
          // );
          if (snapshot.hasData) {
            if (snapshot.data.length == 0) {
              return EmptyPage(
                  icon: Icons.search,
                  message: "Empty",
                  message1: " can't find any");
            } else {
              return ListView.separated(
                itemCount: snapshot.data.length,
                separatorBuilder: (BuildContext context, int index) {
                  return spaced10;
                },
                itemBuilder: (BuildContext context, int index) {
                  return Card4(
                      d: snapshot.data[index], herotag: "search$index");
                },
              );
            }
          } else {
            return EmptyPage(
                icon: Icons.search,
                message: "search lawyer",
                message1: "Empty can't find any");
          }
        },
      ),
    );
  }
}
