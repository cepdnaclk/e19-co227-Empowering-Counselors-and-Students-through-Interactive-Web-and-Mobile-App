import 'dart:js';

import 'package:flutter/material.dart';

const double kDouble5 = 5.0;
const double kDouble10 = 10.0;
const double kDouble20 = 20.0;
const double kDouble40 = 40.0;

const String selfCareDescription1 =
    "Self-care is an essential practice that encompasses nurturing one's physical, emotional, and mental well-being. It is an act of self-compassion and self-respect. Engaging in self-care activities allows individuals to recharge and replenish their inner resources, enabling them to better navigate the demands of daily life. It involves a range of activities, from taking time for relaxation and leisure to maintaining a healthy lifestyle through exercise and nutrition. Self-care also involves setting boundaries, saying no when necessary, and seeking support when facing challenges. Ultimately, self-care is a powerful tool for achieving balance, resilience, and a sense of inner peace, enabling individuals to lead healthier, happier lives.";

const String selfCareDescription2 =
    "There are numerous activities and practices you can incorporate into your routine to improve self-care. These activities cater to various aspects of your well-being, including physical, emotional, and mental health. Here are some examples:";

/* const String rocketDescription3 =
    "(01). Exercise: \nRegular physical activity not only benefits your body but also releases endorphins, which boost your mood and reduce stress.\n\n(02). Healthy Eating: \nNourishing your body with a balanced diet rich in fruits, vegetables, and whole grains can have a profound impact on your energy levels and overall health.\n\n(03). Sleep: \nPrioritize getting enough sleep, as it is essential for physical and mental recovery. Aim for 7-9 hours of quality sleep each night.\n\n(04). Mindfulness and Meditation: \nPracticing mindfulness and meditation can help you manage stress, improve focus, and cultivate a sense of inner calm.\n\n(05). Journaling: \nWriting down your thoughts and feelings can be a therapeutic way to process emotions and gain clarity about your life.\n\n(06). Hobbies and Leisure Activities: \nEngaging in activities you enjoy, whether it's painting, gardening, reading, or playing a musical instrument, can provide relaxation and fulfillment.\n\n(07). Social Connections: \nSpend time with friends and loved ones. Building and nurturing social connections is vital for emotional well-being.\n\n(08). Setting Boundaries: \nLearn to say no when necessary and establish healthy boundaries to protect your time and energy.\n\n(09). Professional Support: \nDon't hesitate to seek help from a therapist, counselor, or coach when dealing with challenging emotional or mental issues.\n\n(10). Self-Compassion: \nPractice self-compassion by treating yourself with kindness, understanding, and forgiveness, just as you would a friend.\n\n(11). Digital Detox: \nTake breaks from screens and technology to reduce stress and improve sleep quality.\n\n(12). Regular Check-ups: \nDon't neglect your physical health; schedule regular check-ups with healthcare professionals to address any potential issues early.\n\n(13). Time Management: \nEfficiently manage your time to reduce stress and make space for self-care activities.\n\n(14). Gratitude Practice: \nCultivate gratitude by acknowledging and appreciating the positive aspects of your life.\n\n(15). Nature and Outdoors: \nSpend time in nature to refresh your mind and boost your mood.\n\n(16). Self-Reflection: \nSet aside time for introspection and self-reflection to gain a deeper understanding of yourself and your needs.\n\n(17). Creative Expression: \nExpress yourself creatively through art, writing, or other forms of self-expression.\n\n(18). Learning and Personal Growth: \nEngage in continuous learning and personal development to foster a sense of purpose and fulfillment.\n"; */

