import 'package:flutter/material.dart';
import 'package:test_1/home.dart';
import 'Regis_page.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return new LoginState();
  }
}

class LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  String uname;
  String pass;

 void dispose(){
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        child: new Column(
          children: <Widget>[
            new Image.asset(
              'images/eiei.jpg',
              width: 170.0,
              height: 170.0,
            ),

            //form
         new Container(
              height: 280.0,
              width: 380.0,
              color: Colors.white,
              child: new Column(
                children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _userController,
                      validator: (value) {
                       uname = value;
                       if (value.isEmpty){
                         Scaffold.of(context)
                          .showSnackBar(SnackBar( content:Text('กรุณาระบุ user')));
                       }
                      },
                    decoration: new InputDecoration(
                      hintText: 'Username@email.com',
                      icon: new Icon(Icons.person)
                    ),
                  ),

                  new TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                     validator: (value2) {
                       pass = value2;
                     },
                    decoration: new InputDecoration(
                      hintText: 'Password',
                      icon: new Icon(Icons.lock)
                    ),
                  ),

                  new Padding(padding: new EdgeInsets.all(10.5)), //add padding
                  new Center(
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                          child:  new RaisedButton(
                            onPressed: (){
                              {
                                if (_formKey.currentState.validate()) {
                                  if(pass.isEmpty || uname.isEmpty){
                                    Scaffold.of(context)
                                        .showSnackBar(SnackBar(content: Text('กรุณาระบุ user หรือ password')));
                                  }
                                  else if(uname == 'admin' && pass == 'admin'){
                                    Scaffold.of(context)
                                        .showSnackBar(SnackBar(content: Text('user or password ไม่ถูกต้อง')));
                                  }
                                  else{
                                    print('Login Succeed');
                                    Navigator.push(
                                        context, MaterialPageRoute(builder: (context) => Main()));
                                  }
                                }
                              }
                              Navigator.push(
                              context, MaterialPageRoute(builder: (context) => Main()));
                            },
                            color: Colors.redAccent,
                            child: new Text("Login",
                            style: new TextStyle(color: Colors.white,
                            fontSize: 20.9)
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new Container(
                        child: new RawMaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context, MaterialPageRoute(builder: (context) => SignUp()));
                            },
                          child: new Text("Register New Account",
                          style: new TextStyle(color: Colors.blueAccent,
                          fontSize: 20.9)
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        )
      )
    );
  }
}