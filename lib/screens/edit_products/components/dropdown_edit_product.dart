import 'package:flutter/material.dart';
import 'package:thunderapp/screens/add_products/add_products_controller.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';
import 'package:thunderapp/shared/core/models/table_products_model.dart';

import '../edit_products_controller.dart';

// ignore: must_be_immutable
class DropDownEditProduct extends StatefulWidget {
  late EditProductsController controller;

  DropDownEditProduct(this.controller, {Key? key})
      : super(key: key);

  @override
  State<DropDownEditProduct> createState() =>
      _DropDownEditProductState();
}

class _DropDownEditProductState
    extends State<DropDownEditProduct> {
  final dropValue = ValueNotifier('');

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            alignment: Alignment.topCenter,
            width: size.width,
            height: size.height * 0.06,
            child:
                DropdownButtonFormField<TableProductsModel>(
              isExpanded: true,
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: kPrimaryColor,
                size: size.width * 0.05,
              ),
              hint: const Text('Selecione'),
              value: null,
              items: widget.controller.products.map((obj) {
                return DropdownMenuItem<TableProductsModel>(
                  value: obj,
                  child: Text(obj.nome.toString()),
                );
              }).toList(),
              onChanged: (selectedObj) {
                setState(() {
                  widget.controller
                      .setProductId(selectedObj!.id);
                  widget.controller
                      .setDescription(selectedObj.nome);
                });
                widget.controller
                    .boolImage(selectedObj!.id)
                    .then((value) {
                  widget.controller.setHasImage(value);
                });
              },
            )),
      ],
    );
  }
}
