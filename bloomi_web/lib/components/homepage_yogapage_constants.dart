import 'package:bloomi_web/components/homepage_card_widget_self.dart';
import 'package:bloomi_web/components/homepage_card_widget_yoga.dart';
import 'package:bloomi_web/components/homepage_class.dart';
import 'package:bloomi_web/utils/util_constant.dart';
import 'package:flutter/material.dart'
    show
        Card,
        Column,
        CrossAxisAlignment,
        Expanded,
        FontWeight,
        Row,
        SizedBox,
        Text,
        TextStyle;

const double kDouble5 = 5.0;
const double kDouble10 = 10.0;
const double kDouble20 = 20.0;
const double kDouble40 = 40.0;

const String yogaDescription1 =
    "Yoga exercises have experienced a surge in popularity, and for good reason—they are like a mental spa day that your mind craves. This ancient practice combines gentle movements with techniques that help you breathe deeply and focus your thoughts. Think of it as a mindful journey that guides you toward tranquility. When you embrace yoga as a part of your regular routine, its benefits start to shine. It's a formidable stress-buster, working like a magic eraser for those feelings of tension, anxiety, and even those bouts of sadness. Imagine it as your mental reset button, helping you find calmness amid life's hustle and bustle.";

const String yogaDescription2 =
    "But yoga isn't just about stress relief. It's like a wise friend who helps you decode your emotions and manage them with grace. This practice encourages self-compassion, emotional balance, and a sunny outlook on life. It's like having a superpower for your mind that empowers you to find your inner peace and maintain it, even when life throws its curveballs. So, if you're on the lookout for a natural and healthy way to boost your mental well-being, yoga is a superb choice. Think of it as a spa day for your mind, a rejuvenating experience that can genuinely make your life more joyful and rewarding.";

const String yogaDescription3 =
    "The times of vulnerabilities, digital dependency, and a stressful lifestyle are at an all-time high. What hampers most is the mental health of an individual. While we have devised ways to overcome our physical health issues, what about our mental health?";

const String yogaDescription4 =
    "Yoga is one such timeless strategy that isn’t just an incredible pressure reliever yet, in addition, helps to get over the issues of sleep deprivation, tension, and unwanted frustration.Rehearsing specific yoga asanas routinely would keenly help to enhance perseverance and aids in mood relaxation with physical fitness as a plus. So, it’s like an all-in-one stop for you!";

const String yogaDescription5 =
    "Here are some of the best yoga exercises for your mental health which would lead to a positive outlook towards life and will improve your health drastically.";

