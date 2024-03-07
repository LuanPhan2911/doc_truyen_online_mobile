import 'dart:io';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:doc_truyen_online_mobile/app/auth_provider.dart';
import 'package:doc_truyen_online_mobile/data/models/user.dart';
import 'package:doc_truyen_online_mobile/helpers/helper.dart';
import 'package:doc_truyen_online_mobile/helpers/toast.dart';
import 'package:doc_truyen_online_mobile/services/auth_service.dart';
import 'package:doc_truyen_online_mobile/styles/app_color.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final ImagePicker picker = ImagePicker();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String? avatar;
  String defaultAvatar = "assets/blank_profile.png";
  XFile? fileAvatar;
  String? _fileAvatarPath;
  late int gender;
  Map<String, int> genders = {
    "male": 0,
    "female": 1,
  };
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    User? user = Provider.of<AuthProvider>(context, listen: false).user;
    setUser(user!);
  }

  void handleEditUser(context) async {
    if (_formKey.currentState!.validate()) {
      try {
        Response res = await AuthService.edit(FormData.fromMap({
          "name": _nameController.text,
          "description": _descriptionController.text,
          "gender": gender,
          "birth_date": _birthDateController.text,
          "avatar": _fileAvatarPath != null
              ? await MultipartFile.fromFile(_fileAvatarPath!)
              : null
        }));
        if (res.statusCode == 200) {
          User user = User.fromJson(res.data['data']);
          Provider.of<AuthProvider>(context, listen: false).updateProfile(user);
          setUser(user);
          Toast.success(context, "Cập nhật hồ sơ thành công");
        }
      } on DioException catch (e) {}
    }
  }

  void setUser(User user) {
    _nameController.text = user.name ?? "";
    _birthDateController.text = user.birthDate ?? "";
    _descriptionController.text = user.description ?? "";
    _emailController.text = user.email!;
    avatar = user.avatar;
    gender = user.gender!;
  }

  Future<void> getImage(ImageSource source) async {
    fileAvatar = await picker.pickImage(
      source: source,
      maxHeight: 200,
      maxWidth: 200,
    );
    if (fileAvatar != null) {
      setState(() {
        _fileAvatarPath = fileAvatar!.path;
      });
    } else {
      await getLostData();
    }
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }

  Future<void> getLostData() async {
    final LostDataResponse response = await picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    fileAvatar = response.file;

    if (fileAvatar != null) {
      setState(() {
        _fileAvatarPath = fileAvatar!.path;
      });
    } else {
      Helper.logWarning("File not found");
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _birthDateController.dispose();
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
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return SizedBox(
                              height: 100,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      IconButton(
                                        onPressed: () async {
                                          await getImage(ImageSource.camera);
                                        },
                                        icon: const Icon(Icons.camera),
                                      ),
                                      const Text("Camera")
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    children: [
                                      IconButton(
                                        onPressed: () async {
                                          await getImage(ImageSource.gallery);
                                        },
                                        icon: const Icon(Icons.library_add),
                                      ),
                                      const Text(
                                        "Thư viên",
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Stack(
                        children: [
                          ClipOval(
                            child: _fileAvatarPath != null
                                ? Image(
                                    image: FileImage(File(_fileAvatarPath!)),
                                    fit: BoxFit.cover,
                                    width: 150,
                                    height: 150,
                                  )
                                : avatar == null
                                    ? Image.asset(
                                        defaultAvatar,
                                        fit: BoxFit.cover,
                                        width: 150,
                                        height: 150,
                                      )
                                    : CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        width: 150,
                                        height: 150,
                                        imageUrl: Helper.asset(avatar),
                                        progressIndicatorBuilder: (context, url,
                                                downloadProgress) =>
                                            CircularProgressIndicator(
                                                value:
                                                    downloadProgress.progress),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                          ),
                          const Positioned(
                            bottom: 10,
                            right: 10,
                            child: Icon(
                              Icons.camera_enhance,
                            ),
                          )
                        ],
                      ),
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
                  controller: _emailController,
                  enabled: false,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _birthDateController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "Năm sinh",
                    labelText: "Năm sinh",
                    prefixIcon: Icon(Icons.date_range),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Năm sinh không hợp lệ!';
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
                    labelText: "Giới thiệu ngắn",
                    prefixIcon: Icon(Icons.text_fields),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: SegmentedButton(
                    showSelectedIcon: false,
                    segments: [
                      ButtonSegment(
                        value: genders['male'],
                        label: const Text("Nam"),
                        icon: const Icon(Icons.boy),
                      ),
                      ButtonSegment(
                        value: genders['female'],
                        label: const Text("Nữ"),
                        icon: const Icon(Icons.girl),
                      ),
                    ],
                    selected: {gender},
                    onSelectionChanged: (item) {
                      setState(() {
                        gender = item.first!;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      style: AppColor.textBtnBlue,
                      onPressed: () => handleEditUser(context),
                      child: const Text("Lưu")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
