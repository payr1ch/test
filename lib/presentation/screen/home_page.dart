import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:test_app/presentation/widget/text_field.dart';
import 'package:test_app/presentation/widget/user_card.dart';
import 'package:test_app/utils/colors.dart';
import 'package:test_app/utils/text_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime dateTime = DateTime.now();
  bool isClicked = true;
  bool isSecondClicked = false;
  bool isThirdClicked = true;
  bool isFourthClicked = false;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.backgroundColor,
        leading: IconButton(
          padding: const EdgeInsets.only(left: 15),
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 25,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Ordering",
          style: ThemeText.header,
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(.2),
          child: Container(
            color: Colors.blueGrey,
            height: .2,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Step 1",
                    style: ThemeText.step,
                  ),
                ),
              ],
            ),
            isSecondClicked
                ? const Gap(1)
                : Container(
                    height: 90,
                    width: screenSize.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text('Start date', style: ThemeText.label),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            width: screenSize.width * .9,
                            height: 56,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.blueGrey,
                                  width: 0.6,
                                )),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: InkWell(
                                    child: const Icon(
                                      Icons.calendar_month_sharp,
                                      color: Colors.blueGrey,
                                      size: 30,
                                    ),
                                    onTap: () {
                                      showCupertinoModalPopup(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            SizedBox(
                                          height: 250,
                                          child: CupertinoDatePicker(
                                            backgroundColor: Colors.white,
                                            initialDateTime: DateTime.now(),
                                            onDateTimeChanged:
                                                (DateTime newTime) {
                                              setState(
                                                  () => dateTime = newTime);
                                            },
                                            mode: CupertinoDatePickerMode.date,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Text(DateFormat.yMMMMd().format(dateTime))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            isSecondClicked ? const Gap(0) : const Gap(20),
            isSecondClicked
                ? Padding(
                    padding: isSecondClicked
                        ? const EdgeInsets.only(top: 20)
                        : const EdgeInsets.only(top: 0),
                    child: Container(
                      height: 240,
                      width: screenSize.width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Sender details',
                                style: ThemeText.label2,
                              ),
                              const Gap(16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    child: Container(
                                      width: screenSize.width * .44,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        color: isClicked
                                            ? ThemeColors.secondaryColor
                                            : ThemeColors.secondaryButtonColor,
                                        borderRadius: BorderRadius.circular(36),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Add address',
                                          style: isClicked
                                              ? ThemeText.textSecondary
                                              : ThemeText.text3,
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        isSecondClicked = false;
                                        isClicked = true;
                                      });
                                    },
                                  ),
                                  InkWell(
                                    child: Container(
                                      width: screenSize.width * .44,
                                      height: 33,
                                      decoration: BoxDecoration(
                                        color: isSecondClicked
                                            ? ThemeColors.secondaryColor
                                            : ThemeColors.secondaryButtonColor,
                                        borderRadius: BorderRadius.circular(36),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Select address',
                                          style: isSecondClicked
                                              ? ThemeText.textSecondary
                                              : ThemeText.text3,
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        isSecondClicked = true;
                                        isClicked = false;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              const Gap(20),
                              UserCard(
                                  userFullName: 'Denilev Egor',
                                  address:
                                      'Belarus, Minsk, Derzhinskogo 3b, 80100'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: isSecondClicked
                        ? const EdgeInsets.only(top: 20)
                        : const EdgeInsets.only(top: 0),
                    child: Container(
                      height: 900,
                      width: screenSize.width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Sender details',
                                style: ThemeText.label2,
                              ),
                              const Gap(16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    child: Container(
                                      width: screenSize.width * .44,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        color: isClicked
                                            ? ThemeColors.secondaryColor
                                            : ThemeColors.secondaryButtonColor,
                                        borderRadius: BorderRadius.circular(36),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Add address',
                                          style: isClicked
                                              ? ThemeText.textSecondary
                                              : ThemeText.text3,
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        isSecondClicked = false;
                                        isClicked = true;
                                      });
                                    },
                                  ),
                                  InkWell(
                                    child: Container(
                                      width: screenSize.width * .44,
                                      height: 33,
                                      decoration: BoxDecoration(
                                        color: isSecondClicked
                                            ? ThemeColors.secondaryColor
                                            : ThemeColors.secondaryButtonColor,
                                        borderRadius: BorderRadius.circular(36),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Select address',
                                          style: isSecondClicked
                                              ? ThemeText.textSecondary
                                              : ThemeText.text3,
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        isSecondClicked = true;
                                        isClicked = false;
                                      });
                                    },
                                  )
                                ],
                              ),
                              const Gap(20),
                              const Text(
                                'Full name*',
                                style: ThemeText.textMain,
                              ),
                              CustomTextField(leadingIcon: Icons.person),
                              const Gap(20),
                              const Text(
                                'Email*',
                                style: ThemeText.textMain,
                              ),
                              CustomTextField(leadingIcon: Icons.email),
                              const Gap(20),
                              const Text(
                                'Phone number*',
                                style: ThemeText.textMain,
                              ),
                              CustomTextField(leadingIcon: Icons.phone),
                              const Gap(10),
                              const Divider(
                                thickness: 0.5,
                                color: ThemeColors.divider,
                              ),
                              const Gap(9),
                              const Text(
                                'Country*',
                                style: ThemeText.textMain,
                              ),
                              CustomTextField(leadingIcon: Icons.location_on),
                              const Gap(20),
                              const Text(
                                'City*',
                                style: ThemeText.textMain,
                              ),
                              CustomTextField(leadingIcon: Icons.location_city),
                              const Gap(20),
                              const Text(
                                'Address Line 1*',
                                style: ThemeText.textMain,
                              ),
                              CustomTextField(
                                  leadingIcon: FontAwesomeIcons.mapPin),
                              const Gap(8),
                              const Text(
                                'Address Line+',
                                style: TextStyle(
                                    color: ThemeColors.secondaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19),
                              ),
                              const Gap(20),
                              const Text(
                                'Postcode*',
                                style: ThemeText.textMain,
                              ),
                              CustomTextField(
                                  leadingIcon: FontAwesomeIcons.signsPost),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
            isFourthClicked
                ? Padding(
                    padding: isThirdClicked
                        ? const EdgeInsets.only(top: 20)
                        : const EdgeInsets.only(top: 0),
                    child: Container(
                      height: 240,
                      width: screenSize.width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Recipient address',
                                style: ThemeText.label2,
                              ),
                              const Gap(16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    child: Container(
                                      width: screenSize.width * .44,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        color: isThirdClicked
                                            ? ThemeColors.secondaryColor
                                            : ThemeColors.secondaryButtonColor,
                                        borderRadius: BorderRadius.circular(36),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Add address',
                                          style: isThirdClicked
                                              ? ThemeText.textSecondary
                                              : ThemeText.text3,
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        isFourthClicked = false;
                                        isThirdClicked = true;
                                      });
                                    },
                                  ),
                                  InkWell(
                                    child: Container(
                                      width: screenSize.width * .44,
                                      height: 33,
                                      decoration: BoxDecoration(
                                        color: isFourthClicked
                                            ? ThemeColors.secondaryColor
                                            : ThemeColors.secondaryButtonColor,
                                        borderRadius: BorderRadius.circular(36),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Select address',
                                          style: isFourthClicked
                                              ? ThemeText.textSecondary
                                              : ThemeText.text3,
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        isFourthClicked = true;
                                        isThirdClicked = false;
                                      });
                                    },
                                  )
                                ],
                              ),
                              const Gap(20),
                              UserCard(
                                  userFullName: 'Ko Yuri',
                                  address:
                                      'Italy, Naple, Via Toledo 256, 220069'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      height: 870,
                      width: screenSize.width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Recipient address',
                                style: ThemeText.label2,
                              ),
                              const Gap(16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    child: Container(
                                      width: screenSize.width * .44,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        color: isThirdClicked
                                            ? ThemeColors.secondaryColor
                                            : ThemeColors.secondaryButtonColor,
                                        borderRadius: BorderRadius.circular(36),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Add address',
                                          style: isThirdClicked
                                              ? ThemeText.textSecondary
                                              : ThemeText.text3,
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        isFourthClicked = false;
                                        isThirdClicked = true;
                                      });
                                    },
                                  ),
                                  InkWell(
                                    child: Container(
                                      width: screenSize.width * .44,
                                      height: 33,
                                      decoration: BoxDecoration(
                                        color: isFourthClicked
                                            ? ThemeColors.secondaryColor
                                            : ThemeColors.secondaryButtonColor,
                                        borderRadius: BorderRadius.circular(36),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Select address',
                                          style: isFourthClicked
                                              ? ThemeText.textSecondary
                                              : ThemeText.text3,
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        isFourthClicked = true;
                                        isThirdClicked = false;
                                      });
                                    },
                                  )
                                ],
                              ),
                              const Gap(20),
                              const Text(
                                'Full name*',
                                style: ThemeText.textMain,
                              ),
                              CustomTextField(leadingIcon: Icons.person),
                              const Gap(20),
                              const Text(
                                'Email*',
                                style: ThemeText.textMain,
                              ),
                              CustomTextField(leadingIcon: Icons.email),
                              const Gap(20),
                              const Text(
                                'Phone number*',
                                style: ThemeText.textMain,
                              ),
                              CustomTextField(leadingIcon: Icons.phone),
                              const Gap(10),
                              const Divider(
                                thickness: 0.5,
                                color: ThemeColors.divider,
                              ),
                              const Gap(9),
                              const Text(
                                'Country*',
                                style: ThemeText.textMain,
                              ),
                              CustomTextField(leadingIcon: Icons.location_on),
                              const Gap(20),
                              const Text(
                                'City*',
                                style: ThemeText.textMain,
                              ),
                              CustomTextField(leadingIcon: Icons.location_city),
                              const Gap(20),
                              const Text(
                                'Address Line 1*',
                                style: ThemeText.textMain,
                              ),
                              CustomTextField(
                                  leadingIcon: FontAwesomeIcons.mapPin),
                              const Gap(8),
                              const Text(
                                'Address Line+',
                                style: TextStyle(
                                    color: ThemeColors.secondaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19),
                              ),
                              const Gap(20),
                              const Text(
                                'Postcode*',
                                style: ThemeText.textMain,
                              ),
                              CustomTextField(
                                  leadingIcon: FontAwesomeIcons.signsPost),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Container(
                    height: 50,
                    width: screenSize.width * .9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ThemeColors.secondaryColor),
                    child: const Center(
                      child: Text(
                        'Next step',
                        style: ThemeText.buttonTextStyle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Gap(50)
          ],
        ),
      ),
    );
  }
}
