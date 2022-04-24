import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../Bloc/user/user_bloc.dart';
import '../ui/themes/colors_frave.dart';
import '../ui/widgets/widgets.dart';

part 'access_permission.dart';
part 'animation_route.dart';
part 'error_message.dart';
part 'modal_loading.dart';
part 'modal_loading_short.dart';
part 'modal_picture.dart';
part 'modal_quit.dart';
part 'modal_success.dart';
part 'policy_dialog.dart';
part 'routing.dart';
