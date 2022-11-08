import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/provider.dart';
import '../services/services.dart';
import '../themes/theme.dart';
import '../widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
            child: Column(
              children:  [
               const SizedBox( height: 200,),
                CardContainer( 
                  child: Column(
                    children: [
                       const Text('Registro', style: TextStyle( fontSize: 28, color: ColorsApp.gremory ),), 
                       const SizedBox( height: 20,),
                       ChangeNotifierProvider(create: ( _ ) => FormProvider(), 
                        child: _FormEmail(),
                        ),
                    ]
                    )),
                const SizedBox( height: 20,),
                 MaterialButton(
                  minWidth: 220,
                  height: 50,
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10)),
                  disabledColor: ColorsApp.grey,
                  elevation: 0,
                  color: ColorsApp.green ,
                  onPressed: ()=> Navigator.pushReplacementNamed(context, 'login'),
                  child: Text( 'Iniciar sesión', style: TextStyle( fontSize: 18, color: Colors.black87 ))),
                const SizedBox( height: 20,),
                MaterialButton(
                  minWidth: 220,    
                  height: 50,              
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10)),
                  disabledColor: ColorsApp.grey,
                  elevation: 0,
                  color: ColorsApp.white,
                  onPressed: ()=> Navigator.pushReplacementNamed(context, 'home'),
                  child: Text( 'Ingresar con Google', style: TextStyle( fontSize: 18, color: Colors.black87 ))),
                const SizedBox( height: 40,),

              ]
              )),
      ),
    );
  }
}

class _FormEmail extends StatelessWidget {  

  @override
  Widget build(BuildContext context) {

    final formProvider = Provider.of<FormProvider>(context);

    return Form(
      key: formProvider.formKeyProvider,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
         TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoracion(hintText: 'Example@gmail.com', labelText: 'Correo electronico', prefixIcon: Icons.alternate_email),
              onChanged: ( value ) => formProvider.email = value,             
              validator: (value) {
                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp  = new RegExp(pattern);
                return regExp.hasMatch(value ?? '')
                  ? null 
                  : 'El valor ingresado no es un correo';                
              },
            ),
            const SizedBox( height: 30,),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              onChanged: ( value ) => formProvider.password = value,  
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoracion(hintText: '********', labelText: 'Contraseña', prefixIcon: Icons.lock_outline),
              validator: (value) {
                 return ( value != null && value.length >= 6 ) 
                    ? null
                    : 'La contraseña debe de ser de 6 caracteres';               
              },
            
            ),
            const SizedBox( height: 30,),
             MaterialButton(
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: ColorsApp.gremory ,
               onPressed:formProvider.isLoading ? null : () async {                
                FocusScope.of(context).unfocus();            
                final authService = Provider.of<AuthService>(context, listen: false);

                if( !formProvider.isValidForm() ) return;
                formProvider.isLoading = true;

                final String? message = await authService.createUser(formProvider.email, formProvider.password);
                if ( message == null){
                  Navigator.pushReplacementNamed(context, 'home');
                } else {
                  NotificationsService.showSnackbar(  message );
                  formProvider.isLoading = false;       
                }      

              },
              child: Container(
                padding:  const EdgeInsets.symmetric(horizontal: 70, vertical: 20),
                child: const Text('Registrar',
                  style: TextStyle( color: Colors.white ),
                ))),
        ],
      ),
    );
  }
}
