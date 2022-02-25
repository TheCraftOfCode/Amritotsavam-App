import 'package:flutter/material.dart';
import 'package:amritotsavam_app/utils/colors.dart' as colors;
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';

class StringListGenerator extends FormField<List> {
  StringListGenerator(
      {Key? key,
      FormFieldSetter<List>? onSaved,
      FormFieldValidator<List>? validator,
      List? initialValue,
      title,
      AutovalidateMode autoValidateMode = AutovalidateMode.onUserInteraction})
      : super(
            key: key,
            onSaved: onSaved,
            validator: validator ??
                (data) {
                  if (data!.isEmpty) return "List can't be empty";
                  return null;
                },
            initialValue: initialValue ?? [],
            autovalidateMode: autoValidateMode,
            builder: (FormFieldState<List> state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ExpandableList(
                    state: state,
                    title: title ?? "List",
                  ),
                  state.hasError
                      ? Container(
                    padding: const EdgeInsets.all(7),
                    child: Text(
                      state.errorText ?? "error",
                      style: const TextStyle(
                          color: Colors.red, fontSize: 10),
                    ),
                  )
                      : Container()
                ],
              );
            });
}

class ExpandableList extends StatefulWidget {
  const ExpandableList({Key? key, required this.state, required this.title})
      : super(key: key);
  final FormFieldState<List> state;
  final String title;

  @override
  _ExpandableListState createState() => _ExpandableListState();
}

class _ExpandableListState extends State<ExpandableList> {
  final _contentController = TextEditingController();
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    var widgetList = <Widget>[];
    for (var i = 0; i < widget.state.value!.length; i++) {
      widgetList.add(UnorderedListItem(
        widget.state.value![i],
        removeItemCallback: () {
          var val = widget.state.value;
          val!.removeAt(i);
          widget.state.didChange(val);
        },
      ));
      // Add space between items
      widgetList.add(const SizedBox(height: 5.0));
    }

    return Container(
      decoration: BoxDecoration(
        border: widget.state.hasError ? Border.all(color: Colors.red) : null,
      ),
      child: ExpansionPanelList(
        animationDuration: const Duration(milliseconds: 500),
        children: [
          ExpansionPanel(
            backgroundColor: colors.buttonColor,
            headerBuilder: (context, isExpanded) {
              return ListTile(
                style: ListTileStyle.drawer,
                iconColor: colors.primaryTextColor,
                title: Text(
                  widget.title,
                  style: GoogleFonts.nunito(
                      color: colors.primaryTextColor, fontSize: 17),
                ),
              );
            },
            body: Container(
              color: colors.dateCardColor,
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          controller: _contentController,
                          maxLines: null,
                          onSaved: (val){
                            if (val!.isNotEmpty) {
                              _contentController.clear();
                              var list = widget.state.value;
                              list!.add(val);
                              widget.state.didChange(list);
                            }
                          },
                          onFieldSubmitted: (val){
                            if (val.isNotEmpty) {
                              _contentController.clear();
                              var list = widget.state.value;
                              list!.add(val);
                              widget.state.didChange(list);
                            }
                          },
                          textInputAction: TextInputAction.go,
                          style: GoogleFonts.montserrat(
                              color: colors.primaryTextColor),
                          decoration: InputDecoration(
                            suffixIcon: Material(
                              color: Colors.transparent,
                              child: IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  var val = _contentController.text;
                                  if (val.isNotEmpty) {
                                    _contentController.clear();
                                    var list = widget.state.value;
                                    list!.add(val);
                                    widget.state.didChange(list);
                                  } else {
                                    showToast("Field is empty");
                                  }
                                },
                              ),
                            ),
                            label: Text(widget.title,
                                style: GoogleFonts.raleway(
                                    color: colors.textBoxTextColor,
                                    fontSize: 12)),
                            filled: true,
                            hintText: 'Enter ${widget.title}',
                            hintStyle: GoogleFonts.poppins(
                                color: colors.primaryTextColor.withOpacity(0.7)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5)),
                            fillColor: colors.textBoxFill,
                            focusColor: colors.textBoxFill,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(5)),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: widgetList),
                    ),
                  ],
                ),
              ),
            ),
            isExpanded: _expanded,
            canTapOnHeader: true,
          ),
        ],
        dividerColor: Colors.grey,
        expansionCallback: (panelIndex, isExpanded) {
          setState(() {
            _expanded = !_expanded;
          });
        },
      ),
    );
  }
}

class UnorderedListItem extends StatelessWidget {
  const UnorderedListItem(this.text, {Key? key, this.removeItemCallback})
      : super(key: key);

  final String text;
  final VoidCallback? removeItemCallback;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //Enable if bullets are needed
        // Padding(
        //   padding: const EdgeInsets.only(right: 8),
        //   child: Text("• ", style: GoogleFonts.nunito(color: colors.primaryTextColor)),
        // ),
        Expanded(
          child: SelectableText(
            text,
            textAlign: TextAlign.justify,
            style: GoogleFonts.nunito(color: colors.primaryTextColor),
          ),
        ),
        if (removeItemCallback != null)
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Material(
              color: Colors.transparent,
              child: IconButton(
                icon: const Icon(Icons.remove),
                onPressed: removeItemCallback,
              ),
            ),
          )
      ],
    );
  }
}
