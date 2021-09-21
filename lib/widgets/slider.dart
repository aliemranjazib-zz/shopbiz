import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopbiz/utils/contants.dart';

class CSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: caoursel.length,
      options: CarouselOptions(
        autoPlay: true,
        viewportFraction: 0.84,
        enlargeCenterPage: true,
      ),
      itemBuilder: (BuildContext context, int index, int page) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
            20,
          )),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  20,
                ),
                child: Image(
                    image: CachedNetworkImageProvider(
                  caoursel[index].images,
                )),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black54.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                ),
                width: double.infinity,
                height: double.infinity,
                child: Center(
                  child: Text(
                    caoursel[index].text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
