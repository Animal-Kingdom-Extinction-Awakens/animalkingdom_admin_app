import 'dart:io';

import 'package:animalkingdom_admin_app/src/interactor/entities/animal_form.dart';
import 'package:animalkingdom_admin_app/src/interactor/entities/rarity.dart';
import 'package:animalkingdom_admin_app/src/interactor/entities/specie.dart';
import 'package:animalkingdom_admin_app/src/interactor/utils/const.dart';
import 'package:animalkingdom_admin_app/src/ui/widgets/text_rarity.dart';
import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AnimalCustomForm extends StatefulWidget {
  final AnimalForm animal;
  final List<Specie> species;
  final List<Rarity> rarities;
  final Atom<AnimalForm?> action;
  final GlobalKey<FormState> formKey;
  final bool isEdit;

  const AnimalCustomForm({
    super.key,
    required this.animal,
    required this.species,
    required this.rarities,
    required this.action,
    required this.formKey,
    required this.isEdit,
  });

  @override
  State<AnimalCustomForm> createState() => _AnimalFormState();
}

class _AnimalFormState extends State<AnimalCustomForm> {
  @override
  Widget build(BuildContext context) {
    final animal = widget.animal;
    final species = widget.species;
    final rarities = widget.rarities;
    final action = widget.action;
    final _formKey = widget.formKey;
    final isEdit = widget.isEdit;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            action.setValue(animal);
          }
        },
        child: const Icon(Icons.save),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    isEdit ? 'Editar Animal' : 'Criar Animal',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Nome',
                          ),
                          maxLength: 20,
                          initialValue: animal.name,
                          onChanged: (value) {
                            setState(() {
                              animal.name = value;
                            });
                          },
                          validator: (value) => value!.isEmpty
                              ? 'O nome do animal não pode ser vazio'
                              : null,
                        ),
                      ),
                      const SizedBox(width: 50),
                      Flexible(
                        child: DropdownButton(
                          items: _itensRarity(rarities),
                          value: rarities.firstWhere(
                            (rarity) => rarity.id == animal.idRarity,
                          ),
                          onChanged: (value) {
                            setState(() {
                              animal.idRarity = value.id;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Descrição',
                          ),
                          maxLength: 50,
                          initialValue: animal.description,
                          onChanged: (value) {
                            setState(() {
                              animal.description = value;
                            });
                          },
                          validator: (value) => value!.isEmpty
                              ? 'A descrição do animal não pode ser vazia'
                              : null,
                        ),
                      ),
                      const SizedBox(width: 50),
                      Flexible(
                        child: DropdownButton(
                          items: _itensSpecie(species),
                          value: species.firstWhere(
                            (specie) => specie.id == animal.idSpecie,
                          ),
                          onChanged: (value) {
                            setState(() {
                              animal.idSpecie = value.id;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final pickedImage = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      setState(() {
                        animal.image = pickedImage;
                      });
                    },
                    child: const Text('Selecionar Imagem'),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  if (animal.image == null)
                    const Text('Nenhuma imagem selecionada')
                  else
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: isEdit && animal.image?.path == ''
                          ? Image.network(
                              '$host/animals/${animal.id}/image',
                              height: 300,
                            )
                          : Image.file(
                              height: 300,
                              File(
                                animal.image?.path ?? '',
                              ),
                            ),
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  List<DropdownMenuItem> _itensRarity(List<Rarity> rarities) {
    final lsItemRarity = rarities.map((rarity) {
      return DropdownMenuItem<Rarity>(
        value: rarity,
        child: TextRarity(rarity: rarity),
      );
    }).toList();

    return lsItemRarity;
  }

  List<DropdownMenuItem> _itensSpecie(List<Specie> species) {
    final lsItemSpecie = species.map((specie) {
      return DropdownMenuItem<Specie>(
        value: specie,
        child: Text(specie.name),
      );
    }).toList();

    return lsItemSpecie;
  }
}