final yogaActvity1 = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    const Text(
      "01. Uttanasana",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    const SizedBox(
      height: 5,
    ),
    CardWidgetSelf(
      items: ItemClass(title: "", imagePath: UtilConstants.uttanasanaImagePath),
    ),
    const SizedBox(
      height: 5,
    ),
    const Text(
      "This yoga asana is focused on building strength and flexibility. It works on the back muscles and is basically a stretch-forward pose.In this asana, the head is positioned below the heart thus facilitating oxygenated blood to reach the brain. Uttanasana brings about relaxation, relieves anxiety, and helps calm the mind. It also helps in a better blood flow thus improving the circulatory system.",
      style: TextStyle(fontSize: 20),
    ),
    const SizedBox(
      height: 5,
    ),
    const Text(
      'How to perform:',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const SizedBox(
      height: 5,
    ),
    const Text(
      '01. Stand straight and keep your hands on the hips and inhale.',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const Text(
      '02. Extend your hands above you and bend down your torso forward upon exhaling.',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const Text(
      '03. Keep bending and bring your hands to rest on the ground next to your feet.',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const Text(
      '04. Stay in the same pose for around 10-15 seconds and release slowly using your abs. ',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const Text(
      '05. Ensure to keep your knees straight while performing this asana.',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const SizedBox(
      height: 5,
    ),
  ],
);

final yogaActvity2 = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    const Text(
      "02. Viparita Karani",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    const SizedBox(
      height: 5,
    ),
    CardWidgetSelf(
      items: ItemClass(title: "", imagePath: UtilConstants.viparitaImagePath),
    ),
    const SizedBox(
      height: 5,
    ),
    const Text(
      "A very simple asana, Viparita Karani is one of the most effective of all. It aids in relieving anxiety and helping you in staying calm and relaxed.Further, it also stimulates the nervous system, facilitates smooth blood flow, and aids in curing depression and treating insomnia.",
      style: TextStyle(fontSize: 20),
    ),
    const SizedBox(
      height: 5,
    ),
    const Text(
      'How to perform:',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const SizedBox(
      height: 5,
    ),
    const Text(
      '01. Lie flat on your back with your buttocks as near to the wall as possible; you can support your back with a cushion. ',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const Text(
      '02. Slowly and deeply inhale. Walk up the wall and place your feet flat against it. Feel the pressure on your hamstrings by tilting your toes towards your body.',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const Text(
      '03. Maintain a stretch on either side of your body with your hands. Hold this position for at least five minutes, focusing on slow, deep breathing.',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const SizedBox(
      height: 5,
    ),
  ],
);

final yogaActvity3 = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    const Text(
      "03. Shavasana",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    const SizedBox(
      height: 5,
    ),
    CardWidgetSelf(
      items: ItemClass(title: "", imagePath: UtilConstants.shavasanaImagePath),
    ),
    const SizedBox(
      height: 5,
    ),
    const Text(
      "Probably one of the most no-hustle kinds of asana on the list, Shavasana is usually done at the end of the yoga session.It is an excellent technique for meditating, relaxing, and calming the mind, and empowering the Connection Between Your Soul And Body. Sleeping during this asana is not allowed!",
      style: TextStyle(fontSize: 20),
    ),
    const SizedBox(
      height: 5,
    ),
    const Text(
      'How to perform:',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const SizedBox(
      height: 5,
    ),
    const Text(
      '01. Lie flat on your back with your torso straight and your arms at your sides, palms facing up.',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const Text(
      '02. Close your eyes and keep them closed for at least five minutes.',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const Text(
      '03. While meditating, try counting your breaths.',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const SizedBox(
      height: 5,
    ),
  ],
);

final yogaActvity4 = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    const Text(
      "04. Balasana",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    const SizedBox(
      height: 5,
    ),
    Row(
      children: [
        Expanded(
          child: Card(
            child: CardWidgetYoga(
              items: ItemClass(
                  title: '', imagePath: UtilConstants.balasanaOneImagePath),
            ),
          ),
        ),
        Expanded(
          child: Card(
            child: CardWidgetYoga(
              items: ItemClass(
                  title: '', imagePath: UtilConstants.balasanaTwoImagePath),
            ),
          ),
        ),
      ],
    ),
    const SizedBox(
      height: 5,
    ),
    const Text(
      "Also known as the baby pose, Balasana is an extremely useful technique that favors stretching of the entire body including your hip joint and muscles.It maintains overall balance and energy and enhances the blood circulation capacity of the body. Balasana also aids in relieving stress and anxiety and helps to keep the mind calm and composed.",
      style: TextStyle(fontSize: 20),
    ),
    const SizedBox(
      height: 5,
    ),
    const Text(
      'How to perform:',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const SizedBox(
      height: 5,
    ),
    const Text(
      '01. Get down on your knees and maintain a straight spine. Slowly bend forward until both thighs are in contact with the chest.',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const Text(
      '02. Continue bending forward until your head reaches the ground beyond the knee.',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const Text(
      '03. Straighten both arms backward, palms towards the floor, on either side of your legs.',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const Text(
      '04. Hold this position for 20-25 seconds, then rest for a few seconds before repeating 2-3 times more.',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const SizedBox(
      height: 5,
    ),
  ],
);

final yogaActvity5 = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    const Text(
      "05. Setu Bandhasana",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    const SizedBox(
      height: 5,
    ),
    CardWidgetSelf(
      items: ItemClass(title: "", imagePath: UtilConstants.setuImagePath),
    ),
    const SizedBox(
      height: 5,
    ),
    const Text(
      "For those with arthritis, this yoga asana is a boon! It helps in strengthening the leg, thigh, and back muscles and also helps in curing osteoporosis.Also called the Bridge Pose, this asana is one of the most well-to-do postures for a relaxed mind and restoring calmness and peace.",
      style: TextStyle(fontSize: 20),
    ),
    const SizedBox(
      height: 5,
    ),
    const Text(
      'How to perform:',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const SizedBox(
      height: 5,
    ),
    const Text(
      '01. Lay down on your back to begin the position. Bend your elbows and knees now.',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const Text(
      '02. Place your hands firmly on either side of your head and your feet flat on the floor near to your hips.',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const Text(
      '03. Slowly lift your body into the air while keeping both your hands and legs on the ground.',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const Text(
      '04. Hold this arching stance for 20-30 seconds before slowly rising to a standing position.',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const SizedBox(
      height: 5,
    ),
  ],
);

final yogaActvity6 = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    const Text(
      "06. Anjaneyasana",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    const SizedBox(
      height: 5,
    ),
    CardWidgetSelf(
      items:
          ItemClass(title: "", imagePath: UtilConstants.anjaneyasanaImagePath),
    ),
    const SizedBox(
      height: 5,
    ),
    const Text(
      "This asana technique is beneficial in improving your blood flow and calming and relaxing your mind.Moreover, this asana also helps in maintaining the balance o0f the body and provides a great stretch to the hips and abdomen muscles.For those constantly requiring focus and concentration in their lives, this asana, also called ‘the high lunge’, is definitely a must-add in your exercise regime.",
      style: TextStyle(fontSize: 20),
    ),
    const SizedBox(
      height: 5,
    ),
    const Text(
      'How to perform:',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const SizedBox(
      height: 5,
    ),
    const Text(
      '01. Lunge one leg forward while standing.',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const Text(
      '02. Bend your front knee and lengthen your rear leg, making sure your knee is in line with your ankle.',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const Text(
      '03. On both ankles, press your ankles flat against the ground.',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const Text(
      '04. Raise your arms to the sky and clasp your hands together.',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const Text(
      '05. Deeply inhale and exhale in a steady stream.',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const Text(
      '06. Repeat for a total of 5 times per leg.',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const Text(
      '07. Make sure your knees align with your ankle. The front knee should be at a 90-degree angle otherwise, it can also harm your joints.',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const SizedBox(
      height: 5,
    ),
  ],
);

final yogaActvity7 = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    const Text(
      "07. Garudasana",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    const SizedBox(
      height: 5,
    ),
    CardWidgetSelf(
      items: ItemClass(title: "", imagePath: UtilConstants.garudasanaImagePath),
    ),
    const SizedBox(
      height: 5,
    ),
    const Text(
      "This pose is also called the eagle pose. While maintaining body balance, this asana also prevents anxiety attacks and improves focus and concentration.It also strengthens and stretches the ankles and calves alongside maintaining the flexibility of thighs, hips, shoulders, and upper back.",
      style: TextStyle(fontSize: 20),
    ),
    const SizedBox(
      height: 5,
    ),
    const Text(
      'How to perform:',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const SizedBox(
      height: 5,
    ),
    const Text(
      '01. Take a deep breath and move your weight to one leg.',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const Text(
      '02. Wrap one leg around the other slowly.',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const Text(
      '03. Sink your hips and bend your knees slightly.',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const Text(
      '04. Maintain a flat ankle on the ground.',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const Text(
      '05. Maintain a steady, leisurely breathing pattern.',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const Text(
      '06. At the elbows and wrists, wrap one arm over the other.',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const Text(
      '07. Do not attempt this position alone; it requires a great deal of balance and concentration.',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const Text(
      '08. Go gently through each portion of the posture, and if you experience any pain, stop and restart after a little break.',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const SizedBox(
      height: 5,
    ),
  ],
);
