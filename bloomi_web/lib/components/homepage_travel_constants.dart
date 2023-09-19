import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart';

final travelColumn1 = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      "Traveling is not just a journey of miles, it's a journey of moments, experiences, and self-discovery.",
      style: TextStyle(
        color: UtilConstants.naturePageTopicColor,
        fontSize: 25,
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(
            color: UtilConstants.naturePageShadowColor,
            blurRadius: 10,
            offset: const Offset(10, 10),
          ),
        ],
      ),
    ),
    const SizedBox(
      height: 5,
    ),
    const Text(
      "Traveling offers us a unique escape from the hustle and bustle of our daily lives. It's like a soothing song for our minds. When we venture out into new places, we give our minds a chance to relax and unwind. The gentle sounds of nature, like the rustling of leaves in the wind or the rhythmic crashing of waves along the shore, wash away the stress and worries that often clutter our thoughts.",
      style: TextStyle(fontSize: 20),
    ),
    const SizedBox(
      height: 5,
    ),
  ],
);
const travelColumn2 = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    SizedBox(
      height: 5,
    ),
    Text(
      "As we embark on our journeys, something magical happens. The familiar worries that usually weigh us down start to fade away. It's as if we leave behind the heavy backpack of stress and pick up a lighter one filled with wonder and excitement. Every step we take in an unfamiliar city, every mesmerizing sunset we witness in a foreign land, and every encounter with people from different cultures becomes a stroke of relaxation for our minds.",
      style: TextStyle(fontSize: 20),
    ),
    SizedBox(
      height: 5,
    ),
  ],
);
const travelColumn3 = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    SizedBox(
      height: 5,
    ),
    Text(
      "Traveling isn't just about moving from one place to another; it's a mental retreat. It's a chance to let go of the things that trouble us, to put aside our daily routines, and to fully immerse ourselves in the present moment. In those peaceful moments, like when we're hiking in the serene mountains or swaying gently in a hammock by the sea, our minds find a tranquil sanctuary. It's a place where our spirits can recharge, and our souls can take a deep breath, free from the usual worries and clutter.",
      style: TextStyle(fontSize: 20),
    ),
    SizedBox(
      height: 5,
    ),
  ],
);
const travelColumn4 = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    SizedBox(
      height: 5,
    ),
    Text(
      "The beauty of traveling lies in its ability to help us rediscover simplicity. In our everyday lives, we are often caught up in the whirlwind of complexity—endless tasks, constant notifications, and the never-ending rush. But when we travel, we strip away the unnecessary layers. We pack only what we need, both physically and mentally. It's like taking a step back in time when life was simpler. We savor local flavors, relish in the beauty of natural landscapes, and connect with people from diverse backgrounds. In this simplicity, our minds find solace, and the weight of the modern world is momentarily lifted, allowing us to truly relax and appreciate the uncomplicated joys of life.",
      style: TextStyle(fontSize: 20),
    ),
    SizedBox(
      height: 5,
    ),
  ],
);
