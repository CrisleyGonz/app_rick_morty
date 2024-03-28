import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_test/constants/constants.dart';
import 'package:work_test/models/models.dart';
import 'package:work_test/pages/home/home.dart';
import 'package:work_test/widgets/widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF0F0F0),
        appBar: AppBar(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ConstantsImages.getImagePath(
                    imageName: ConstantsImages.logo1)),
                const Icon(Icons.add, color: Colors.black),
                Image.asset(ConstantsImages.getImagePath(
                    imageName: ConstantsImages.logo2))
              ],
            )),
        body: const SafeArea(child: _Content()),
      ),
    );
  }
}

class _Content extends StatefulWidget {
  const _Content();

  @override
  State<_Content> createState() => __ContentState();
}

class __ContentState extends State<_Content> {
  late HomeCubit cubit;
  late ScrollController _scrollController;

  @override
  void initState() {
    cubit = context.read<HomeCubit>();
    _scrollController = ScrollController();

    cubit.getCharacters();

    // Pagination
    _scrollController.addListener(() {
      final position = _scrollController.position.pixels;
      final maxExtend = _scrollController.position.maxScrollExtent;

      // Si la variable que contiene la pagina es negativa, hemos llegado al final de la lista
      if ((position > maxExtend - 200) && (!cubit.state.page.isNegative)) {
        if (cubit.state.isLoading) return;
        cubit.getCharacters(isLoading: true);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          (previous.sectionStatus != current.sectionStatus ||
              previous.ultimate != current.ultimate),
      builder: (context, state) {
        // Evaluando el status
        switch (state.sectionStatus) {
          case SectionStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case SectionStatus.error:
            return Center(
              child: ErrorMessage(onPressed: () => cubit.getCharacters()),
            );
          case SectionStatus.ok:
            return BlocBuilder<HomeCubit, HomeState>(
              buildWhen: (previous, current) =>
                  (previous.ultimate != current.ultimate ||
                      previous.isLoading != current.isLoading),
              builder: (context, state) {
                return (state.ultimate.isNotEmpty)
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: ListView.separated(
                              shrinkWrap: true,
                              controller: _scrollController,
                              itemCount: state.ultimate.length,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 16),
                              itemBuilder: (context, index) {
                                if (state.ultimate[index] is CharacterModel) {
                                  return CharacterCard(
                                      characterModel: state.ultimate[index]);
                                } else {
                                  return PokemonCard(
                                      pokemon: state.ultimate[index]);
                                }
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 16),
                            ),
                          ),
                          (state.isLoading)
                              ? const CircularProgressIndicator()
                              : const SizedBox.shrink(),
                        ],
                      )
                    : const Center(
                        child: Text("Datos vacios."),
                      );
              },
            );
          default:
            return const Placeholder();
        }
      },
    );
  }
}
