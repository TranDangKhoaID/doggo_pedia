import 'package:doggo_pedia/domain/models/breed.dart';
import 'package:doggo_pedia/presentation/breed/cubit/breed_cubit.dart';
import 'package:doggo_pedia/presentation/breed/cubit/breed_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class DetailBreedScreen extends StatefulWidget {
  final String imageID;
  final Breed breed;
  const DetailBreedScreen({
    super.key,
    required this.imageID,
    required this.breed,
  });

  @override
  State<DetailBreedScreen> createState() => _DetailBreedScreenState();
}

class _DetailBreedScreenState extends State<DetailBreedScreen> {
  @override
  void initState() {
    context.read<BreedCubit>().getImageOnBreeds(imageID: widget.imageID);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BreedCubit, BreedState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Dog #${widget.breed.id}'),
            elevation: 0,
          ),
          body: state.isLoading
              ? const Center(
                  child: Text(
                    'Loading...',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                  ),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: detailBreed(state),
                  ),
                ),
        );
      },
    );
  }

  Widget detailBreed(BreedState state) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: state.imageBreedsModel != null
              ? Image.network(
                  state.imageBreedsModel!.url,
                  fit: BoxFit.cover,
                )
              : const Icon(
                  Icons.favorite,
                ),
        ),
        Gap(15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.breed.name,
                style: const TextStyle(
                  fontSize: 28,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Gap(10),
              RichText(
                text: richText(
                  title: 'Origin: ',
                  content: widget.breed.origin ?? 'Unknown',
                ),
              ),
              Gap(10),
              RichText(
                text: richText(
                  title: 'Bred for: ',
                  content: widget.breed.name,
                ),
              ),
              Gap(10),
              RichText(
                text: richText(
                  title: 'Breed group: ',
                  content: widget.breed.breedGroup ?? 'Unknown',
                ),
              ),
              Gap(10),
              RichText(
                text: richText(
                  title: 'Lift span: ',
                  content: widget.breed.lifeSpan ?? 'Unknown',
                ),
              ),
              Divider(),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Height',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
              Gap(10),
              RichText(
                text: richText(
                  title: 'Imperial: ',
                  content: widget.breed.height.imperial,
                ),
              ),
              Gap(10),
              RichText(
                text: richText(
                  title: 'Metric: ',
                  content: widget.breed.height.metric,
                ),
              ),
              Divider(),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Weight',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
              Gap(10),
              RichText(
                text: richText(
                  title: 'Imperial: ',
                  content: widget.breed.weight.imperial,
                ),
              ),
              Gap(10),
              RichText(
                text: richText(
                  title: 'Metric: ',
                  content: widget.breed.weight.metric,
                ),
              ),
              Divider(),
              RichText(
                text: richText(
                  title: 'Temperament: ',
                  content: widget.breed.temperament ?? 'Unknown',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  TextSpan richText({
    required String title,
    required String content,
  }) {
    return TextSpan(
      style: TextStyle(
        fontSize: 18,
        color: Colors.black,
      ),
      children: <TextSpan>[
        TextSpan(
          text: title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: content,
        ),
      ],
    );
  }
}
