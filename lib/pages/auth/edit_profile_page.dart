import 'package:doc_truyen_online_mobile/styles/app_color.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _birtdateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController.text = "Luan";
    _birtdateController.text = "2000";
    _descriptionController.text = "This is a long text";
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _birtdateController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cập nhật hồ sơ",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: 150,
                          height: 150,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              "https://imgupscaler.com/images/samples/anime-after.webp",
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: Icon(
                            Icons.camera_enhance,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    hintText: "Tên người dùng",
                    prefixIcon: Icon(Icons.child_friendly),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng điền email!';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  initialValue: "emaik@gmail",
                  enabled: false,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _birtdateController,
                  decoration: const InputDecoration(
                    hintText: "Năm sinh",
                    prefixIcon: Icon(Icons.date_range),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng điền năm sinh!';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 5,
                  minLines: 3,
                  decoration: const InputDecoration(
                    hintText: "Giới thiệu ngắn",
                    prefixIcon: Icon(Icons.text_fields),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      style: AppColor.textBtnBlue,
                      onPressed: () {},
                      child: Text("Lưu")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
