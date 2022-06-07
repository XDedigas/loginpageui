import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginpageui/components/CampoColumn.dart';
import 'package:loginpageui/utilities/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _lembrarSenha = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.blue, Colors.indigo],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 50.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      CampoColumn(
                        nome: 'Email',
                        hint: 'Informe seu Email',
                        icone: Icons.email,
                        keybord: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 30.0),
                      CampoColumn(
                        nome: 'Senha',
                        hint: 'Informe a sua Senha',
                        icone: Icons.lock,
                        isCampoSenha: true,
                      ),
                      criaBotaoEsqueceuSenha(),
                      criaCheckboxLembrarSenha(),
                      criaBotaoLogin(),
                      criaInfoLogin(),
                      criaBotoesLoginRedeSocial(),
                      criaInfoCadastrarSe(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget criaInfoCadastrarSe() {
    return GestureDetector(
      onTap: () => print('Sign Up'),
      child: RichText(
        text: TextSpan(
          children: [
            textSpanInfoCadastraSe('Não possui uma conta? ', FontWeight.w400),
            textSpanInfoCadastraSe('Cadastre-se!', FontWeight.bold),
          ],
        ),
      ),
    );
  }

  TextSpan textSpanInfoCadastraSe(String texto, FontWeight? font) {
    return TextSpan(
      text: texto,
      style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: font),
    );
  }

  Widget criaBotoesLoginRedeSocial() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          criaBotaoLoginEspecifico(
            () => print('Login com Facebook'),
            AssetImage('assets/logos/facebook.jpg'),
          ),
          criaBotaoLoginEspecifico(
            () => print('Login com Google'),
            AssetImage('assets/logos/google.jpg'),
          ),
        ],
      ),
    );
  }

  Widget criaBotaoLoginEspecifico(Function()? onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget criaInfoLogin() {
    return Column(
      children: <Widget>[
        Text(
          '- OU -',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Text(
          'Login com',
          style: kLabelStyle,
        )
      ],
    );
  }

  Widget criaBotaoLogin() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ElevatedButton(
          onPressed: () => print('Login acionado!'),
          child: Text(
            'LOGIN',
            style: TextStyle(
              color: Colors.blue,
              letterSpacing: 1.5,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            elevation: 5,
            primary: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget criaBotaoEsqueceuSenha() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => print('Esqueceu senha!'),
        child: Text('Esqueceu sua senha?', style: kLabelStyle),
      ),
    );
  }

  Widget criaCheckboxLembrarSenha() {
    return SizedBox(
      height: 20.0,
      child: Row(children: <Widget>[
        Theme(
          data: ThemeData(unselectedWidgetColor: Colors.white),
          child: Checkbox(
            value: _lembrarSenha,
            checkColor: Colors.blue,
            activeColor: Colors.white,
            onChanged: (value) {
              setState(() {
                _lembrarSenha = value!;
              });
            },
          ),
        ),
        Text(
          'Lembrar-me',
          style: kLabelStyle,
        ),
      ]),
    );
  }
}
