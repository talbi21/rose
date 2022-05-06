import 'package:animations/animations.dart';
import 'package:finalrose/ui/Login/loading_page.dart';
import 'package:finalrose/ui/Profile/shopping/shopping_page.dart';
import 'package:finalrose/ui/Profile/widgets/card_item_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Bloc/Auth/auth_bloc.dart';
import '../../Bloc/General/general_bloc.dart';
import '../../Bloc/user/user_bloc.dart';
import '../../Helpers/helpers.dart';
import '../Home/home_page.dart';
import '../Start/start_home_page.dart';
import '../widgets/widgets.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoadingAuthState) {
          modalLoading(context, 'Checking...');
        } else if (state is FailureAuthState) {
          Navigator.pop(context);
          errorMessageSnack(context, "check your information");
          print(state.error);
        } else if (state is SuccessAuthState) {
          Navigator.pop(context);
          // userBloc.add(OnGetUserEvent());
          Navigator.pushAndRemoveUntil(context, routeSlide(page: HomePage()), (_) => false);
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : const Color.fromRGBO(20, 21, 23, 1),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : Color.fromRGBO(20, 21, 23, 1),
          automaticallyImplyLeading: true,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Theme.of(context).brightness == Brightness.light
                    ? Color.fromRGBO(20, 21, 23, 1)
                    : Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }
              // onPressed: () { Navigator.pop(context, false);}
              ),
        ),
        body: ListProfile(),
      ),
    );
  }
}

class ListProfile extends StatefulWidget {
  @override
  _ListProfileState createState() => _ListProfileState();
}

class _ListProfileState extends State<ListProfile> {
  late ScrollController _scrollController;
  double scrollPrevious = 0;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(addListenerScroll);

    super.initState();
  }

  void addListenerScroll() {
    if (_scrollController.offset > scrollPrevious) {
      BlocProvider.of<GeneralBloc>(context)
          .add(OnShowOrHideMenuEvent(showMenu: false));
    } else {
      BlocProvider.of<GeneralBloc>(context)
          .add(OnShowOrHideMenuEvent(showMenu: true));
    }
    scrollPrevious = _scrollController.offset;
  }

  @override
  void dispose() {
    _scrollController.removeListener(addListenerScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    final size = MediaQuery.of(context).size;

    return ListView(
      controller: _scrollController,
      children: [
        const SizedBox(height: 25.0),
        const Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: TextFrave(
            text: 'Admin',
            fontSize: 17,
            color: Colors.grey,
          ),
        ),
        Container(
          height: 60,
          width: size.width,
          decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.light
                  ? Color.fromRGBO(20, 21, 23, 1)
                  : Colors.white,
              borderRadius: BorderRadius.circular(30.0)),
          child: Column(
            children: [
              CardItemProfile(
                text: 'Add  Member',
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0)),
                icon: Icons.person_outline_rounded,
                backgroundColor: Color(0xff7882ff),
                onPressed: () {},
                // onPressed: () => Navigator.push(context, routeSlide(page: InformationPage())),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15.0),
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: const TextFrave(
            text: 'General',
            fontSize: 17,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 10.0),
        Container(
          height: 121,
          width: size.width,
          decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.light
                  ? const Color.fromRGBO(20, 21, 23, 1)
                  : Colors.white,
              borderRadius: BorderRadius.circular(30.0)),
          child: Column(
            children: [
              CardItemProfile(
                text: 'Notifications',
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                backgroundColor: Color(0xffE87092),
                icon: Icons.notifications_none_rounded,
                onPressed: () {},
              ),
              CardItemProfile(
                text: 'Add Device',
                backgroundColor: Color(0xff0716A5),
                icon: Icons.add,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30.0)),
                onPressed: () =>
                    Navigator.push(context, routeSlide(page: ShoppingPage())),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15.0),
        const Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: TextFrave(
            text: 'Personal',
            fontSize: 17,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 10.0),
        Container(
          height: 182,
          width: size.width,
          decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.light
                  ? Color.fromRGBO(20, 21, 23, 1)
                  : Colors.white,
              borderRadius: BorderRadius.circular(30.0)),
          child: Column(
            children: [
              CardItemProfile(
                text: 'Privacy & Policy',
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30.0)),
                backgroundColor: Color(0xff6dbd63),
                icon: Icons.policy_rounded,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return PolicyDialog(
                        mdFileName: 'privacy_policy.md',
                      );
                    },
                  );
                },
              ),
              CardItemProfile(
                text: 'Term & Conditions',
                borderRadius: BorderRadius.zero,
                backgroundColor: Color(0xff458bff),
                icon: Icons.description_outlined,
                onPressed: () {
                  showModal(
                    context: context,
                    configuration: FadeScaleTransitionConfiguration(),
                    builder: (context) {
                      return PolicyDialog(
                        mdFileName: 'terms_and_conditions.md',
                      );
                    },
                  );
                },
              ),
              CardItemProfile(
                text: 'Help',
                backgroundColor: Color(0xff4772e6),
                icon: Icons.help_outline,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30.0)),
                onPressed: () {},
              ),
            ],
          ),
        ),
        SizedBox(height: 25.0),
        CardItemProfile(
          text: 'Sign Out',
          borderRadius: BorderRadius.circular(50.0),
          icon: Icons.power_settings_new_sharp,
          backgroundColor: Colors.red,
          onPressed: () {

            authBloc..add(LogOutEvent());
            Navigator.pushAndRemoveUntil(context, routeSlide(page: LoadingPage()), (_) => false);
          },
        ),
      ],
    );
  }
}
