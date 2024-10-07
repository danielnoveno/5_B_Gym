import 'package:flutter/material.dart';
import 'package:gd_widget2_b_11663/data/trainer.dart';

class ListNamaView extends StatelessWidget {
  const ListNamaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Nama"),
      ),
      // backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: LayoutBuilder(builder: (context, Constraints) {
        if (Constraints.maxWidth > 600) {
          return const WideLayout();
        } else {
          return const NarrowLayout();
        }
      }),
    );
  }
}

class NarrowLayout extends StatelessWidget {
  const NarrowLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return TrainerList(
      onTrainerTap: (trainer) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(),
            body: TrainerDetail(trainer),
          ),
        ),
      ),
    );
  }
}

class WideLayout extends StatefulWidget {
  const WideLayout({super.key});

  @override
  State<WideLayout> createState() => _WideLayoutState();
}

class _WideLayoutState extends State<WideLayout> {
  Trainer? _trainer;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 300,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: TrainerList(
              onTrainerTap: (trainer) => setState(() => _trainer = trainer),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child:
              _trainer == null ? const Placeholder() : TrainerDetail(_trainer!),
        ),
      ],
    );
  }
}

class TrainerList extends StatelessWidget {
  final void Function(Trainer) onTrainerTap;
  const TrainerList({super.key, required this.onTrainerTap});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      for (var trainer in trainer)
        ListTile(
            leading: Image.network(trainer.picture),
            title: Text(trainer.name),
            onTap: () => onTrainerTap(trainer)),
    ]);
  }
}

class TrainerDetail extends StatelessWidget {
  final Trainer trainer;
  const TrainerDetail(this.trainer, {super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext, BoxConstraints) {
      return Center(
        child: BoxConstraints.maxHeight > 200
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    trainer.picture,
                    width: 100, // You can adjust the size as needed
                    height: 100,
                  ),
                  MouseRegion(
                    onHover: (_) => {print("Hello World")},
                    child: Text(trainer.name),
                  ),
                  Text("Berat Badan : ${trainer.phone}"),
                  Text("Tinggi: ${trainer.tinggi}"),
                  Text("${trainer.beratBadan}"),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Contact Me"),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MouseRegion(
                    onEnter: (_) => {print("Hello World")},
                    child: Text(trainer.name),
                  ),
                  Text(trainer.phone),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Contact Me"),
                  ),
                ],
              ),
      );
    });
  }
}
