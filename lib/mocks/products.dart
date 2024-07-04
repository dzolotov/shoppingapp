import '../models/product.dart';

const predefinedProducts = [
  ProductInfo(
    id: 1,
    category: 1,
    image: 'balloons0.jpg',
    title: {'ru': 'Цветные шары', 'en': 'Colorful balloons'},
    description: {
      'ru':
          '''Цветные воздушные шары — это яркие и красочные аксессуары, которые украсят любой праздник. Они создадут атмосферу радости и веселья, а также станут прекрасным дополнением к любому подарку.
В нашем ассортименте представлены воздушные шары разных цветов: от классических до самых необычных оттенков. Вы можете выбрать набор воздушных шаров в соответствии с тематикой праздника или просто собрать свою уникальную композицию из шаров разных цветов.
Наши воздушные шары изготовлены из высококачественного латекса, который обеспечивает долговечность и прочность изделий. Благодаря этому, воздушные шары будут радовать вас своим ярким видом на протяжении всего праздника.
Мы предлагаем широкий выбор воздушных шаров по доступным ценам. Закажите цветные воздушные шары у нас и создайте незабываемую атмосферу на любом мероприятии!''',
      'en':
          '''Colored balloons are bright and colorful accessories that will decorate any holiday. They will create an atmosphere of joy and fun, and will also be a wonderful addition to any gift.
Our assortment includes balloons of different colors: from classic to the most unusual shades. You can choose a set of balloons in accordance with the theme of the holiday or simply assemble your own unique composition from balloons of different colors.
Our balloons are made of high quality latex, which ensures durability and strength of the products. Thanks to this, balloons will delight you with their bright appearance throughout the holiday.
We offer a wide selection of balloons at affordable prices. Order colored balloons from us and create an unforgettable atmosphere at any event!'''
    },
    price: 100.0,
  ),
  ProductInfo(
    id: 2,
    category: 1,
    image: 'balloons1.jpg',
    title: {'ru': 'Шары в горошек', 'en': 'Dot balloons'},
    description: {
      'ru':
          '''Воздушные шары в горошек — это универсальный и яркий элемент декора, который подойдёт для любого праздника. Они станут прекрасным дополнением к любому торжеству: дню рождения, свадьбе, корпоративу или детскому утреннику.
Шары изготовлены из высококачественного латекса и представлены в разных размерах. Вы можете выбрать как небольшие шарики для оформления помещения, так и крупные для создания эффектных композиций. Горошек на шарах может быть разного цвета, что позволяет подобрать вариант под любой интерьер или тематику мероприятия.
Наши воздушные шары в горошек долго держат форму и не сдуваются несколько дней. Это позволит вам наслаждаться ярким и красочным оформлением праздника долгое время.''',
      'en':
          '''Polka dot balloons are a versatile and bright decorative element that is suitable for any occasion. They will be a wonderful addition to any celebration: birthday, wedding, corporate party or children's party.
The balloons are made of high quality latex and are available in different sizes. You can choose both small balls to decorate the room and large ones to create spectacular compositions. Polka dots on balloons can be of different colors, which allows you to choose an option to suit any interior or theme of the event.
Our polka dot balloons keep their shape for a long time and do not deflate for several days. This will allow you to enjoy the bright and colorful decoration of the holiday for a long time.
'''
    },
    price: 200.0,
  ),
  ProductInfo(
    id: 3,
    category: 2,
    image: 'flowers0.jpg',
    title: {'ru': 'Букет из 25 красных роз', 'en': '25 red roses'},
    description: {
      'ru':
          '''Букет из 25 красных роз — это классический и элегантный подарок, который подойдёт для любого случая. Он станет прекрасным способом выразить любовь, благодарность или восхищение.
Букет состоит из 25 свежих и красивых красных роз, которые тщательно подобраны флористами. Розы имеют длинный стебель и крупные бутоны насыщенного красного цвета. Они упакованы в стильную упаковку, которая подчёркивает красоту цветов.
Этот букет подарит радость и счастье получателю, а также будет радовать его своей красотой долгое время.''',
      'en': '''
A bouquet of 25 red roses is a classic and elegant gift that is suitable for any occasion. It will be a wonderful way to express love, gratitude or admiration.
The bouquet consists of 25 fresh and beautiful red roses, which are carefully selected by florists. Roses have a long stem and large buds of rich red color. They are packaged in stylish packaging that emphasizes the beauty of the flowers.
This bouquet will give joy and happiness to the recipient, and will also delight him with its beauty for a long time.'''
    },
    price: 500.0,
  ),
  ProductInfo(
    id: 4,
    category: 3,
    image: 'candies0.jpg',
    title: {'ru': 'Коробка шоколадных конфет', 'en': 'Chocolate box'},
    description: {
      'ru':
          '''Коробка шоколадных конфет — это изысканное сочетание нежного шоколада и разнообразных начинок, которые подарят вам незабываемое наслаждение. Каждая конфета — это настоящее произведение искусства, созданное из высококачественных ингредиентов.
Коробка шоколадных конфет станет прекрасным подарком для любого случая или просто поводом порадовать себя. Она идеально подойдёт в качестве презента близким людям, друзьям или коллегам.
Откройте для себя мир неповторимого вкуса и насладитесь каждой конфетой!''',
      'en':
          '''A chocolate box is an exquisite combination of delicate chocolate and a variety of fillings that will give you an unforgettable pleasure. Each candy is a true work of art, created from high-quality ingredients.
A box of chocolates will be a wonderful gift for any occasion or just a reason to please yourself. It is ideal as a gift for loved ones, friends or colleagues.
Discover the world of unique taste and enjoy every candy!
'''
    },
    price: 230.0,
  ),
  ProductInfo(
    id: 5,
    category: 4,
    image: 'toys0.jpg',
    title: {'ru': 'Бурый медведь', 'en': 'Brown bear'},
    description: {
      'ru': '''
      Мягкая игрушка «Бурый медведь» — это милый и приятный на ощупь плюшевый друг, который подарит радость и уют вашему дому.
Игрушка выполнена из качественных материалов, которые безопасны для детей и взрослых. Она имеет приятную на ощупь поверхность и привлекательный дизайн.
«Бурый медведь» станет отличным подарком для ребёнка или взрослого, а также сможет украсить интерьер комнаты. Он может стать верным спутником во время сна или просто любимой игрушкой, которая всегда будет рядом.
Мягкая игрушка «Бурый медведь» подарит вам и вашим близким море положительных эмоций и приятных воспоминаний.''',
      'en':
          '''The soft toy “Brown Bear” is a cute and pleasant to the touch plush friend that will bring joy and comfort to your home.
The toy is made of high-quality materials that are safe for children and adults. It has a pleasant-to-touch surface and an attractive design.
“Brown Bear” will be an excellent gift for a child or adult, and can also decorate the interior of a room. He can become a faithful companion during sleep or just a favorite toy that will always be nearby.
The soft toy “Brown Bear” will give you and your loved ones a sea of ​​positive emotions and pleasant memories.
'''
    },
    price: 400.0,
  )
];
