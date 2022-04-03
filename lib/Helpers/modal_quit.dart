part of 'helpers.dart';

void modalExit(BuildContext context){

  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black45,
    builder: (context)
    => AlertDialog(
      title: Text('Warning'),
      content: Text('Do you really want to exit'),
      actions: [

        TextButton(
          onPressed: () { exit(1); },
          child: Text('Yes'),

        ),
        TextButton(
          onPressed: () { Navigator.pop(context, true); },
          child: Text('No'),

        ),
      ],
    )
  );

}