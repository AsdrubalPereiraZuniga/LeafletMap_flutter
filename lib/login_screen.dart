import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
    @override
    _LoginScreenState createState () => _LoginScreenState ();
}

class _LoginScreenState extends State < LoginScreen > {
    TextEditingController _usernameController = TextEditingController ();
    TextEditingController _passwordController = TextEditingController ();

    void _login () {
        // Validación simple (en un caso real se validar a contra un servidor 
        if ( _usernameController.text.isNotEmpty &&
            _passwordController.text.isNotEmpty ) {
            Navigator.pushReplacementNamed ( context , '/home');
        } else {
            // Mostrar mensaje de error
            ScaffoldMessenger.of( context ). showSnackBar (
                SnackBar ( content : Text ('Por favor , ingrese usuario y contraseña ')
                ),
            );
        }
    }

@override
Widget build ( BuildContext context ) {
    return Scaffold (
        appBar : AppBar (
            title : Text ('Inicio de Sesión') ,
        ),
        body : Padding (
            padding : const EdgeInsets .all (16.0) ,
            child : Column (
                mainAxisAlignment : MainAxisAlignment . center ,
                children : [
                    TextField (
                        controller : _usernameController ,
                        decoration : InputDecoration (
                            labelText : 'Usuario',
                            border : OutlineInputBorder () ,
                        ),
                    ),
                    SizedBox ( height : 20) ,
                    TextField (
                        controller : _passwordController ,
                        obscureText : true ,
                        decoration : InputDecoration (
                            labelText : 'Contraseña',
                            border : OutlineInputBorder () ,
                        ),
                    ),
                    SizedBox ( height : 20) ,
                    ElevatedButton (
                        onPressed : _login ,
                        child : Text ('Ingresar ') ,
                    ),
                ],
            ),
        ),
    );
}
}