const activity1 = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      "01. Exercise",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    SizedBox(
      height: 5,
    ),
    Text(
      "Engaging in regular physical activity offers a multitude of benefits, extending beyond mere physical health. Exercise releases endorphins, the body's natural mood lifters, which contribute to a more positive emotional state and reduced stress levels. It enhances cardiovascular fitness, strengthens muscles, and promotes overall well-being. Incorporating physical activity into your routine is a powerful step toward a healthier, happier life.",
      style: TextStyle(fontSize: 20),
    ),
  ],
);
const activity2 = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Text(
      "02. Healthy Eating:",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    SizedBox(
      height: 5,
    ),
    Text(
      "Nourishing your body with a well-balanced diet, abundant in fruits, vegetables, and whole grains, can yield a profound influence on your vitality and overall well-being. This dietary approach provides essential nutrients, fuels energy levels, supports physical health, and bolsters mental clarity. It is a cornerstone of a healthy lifestyle, contributing to sustained wellness and an improved quality of life.",
      style: TextStyle(fontSize: 20),
    ),
  ],
);
const activity3 = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Text(
      "03. Sleep:",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    SizedBox(
      height: 5,
    ),
    Text(
      "Prioritize the importance of getting an adequate amount of sleep, as it plays a vital role in both physical and mental recovery. Strive for a consistent sleep routine, aiming for 7-9 hours of high-quality sleep each night. Sufficient sleep not only rejuvenates your body but also sharpens cognitive function, enhances mood stability, and fosters overall well-being. It is a cornerstone of a healthy and balanced lifestyle.",
      style: TextStyle(fontSize: 20),
    ),
  ],
);
const activity4 = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Text(
      "04. Mindfulness and Meditation:",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    SizedBox(
      height: 5,
    ),
    Text(
      "Practicing mindfulness and meditation can alleviate stress, enhance concentration, and foster a profound inner tranquility and emotional resilience. These practices empower individuals to navigate life's challenges with grace and heightened self-awareness.",
      style: TextStyle(fontSize: 20),
    ),
  ],
);
const activity5 = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Text(
      "05. Journaling:",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    SizedBox(
      height: 5,
    ),
    Text(
      "Writing down your thoughts and feelings can serve as a therapeutic avenue for processing emotions, fostering self-reflection, and gaining profound clarity regarding the various aspects of your life. This practice encourages emotional catharsis and personal growth, empowering individuals to make informed decisions and better understand their inner selves.",
      style: TextStyle(fontSize: 20),
    ),
  ],
);
const activity6 = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Text(
      "06. Hobbies and Leisure Activities:",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    SizedBox(
      height: 5,
    ),
    Text(
      "Participating in activities you genuinely enjoy, such as painting, gardening, reading, or playing a musical instrument, offers more than just relaxation; it provides profound fulfillment. These pursuits ignite your passions, nourish your creativity, and create moments of joy and contentment. They serve as an essential reservoir of happiness and a powerful means of self-expression, contributing to a well-rounded and satisfying life.",
      style: TextStyle(fontSize: 20),
    ),
  ],
);
const activity7 = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Text(
      "07. Social Connections:",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    SizedBox(
      height: 5,
    ),
    Text(
      "Spend quality time with friends and loved ones, for nurturing and fostering social connections is essential for maintaining emotional well-being. These bonds provide a powerful support system, enriching life with love, laughter, and shared experiences, ultimately contributing to a profound sense of happiness and emotional resilience.",
      style: TextStyle(fontSize: 20),
    ),
  ],
);
const activity8 = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Text(
      "08. Setting Boundaries:",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    SizedBox(
      height: 5,
    ),
    Text(
      "Learn the art of saying \"no\" when it's essential, and set firm yet compassionate boundaries to safeguard your precious time and energy. By doing so, you empower yourself to prioritize self-care, reduce overwhelm, and maintain a healthier, more balanced life that fosters personal well-being and personal growth.",
      style: TextStyle(fontSize: 20),
    ),
  ],
);
const activity9 = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Text(
      "09. Professional Support:",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    SizedBox(
      height: 5,
    ),
    Text(
      "Don't hesitate to reach out for support from a qualified therapist, counselor, or coach when facing complex emotional or mental challenges. Seeking professional help is a courageous step towards healing and personal growth. These experts provide guidance, strategies, and a safe space to explore and address your concerns, fostering emotional resilience and well-being on your journey towards a healthier, happier life.",
      style: TextStyle(fontSize: 20),
    ),
  ],
);
const activity10 = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Text(
      "10. Self-Compassion:",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    SizedBox(
      height: 5,
    ),
    Text(
      "Practice self-compassion by treating yourself with the same kindness, understanding, and forgiveness you readily offer to a dear friend. Cultivate a nurturing inner dialogue that acknowledges imperfections, embraces self-love, and bolsters emotional well-being, fostering a deeper connection with your own self and enhancing resilience in the face of life's challenges.",
      style: TextStyle(fontSize: 20),
    ),
  ],
);
const activity11 = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Text(
      "11. Digital Detox:",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    SizedBox(
      height: 5,
    ),
    Text(
      "Take regular breaks from screens and technology to alleviate stress and enhance the quality of your sleep. These digital detox moments enable relaxation, reduce eye strain, and help reset your body's natural sleep-wake cycle. The result is improved overall well-being, including better sleep patterns, increased focus, and a rejuvenated sense of mental and emotional clarity.",
      style: TextStyle(fontSize: 20),
    ),
  ],
);
const activity12 = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Text(
      "12. Regular Check-ups:",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    SizedBox(
      height: 5,
    ),
    Text(
      "Prioritize your physical health by scheduling routine check-ups with healthcare professionals. Regular medical examinations are essential for early detection and prevention of potential health issues. They empower you to take proactive steps toward maintaining your well-being and addressing any concerns promptly. By investing in preventive care, you ensure a healthier, longer-lasting life.",
      style: TextStyle(fontSize: 20),
    ),
  ],
);
const activity13 = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Text(
      "13. Time Management:",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    SizedBox(
      height: 5,
    ),
    Text(
      "Efficiently managing your time is a powerful strategy to minimize stress and create room for self-care endeavors. By prioritizing tasks, setting clear goals, and embracing effective time management techniques, you gain the freedom to nurture your well-being. This balanced approach allows for self-care rituals that rejuvenate your mind and body, ultimately leading to improved mental health and a greater sense of fulfillment.",
      style: TextStyle(fontSize: 20),
    ),
  ],
);
const activity14 = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Text(
      "14. Learning and Personal Growth:",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    SizedBox(
      height: 5,
    ),
    Text(
      "Engage in lifelong learning and personal growth to cultivate a profound sense of purpose and fulfillment in life. Embracing new knowledge, acquiring new skills, and seeking personal development opportunities not only expand your horizons but also provide a profound sense of achievement and meaning. This journey of self-improvement empowers you to navigate life's challenges with resilience and contributes to a more fulfilling and enriched existence.",
      style: TextStyle(fontSize: 20),
    ),
  ],
);
const activity15 = Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    Text(
      "15. Self-Reflection:",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
    SizedBox(
      height: 5,
    ),
    Text(
      "Allocate dedicated moments for introspection and self-reflection, allowing you to delve deeper into self-awareness and a profound understanding of your unique needs and aspirations. These reflective pauses nurture personal growth, enhance emotional intelligence, and provide valuable insights into your goals and values. They serve as a compass, guiding you towards a more authentic and purpose-driven life, fostering lasting fulfillment and contentment.",
      style: TextStyle(fontSize: 20),
    ),
  ],
);
