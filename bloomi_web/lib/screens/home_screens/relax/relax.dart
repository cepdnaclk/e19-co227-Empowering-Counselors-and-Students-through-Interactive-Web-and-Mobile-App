import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class Relax extends StatefulWidget {
  const Relax({super.key});

  @override
  State<Relax> createState() => _RelaxState();
}

class _RelaxState extends State<Relax> {
  final List<String> videoUrls = [
    "https://www.youtube.com/embed/lE6RYpe9IT0?si=z94H2SLrfOw2aAzw",
    "https://www.youtube.com/embed/BBoV0cfUZCc?si=c6PyX9pq36M1kFYK",
    "https://www.youtube.com/embed/KfYkzXTut1Y?si=klx4qeiAsFJnunSB",
    "https://www.youtube.com/embed/UgHKb_7884o?si=NjhJQ5JcqVLLU1cs",
    "https://www.youtube.com/embed/vPhg6sc1Mk4?si=vHoCS5el5Hxboz-v",
    "https://www.youtube.com/embed/goqqLfrXzhI?si=mc6diBb9FmnouU3K",
    "https://www.youtube.com/embed/nmmNWj9YtAw?si=hB3m2jAnesfNAEcd",

    //------------------------same url------------------------
    "https://www.youtube.com/embed/lE6RYpe9IT0?si=z94H2SLrfOw2aAzw",
    "https://www.youtube.com/embed/BBoV0cfUZCc?si=c6PyX9pq36M1kFYK",
    "https://www.youtube.com/embed/KfYkzXTut1Y?si=klx4qeiAsFJnunSB",
    "https://www.youtube.com/embed/UgHKb_7884o?si=NjhJQ5JcqVLLU1cs",
    "https://www.youtube.com/embed/vPhg6sc1Mk4?si=vHoCS5el5Hxboz-v",
    "https://www.youtube.com/embed/goqqLfrXzhI?si=mc6diBb9FmnouU3K",
    "https://www.youtube.com/embed/nmmNWj9YtAw?si=hB3m2jAnesfNAEcd",
    "https://www.youtube.com/embed/lE6RYpe9IT0?si=z94H2SLrfOw2aAzw",
    "https://www.youtube.com/embed/BBoV0cfUZCc?si=c6PyX9pq36M1kFYK",
    "https://www.youtube.com/embed/KfYkzXTut1Y?si=klx4qeiAsFJnunSB",
    "https://www.youtube.com/embed/UgHKb_7884o?si=NjhJQ5JcqVLLU1cs",
    "https://www.youtube.com/embed/vPhg6sc1Mk4?si=vHoCS5el5Hxboz-v",
    "https://www.youtube.com/embed/goqqLfrXzhI?si=mc6diBb9FmnouU3K",

    // Add more video URLs here
  ];

  final List<String> data = [
    'Nature Relaxation Videos',
    'ASMR Videos',
    'Rain and Thunderstorm Videos',
    'Fireplace Videos',
    'Ocean Wave Videos',
    'Guided Meditation Videos',
    'Yoga and Tai Chi Videos',
    'Slow Motion Videos',
    'Aerial Drone Videos',
    'Relaxing Music Videos',
    'Space and Astronomy Videos',
    'Aquarium and Underwater Videos',
    'Art and Painting Videos',
    'Cooking and Baking Videos',
    'Travel and Exploration Videos',
    'Purring Cat or Dog Videos',
    'Bonsai Tree Trimming Videos',
    'Watercolor Painting Videos',
    'Ant Farm Videos',
    'Animated Relaxation Videos',
    // Add more mind-relaxing topics here
  ];

  final ScrollController _videoNameScrollController = ScrollController();
  final ScrollController _videoScrollController = ScrollController();
  final bool _scrollingEnabled = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: width * 0.25,
          color: Colors.grey[300],
          child: ListView.builder(
            controller: _videoNameScrollController,
            itemCount: videoUrls.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  _scrollToVideo(index);
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, top: 5, bottom: 5, right: 10),
                  child: Container(
                    width: width * 0.24,
                    height: 50,
                    alignment: Alignment.center,
                    color: Colors.black,
                    child: Text(
                      data[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          width: width * 0.61,
          child: ListView.builder(
            controller: _videoScrollController,
            itemCount: videoUrls.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                    left: 50, top: 20, bottom: 20, right: 50),
                child: HtmlWidget(
                  '<div style="width: 400px; height: 500px;"><iframe src="${videoUrls[index]}"></iframe></div>',
                  factoryBuilder: () => MyWidgetFactory(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void _scrollToVideo(int index) {
    if (_scrollingEnabled) {}

    // Scroll the video list to the selected video
    _videoScrollController.animateTo(
      index * 480.0 + index * 5,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }
}

class MyWidgetFactory extends WidgetFactory {
  @override
  bool get webViewMediaPlaybackAlwaysAllow => true;

  @override
  String? get webViewUserAgent => 'My app';
}
