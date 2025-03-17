import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
    @override
    Widget build ( BuildContext context ) {
        return Scaffold (
            appBar : AppBar (
                title : Text ('Home') ,
                actions: [
                    IconButton(
                        icon: Icon(Icons.person),
                        onPressed: () {
                            Navigator.pushNamed(context, '/profile');
                        },
                    )
                ],
            ),
            body : Center (
                child : Text (
                    'Bienvenido a la aplicación',
                    style : TextStyle ( fontSize : 24) ,
                ),
            ),
            drawer : Drawer (
                child : ListView (
                    padding : EdgeInsets .zero ,
                    children : <Widget > [
                        DrawerHeader (
                            decoration : BoxDecoration (
                                color : Colors .blue ,
                            ),
                            child : Text (
                                'Men',
                                style : TextStyle (
                                    color : Colors .white ,
                                    fontSize : 24,
                                ),
                            ),
                        ),
                        ListTile (
                            leading : Icon ( Icons . home ),
                            title : Text ('Home' ) ,
                            onTap : () {
                                Navigator.pop( context );
                            },
                        ),
                        ListTile (
                            leading : Icon ( Icons . person ),
                            title : Text ('Perfil') ,
                            onTap : () {
                                Navigator.pushNamed ( context , '/profile');
                            },
                        ),
                    ],
                ),
            ),
        );
    }
}