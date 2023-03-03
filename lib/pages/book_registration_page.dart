import 'package:booqui/widgets/returnbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../controllers/book_registration_controller.dart';
import '../styles.dart';
import '../widgets/mainbutton.dart';

class BookRegistrationPage extends StatefulWidget {
  const BookRegistrationPage({super.key});

  @override
  State<BookRegistrationPage> createState() => _BookRegistrationPageState();
}

class _BookRegistrationPageState extends State<BookRegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookRegistrationController>(
      init: BookRegistrationController(),
      builder: (_) => Scaffold(
        appBar: AppBar(
          leading: ReturnButton(),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: black,
        body: Obx(
          () => _.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : ListView(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    await _.pdfSelect();
                                    _.update();
                                  },
                                  child: Container(
                                    width: 80,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      color: cream,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.upload),
                                        Text('Upload')
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30),
                                Text(_.fileName.value,
                                    style: const TextStyle(color: Colors.white))
                              ],
                            ),
                          ),
                          SizedBox(height: 40),
                          SizedBox(
                            width: 320,
                            child: TextField(
                              controller: _.title,
                              decoration: InputDecoration(
                                  errorText: _.errorTitle.value == ''
                                      ? null
                                      : _.errorTitle.value,
                                  label: const Text('Título'),
                                  filled: true,
                                  fillColor: cream),
                            ),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            width: 320,
                            child: TextField(
                              controller: _.author,
                              decoration: InputDecoration(
                                  errorText: _.errorAuthor.value == ''
                                      ? null
                                      : _.errorTitle.value,
                                  label: const Text('Autor'),
                                  filled: true,
                                  fillColor: cream),
                            ),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            width: 320,
                            child: TextField(
                              maxLines: 8,
                              maxLength: 270,
                              controller: _.description,
                              decoration: InputDecoration(
                                  errorText: _.errorTitle.value == ''
                                      ? null
                                      : _.errorDescription.value,
                                  label: const Text('Descrição'),
                                  filled: true,
                                  fillColor: cream),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Categoria:',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(width: 20),
                              DropdownButton(
                                  style: TextStyle(color: Colors.white),
                                  dropdownColor: black,
                                  value: _.dropValue,
                                  items: [
                                    DropdownMenuItem(
                                        value: 'Romance',
                                        child: Text('Romance')),
                                    DropdownMenuItem(
                                        value: 'Ação', child: Text('Ação')),
                                    DropdownMenuItem(
                                        value: 'Ficção cientifica',
                                        child: Text('Ficção cientifica')),
                                  ],
                                  onChanged: (newValue) {
                                    setState(() {
                                      _.dropValue = newValue!;
                                    });
                                  }),
                            ],
                          ),
                          SizedBox(height: 20),
                          MainButton(
                              text: 'Confirmar',
                              color: Colors.white,
                              onPressed: () async {
                                await _.pdfUpload(context);
                                _.showSnackbar();
                              }),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
