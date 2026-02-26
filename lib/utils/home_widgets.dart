import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_sample_app/controllers/home_controller.dart';
import 'package:my_sample_app/models/data_model.dart' as model;
import 'package:my_sample_app/utils/video_player.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';

class HomeWidgets {
  static Widget dynamicField(model.Field field, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: _buildFieldByType(field, context),
    );
  }

  static Widget _buildFieldTitle(model.Field field) {
    return RichText(
      text: TextSpan(
        text: field.fieldName,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        children: [
          if (field.isMandate)
            const TextSpan(
              text: " *",
              style: TextStyle(color: Colors.red),
            ),
        ],
      ),
    );
  }

  static Widget _buildFieldByType(model.Field field, BuildContext context) {
    final type = field.fieldType;
    print("Buildtype field: ${field.fieldType}");
    print("Buildfield name ${field.fieldName}");
    if (field.calendarConfig != null ||
        type == "Calendar" ||
        type == "ArrivalDate") {
      return _buildDatePicker(field);
    }
    // 🔹 CHECKBOX FIRST
    if (type == "CheckBox") {
      return _buildCheckBox(field, context);
    }

    //Gps Tracking
    if (type == "GPSLocation") {
      return _buildGPSLocation(field, context);
    }

    //Videoplayer
    if (field.fieldType == "Video") {
      return _buildVideoPlayer(field);
    }

    //FileUpload
    if (type == "FileUpload") {
      return _buildFileUpload(field);
    }

    if (type == "DateTime") {
      return _buildTimePicker(field);
    }

    if (type == "Divider") {
      return _buildDivider(field);
    }

    if (type == "Label") {
      return _buildLabel(field);
    }

    // 🔹 EMAIL
    if (type == "Email") {
      return _buildEmailField(field);
    }

    if (type == "Rating") {
      return _buildRatingField(field);
    }

    // 🔹 TEXTAREA
    if (type == "TextArea") {
      return _buildTextArea(field);
    }

    if (type == "HtmlViewer") {
      return _buildHtmlViewer(field);
    }
    // 🔹 TEXTBOX / INPUTBOX
    if (type == "TextBox" || type == "InputBox") {
      return _buildTextField(field, context);
    }

    //DigitalSign
    if (type == "DigiSign") {
      return _buildDigitalSignature(field);
    }

    if (type == "RadioButton") {
      return _buildRadioButton(field, context);
    }

    // 🔹 DROPDOWN (LAST)
    if (field.fieldOptions.isNotEmpty) {
      return _buildDropdown(field, context);
    }
    return Offstage();
  }

  static Widget _buildGPSLocation(model.Field field, BuildContext context) {
    final provider = Provider.of<HomeController>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldTitle(field),

        const SizedBox(height: 8),

        ElevatedButton(
          onPressed: () => provider.getLocation(field),
          child: const Text("Get Location"),
        ),

        if (field.fieldValue != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(field.fieldValue),
          ),
      ],
    );
  }

  static Widget _buildDivider(model.Field field) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        spacing: 10,
        crossAxisAlignment: .start,
        children: [const Divider(thickness: 6, color: Colors.grey)],
      ),
    );
  }

  static Widget _buildLabel(model.Field field) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        spacing: 10,
        crossAxisAlignment: .start,
        children: [
          Text(
            field.fieldName,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  static Widget _buildRatingField(model.Field field) {
    return StatefulBuilder(
      builder: (context, setState) {
        int selectedRating = int.tryParse(field.fieldValue ?? "0") ?? 0;

        return Column(
          spacing: 10,
          crossAxisAlignment: .start,
          children: [
            _buildFieldTitle(field),

            Row(
              children: List.generate(5, (index) {
                int starIndex = index + 1;

                return IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: Icon(
                    Icons.star,
                    size: 32,
                    color: starIndex <= selectedRating
                        ? Colors.amber
                        : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      field.fieldValue = starIndex.toString();
                    });
                  },
                );
              }),
            ),

            const SizedBox(height: 4),

            if (selectedRating > 0) Text("Selected: $selectedRating / 5"),
          ],
        );
      },
    );
  }

  static Widget _buildRadioButton(model.Field field, BuildContext context) {
    print('Yes radio button is print');
    final provider = Provider.of<HomeController>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Field Title
        _buildFieldTitle(field),

        const SizedBox(height: 8),

        /// Radio Options
        ...field.fieldOptions.map((option) {
          return RadioListTile<String>(
            title: Text(option.text),
            value: option.value,
            groupValue: field.fieldValue,
            contentPadding: EdgeInsets.zero,

            onChanged: field.isReadOnly
                ? null
                : (value) {
                    field.fieldValue = value;

                    provider.notifyListeners();
                  },
          );
        }).toList(),
      ],
    );
  }

  static Widget _buildTextField(model.Field field, BuildContext context) {
    field.controller ??= TextEditingController(text: field.fieldValue ?? '');
    return Column(
      crossAxisAlignment: .start,
      spacing: 10,
      children: [
        _buildFieldTitle(field),
        TextFormField(
          controller: field.controller,
          readOnly: field.isReadOnly,
          maxLength: field.fieldMaxLength != null
              ? int.tryParse(field.fieldMaxLength!)
              : null,
          decoration: InputDecoration(
            labelText: field.fieldValidationMessage,
            border: const OutlineInputBorder(),
          ),
          onChanged: (value) {
            field.fieldValue = value;
          },
        ),
      ],
    );
  }

  static Widget _buildDropdown(model.Field field, BuildContext context) {
    final provider = Provider.of<HomeController>(context);
    String? selectedValue = field.fieldValue;

    if (!field.fieldOptions.any((o) => o.value == selectedValue)) {
      selectedValue = null;
    }

    return Column(
      crossAxisAlignment: .start,
      spacing: 10,
      children: [
        _buildFieldTitle(field),
        DropdownButtonFormField<String>(
          value: selectedValue,
          isExpanded: true,
          decoration: InputDecoration(border: const OutlineInputBorder()),
          items: field.fieldOptions
              .map(
                (option) => DropdownMenuItem(
                  value: option.value,
                  child: Text(option.text),
                ),
              )
              .toList(),
          onChanged: (value) {
            field.fieldValue = value;
          },
        ),
      ],
    );
  }

  static Widget _buildCheckBox(model.Field field, BuildContext context) {
    final provider = Provider.of<HomeController>(context);

    field.fieldValue ??= <String>[];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldTitle(field),

        const SizedBox(height: 8),

        ...field.fieldOptions.map((option) {
          bool isSelected = (field.fieldValue as List).contains(option.value);

          return CheckboxListTile(
            title: Text(option.text),
            value: isSelected,
            contentPadding: EdgeInsets.zero,
            onChanged: field.isReadOnly
                ? null
                : (value) {
                    List selectedList = field.fieldValue as List;

                    if (value == true) {
                      selectedList.add(option.value);
                    } else {
                      selectedList.remove(option.value);
                    }

                    provider.notifyListeners();
                  },
          );
        }).toList(),
      ],
    );
  }

  static Widget _buildHtmlViewer(model.Field field) {
    String cleanHtml = (field.fieldName ?? "")
        .replaceAll('\u000a', '')
        .replaceAll('&nbsp;', ' ')
        .trim();

    if (cleanHtml.isEmpty) {
      return const SizedBox();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Html(
        data: cleanHtml,
        style: {
          "body": Style(
            fontSize: FontSize(14),
            margin: Margins.zero,
            padding: HtmlPaddings.zero,
          ),
          "p": Style(margin: Margins.only(bottom: 8)),
        },
      ),
    );
  }

  static Widget _buildEmailField(model.Field field) {
    return Column(
      spacing: 10,
      crossAxisAlignment: .start,
      children: [
        Column(
          crossAxisAlignment: .start,
          spacing: 10,
          children: [
            _buildFieldTitle(field),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(border: const OutlineInputBorder()),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Email is required";
                }
                if (!RegExp(
                  r'^[a-zA-Z0-9._%+-]+@gmail\.com$',
                ).hasMatch(value)) {
                  return "Enter valid mail";
                }

                return null;
              },
            ),
          ],
        ),
      ],
    );
  }

  static Widget _buildVideoPlayer(model.Field field) {
    return VideoPlayerWidget(videoUrl: field.fieldValue ?? "");
  }

  static Widget _buildFileUpload(model.Field field) {
    return StatefulBuilder(
      builder: (context, setState) {
        File? selectedImage = field.fieldValue != null
            ? File(field.fieldValue!)
            : null;

        bool isRequesting = false;
        Future<void> pickImage() async {
          final picker = ImagePicker();

          final XFile? image = await picker.pickImage(
            source: ImageSource.gallery,
          );
          if (image != null) {
            setState(() {
              field.fieldValue = image.path;
            });
          }
        }

        Future<void> requestPermissionAndPick() async {
          if (isRequesting) return;
          isRequesting = true;

          Permission permission;

          if (Platform.isAndroid) {
            permission = Permission.photos;
          } else {
            permission = Permission.photos;
          }

          PermissionStatus status = await permission.status;

          if (status.isGranted) {
            await pickImage();
          } else if (status.isDenied) {
            PermissionStatus newStatus = await permission.request();

            if (newStatus.isGranted) {
              await pickImage();
            }
          } else if (status.isPermanentlyDenied) {
            await openAppSettings();
          }

          isRequesting = false;
        }

        return Column(
          crossAxisAlignment: .start,
          spacing: 10,
          children: [
            _buildFieldTitle(field),

            GestureDetector(
              onTap: requestPermissionAndPick,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: selectedImage != null
                    ? Image.file(selectedImage, fit: BoxFit.cover)
                    : const Center(child: Icon(Icons.add, size: 40)),
              ),
            ),
          ],
        );
      },
    );
  }

  static Widget _buildTextArea(model.Field field) {
    return Column(
      spacing: 10,
      crossAxisAlignment: .start,
      children: [
        _buildFieldTitle(field),
        TextFormField(
          initialValue: field.fieldValue ?? "",
          minLines: 5,
          maxLines: 8,
          decoration: InputDecoration(
            labelText: field.fieldValidationMessage,
            border: const OutlineInputBorder(),
            alignLabelWithHint: true,
          ),
          onChanged: (value) {
            field.fieldValue = value;
          },
        ),
      ],
    );
  }

  static Widget _buildDatePicker(model.Field field) {
    return Consumer<HomeController>(
      builder: (context, provider, child) {
        final selectedDate = provider.getDate(field.fieldId);

        return Column(
          spacing: 10,
          crossAxisAlignment: .start,
          children: [
            _buildFieldTitle(field),
            TextFormField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: field.fieldValidationMessage,
                border: const OutlineInputBorder(),
                suffixIcon: const Icon(Icons.calendar_today),
              ),
              controller: TextEditingController(text: selectedDate),
              onTap: () async {
                final pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                );

                if (pickedDate != null) {
                  final formatted =
                      "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";

                  provider.setDate(field.fieldId, formatted);
                }
              },
            ),
          ],
        );
      },
    );
  }

  static Widget _buildTimePicker(model.Field field) {
    return Consumer<HomeController>(
      builder: (context, provider, child) {
        final selectedTime = provider.getTime(field.fieldId);

        return Column(
          spacing: 10,
          crossAxisAlignment: .start,
          children: [
            _buildFieldTitle(field),
            TextFormField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: field.fieldValidationMessage,
                border: const OutlineInputBorder(),
                suffixIcon: const Icon(Icons.access_time),
              ),
              controller: TextEditingController(text: selectedTime),
              onTap: () async {
                final pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );

                if (pickedTime != null) {
                  final formatted = pickedTime.format(context);
                  provider.setTime(field.fieldId, formatted);
                }
              },
            ),
          ],
        );
      },
    );
  }

  // 🔹 Submit Button
  static Widget submitButton({
    required String title,
    required VoidCallback onPressed,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      child: ElevatedButton(onPressed: onPressed, child: Text(title)),
    );
  }

  static Widget _buildDigitalSignature(model.Field field) {
    return StatefulBuilder(
      builder: (context, setState) {
        final SignatureController controller = SignatureController(
          penStrokeWidth: 3,
          penColor: Colors.black,
          exportBackgroundColor: Colors.white,
        );

        Future<void> saveSignature() async {
          if (controller.isNotEmpty) {
            Uint8List? data = await controller.toPngBytes();
            if (data != null) {
              setState(() {
                field.fieldValue = data as String?;
              });
            }
          }
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(field.fieldName),

            const SizedBox(height: 8),

            Container(
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Signature(
                controller: controller,
                backgroundColor: Colors.white,
              ),
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                ElevatedButton(
                  onPressed: saveSignature,
                  child: const Text("Save"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    controller.clear();
                  },
                  child: const Text("Clear"),
                ),
              ],
            ),

            const SizedBox(height: 10),

            if (field.fieldValue != null) Offstage(),
            // Image.memory(field.fieldValue, height: 100),
          ],
        );
      },
    );
  }
}
