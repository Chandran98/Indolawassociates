import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:indolawassociates/Client/Pages/Categories.dart/cate.dart';
import 'package:indolawassociates/Client/constants/constant.dart';
import 'model/categories_data_model.dart';

//////////////////////////   Categorycardlist   /////////////////////////////////////////

class Categorycardlist extends StatefulWidget {
  @override
  _CategorycardlistState createState() => _CategorycardlistState();
}

class _CategorycardlistState extends State<Categorycardlist> {
  final List<Categorylist> categorylist = [
    Categorylist(
        categorytitle: "Property",
        categorypic: "assets/icons/property.png",
        categorysubtitle:
            "     Recovery of possession of Immovable property.It is a principle of law that a person, who has been in a long continuous possession of the immovable property, can protect the same by seeking an injunction against any person in the world other than the true owner. It is also a settled principle of law that owner of the property can get back his possession only by resorting to due process of law. It states that a suit for possession must be filed having regard to the provision of the Code of Civil Procedure.",
        categorypageimages: 'assets/images/property_cate.jpg'),
    Categorylist(
        categorytitle: "Family",
        categorypic: "assets/icons/family.png",
        categorysubtitle:
            "     When a couple seeks divorce for various reasons, if the child or children are minors, the legal right to keep and look after the child/ children is called Child Custody. Generally, it pertains to the right given to a child's mother or father but under  special circumstances like death of the parent/s it maybe even be granted to the grandparents or a third party relative to become the legal guardian of the child till the child attains majority",
        categorypageimages: 'assets/images/div_cate.jpg'),
    Categorylist(
        categorytitle: "Criminal",
        categorypic: "assets/icons/criminal.png",
        categorysubtitle:
            '     Crimes against property typically involve interference with the property of another party. Although they may involve physical or mental harm to another, they primarily result in the deprivation of the use or enjoyment of property. Many property crimes are theft crimes, including burglary, larceny, robbery, auto theft, and shoplifting.',
        categorypageimages: 'assets/images/cir_cate.jpg'),
    Categorylist(
        categorytitle: "Corporate",
        categorypic: "assets/icons/coporate.png",
        categorysubtitle:
            '     Corporations provide limited personal liability for debts and obligations of the business, which provides protection for shareholder assets. Exceptions include cases of fraud and unpaid business taxes. Corporations also have the advantage of a lower tax rate than the individual tax rate. Trade mark protects item that identify a particular business from another where as copy right protects original work. Corporate finance is a catch-all designation for any business division that handles financial activities for a firm. ',
        categorypageimages: 'assets/images/cor_cate.jpg'),
    Categorylist(
        categorytitle: "Cyber",
        categorypic: "assets/icons/cyber.png",
        categorysubtitle:
            '     Cybercrime law provides rules of conduct and standards of behaviour for the use of the Internet, computers, and related digital technologies, and the actions of the public, government, and private organizations; rules of evidence and criminal procedure, and other criminal justice matters in cyberspace; and regulation to reduce risk and/or mitigate the harm done to individuals, organizations, and infrastructure should a cybercrime occur.',
        categorypageimages: 'assets/images/cyber_cate.jpg'),
    Categorylist(
        categorytitle: "Civil",
        categorypic: "assets/icons/civilrights.png",
        categorysubtitle:
            '     Disputes between people or business over money or some injury to personal rights are called civil cases. If you decide to sue another person, an organization or a business, your case is a civil case. Private individuals, businesses or the government can sue other people and organizations. The person who is suing is called the plaintiff and the person who is being sued is called the defendant. A judge’s responsibility is to ensure that cases are resolved efficiently and effectively.  ',
        categorypageimages: 'assets/images/civil_cate.jpg'),
    Categorylist(
        categorytitle: "Taxation",
        categorypic: "assets/icons/tax.png",
        categorysubtitle:
            '     Taxes are mandatory contributions levied on individuals or corporations by a government entity—whether local, regional or national. Tax revenues finance government activities, including public works and services such as roads and schools, or programs such as Social Security and Medicare. In economics, taxes fall on whoever pays the burden of the tax, whether this is the entity being taxed, such as a business, or the end consumers of the business’s goods.',
        categorypageimages: 'assets/images/Tax_cate.jpg'),
    Categorylist(
        categorytitle: "Labour",
        categorypic: "assets/icons/labour.png",
        categorysubtitle:
            '     Labour law which is also known as employment law and its services. The new labour laws limit the maximum basic pay to 50 per cent of CTC, thus effectively increasing the Gratuity bonus to be paid to the employee. Under the new wages code, the gratuity amount will be calculated on a larger salary base, which will include basic pay plus allowances such as a special allowance on wages. Provident fund (PF) contribution is calculated as a percentage of basic wage, which includes basic pay and dearness allowance',
        categorypageimages: 'assets/images/cor_cate.jpg'),
    Categorylist(
        categorytitle: "Consumer",
        categorypic: "assets/icons/consumer.png",
        categorysubtitle:
            '     Consumer court is a special purpose court in India, It primarily deals with consumer related disputes maintaining fair practices in contracts of sellers and protect consumer rights. Once the grounds are established, the next step is to estimate the pecuniary limit for the complaint. Under the Consumer Protection Act there exists a three-tier redressal forum. complaints are filed in these forums in accordance with the pecuniary limit as fixed by the law.',
        categorypageimages: 'assets/images/con_cate.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.085.h,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categorylist.length,
          itemBuilder: (context, index) {
            return Categorycard(
              categorysubtitle: categorylist[index].categorysubtitle,
              categorypageimages: categorylist[index].categorypageimages,
              categorytitle: categorylist[index].categorytitle,
              categorypic: categorylist[index].categorypic,
            );
          }),
    );
  }
}

//////////////////////////   Categorycard   /////////////////////////////////////////
class Categorycard extends StatelessWidget {
  const Categorycard(
      {Key? key,
      required this.categorytitle,required this.categorypageimages,
      required this.categorypic,
      required this.categorysubtitle})
      : super(key: key);

  final String categorytitle;  final String categorypageimages;

  final String categorypic;
  final String categorysubtitle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Catepage(
                    categorytitle: categorytitle,
                    categorypageimages: categorypageimages,
                    categorysubtitle: categorysubtitle,
                  )
              // Categorypagedetails(categorytitle: categorytitle)
              )),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12))),
          height: MediaQuery.of(context).size.height * 0.08.h,
          width: MediaQuery.of(context).size.width * .23.w,
          child: Column(
            children: [
              ClipOval(
                child: Container(
                  width: MediaQuery.of(context).size.height * 0.05.w,
                  height: MediaQuery.of(context).size.height * 0.04.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                      image: DecorationImage(
                          image: AssetImage(
                            categorypic,
                          ),
                          fit: BoxFit.contain)),
                ),
              ),
              FittedBox(
                  child: Text(categorytitle,
                      style: GoogleFonts.mulish(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: navy)))
            ],
          ),
        ),
      ),
    );
  }
}

///////////////////////// CategoryPage Details///////////////////////////

