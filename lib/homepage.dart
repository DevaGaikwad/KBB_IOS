// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          //color: Colors.lightBlueAccent, // Background color for the container
          padding: const EdgeInsets.all(0.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Colors.grey,
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  'Selected Area: Kothrud',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 140.0, // Set the height of the carousel
                autoPlay: true, // Enable auto-play
                aspectRatio: 16 / 9,
                viewportFraction: 1.0, // Take full width of the container
              ),
              items: [
                'https://kudalebandhubhajiwale.com/images/banner-01.jpg',
                'https://kudalebandhubhajiwale.com/images/banner-02.jpg',
                'https://kudalebandhubhajiwale.com/images/banner-03.jpg',
              ]
                  .map((url) => Container(
                    child: Image.network(
                      width: MediaQuery.of(context).size.width,
                     url,
                      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                                color: Colors.green,
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                                  : null,
                            ),
                          );
                        }
                      },
                      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                        return Text('Failed to load image');
                      },
                    // width: MediaQuery.of(context).size.width, // Fixed width
                    fit: BoxFit.fill, // Crop the image to center
                    // errorWidget: (context, url, error) => const Icon(Icons.error), // Show an error icon if the image fails to load
                    ),

              ))
                  .toList(),
            ),
          ),
        ),
        const SizedBox(height: 12.0),
        Container(
          //color: Colors.lightBlueAccent, // Background color for the container
          padding: const EdgeInsets.all(0.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                //color: Colors.grey,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: const Text(
                  'Categories/ विभाग',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,fontWeight:FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 4.0), // Space between carousel and grid view
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Number of columns in the grid
              crossAxisSpacing: 8.0, // Horizontal spacing between items
              mainAxisSpacing: 8.0, // Vertical spacing between items
            ),
            padding: EdgeInsets.all(8.0),
            itemCount: 8, // Total number of items in the grid
            itemBuilder: (context, index) {
              return GridTile(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child:
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                         [
                          'http://kudalebandhubhajiwale.com/Categories/frt_veggie.jpg',
                          'http://kudalebandhubhajiwale.com/Categories/leafy.jpg',
                          'http://kudalebandhubhajiwale.com/Categories/fruits.png',
                          'http://kudalebandhubhajiwale.com/Categories/pulses.jpg',
                          'http://kudalebandhubhajiwale.com/Categories/grains.jpg',
                          'http://kudalebandhubhajiwale.com/Categories/dairy.png',
                          'http://kudalebandhubhajiwale.com/Categories/spices.png',
                          'http://kudalebandhubhajiwale.com/Categories/bakery.png',
                        ][index],
                        width: 100.0, // Fixed width
                        height: 100.0, // Fixed height
                        fit: BoxFit.cover, // Crop the image to center
                      ),
                )
                    ),
                    SizedBox(height: 2.0), // Space between image and text
                    Text(
                      [
                        "Fruity Vegetables / फळभाज्या" ,
                        "Leafy Vegetables/पालेभाज्या",
                        "Fruits/फळे",
                        "Pulses/कडधान्ये",
                        "Grains/धान्य",
                        "Dairy Products/दुग्ध उत्पादने",
                        "Spices/ मसाले पदार्थ",
                        "Bakery Products/ बेकरी उत्पादने"

                      ][index],// Text below the image
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
