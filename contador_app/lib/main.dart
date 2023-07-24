import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

//  Widget (MyApp) - Responsavel por todas as configs do app
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

//  Widget (StatefulWidget) - Responsavel por atualizar a tela
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //LOGICA DE PROGRAMAÇÃO

  int countPeople = 0;

  void removePeople() {
    setState(() {
      countPeople--;
    });

    print(countPeople);
  }

  void addPeople() {
    setState(() {
      countPeople++;
    });

    print(countPeople);
  }

  // Indicar se está vazio
  bool get isEmpty => countPeople == 0;

  // Indicar se está cheio
  bool get isFull => countPeople == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //cor de fundo
      backgroundColor: Color.fromARGB(226, 6, 183, 162),

      // coloca dentro de um container
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/image.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFull ? "Lotado !" : "Pode entrar !",
              style: TextStyle(
                fontSize: 50,
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 50),
            Text(
              "$countPeople",
              style: TextStyle(
                  fontSize: 150,
                  color: isFull ? Colors.red : Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  //botão 1
                  onPressed: isEmpty ? null : removePeople,
                  // personalizar o redor do botão 1
                  style: TextButton.styleFrom(
                    backgroundColor: isEmpty
                        ? Colors.white.withOpacity(0.50)
                        : Color.fromARGB(255, 255, 0, 0),
                    fixedSize: const Size(115, 115),
                    primary: Color.fromARGB(255, 0, 0, 0),
                    elevation: 15.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    isEmpty ? "Vazio" : "Saiu",
                    style: TextStyle(
                      fontSize: 19,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
                // separar os dois botoes #metodo 2
                const SizedBox(
                  width: 80,
                  height: 150,
                ),

                TextButton(
                  //botão 2
                  onPressed: isFull ? null : addPeople,
                  // personalizar o redor do botão 2
                  style: TextButton.styleFrom(
                    backgroundColor: isFull
                        ? Colors.white.withOpacity(0.50)
                        : Color.fromARGB(255, 43, 255, 0),
                    fixedSize: const Size(115, 115),
                    primary: Color.fromARGB(255, 0, 0, 0),
                    elevation: 15.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    isFull ? "Esgotado" : "Entrou",
                    style: TextStyle(
                      fontSize: 19,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
