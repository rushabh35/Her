class CatalogModel {
  static final items = [
    Item(id: 1, name: "Menstrual Hygiene Management", desc: "Girls and women face substantial menstrual hygiene management (MHM) challenges in low- and middle-income countries.", color: "#33505a", image: "https://as1.ftcdn.net/v2/jpg/01/23/26/94/1000_F_123269449_Sfw5dkg80C2IXgQquhZYJIPqEl4gT0Nl.jpg"),
    Item(id: 2, name: "Feminine hygiene", desc: "Try pH-balanced feminine washes Regular soaps and shower gels aren't designed to be used on your vaginal area, because they have a pH level designed for the surface of your skin. ", color: "##7b79ed", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcinrrwGYTdBk6SFRI2ojtzVmBJlv3UVpOaQ&usqp=CAU"),
    Item(id: 3, name: "Menstrual health", desc: "Infrastructure: At least 367 million children have no sanitation services in their schools, and women and girls globally lack adequate facilities to manage their menstruation.", color: "##ed4564", image: "https://images.unsplash.com/photo-1603712509484-0a5004b4663e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZmVtaW5pbmUlMjBoeWdpZW5lfGVufDB8fDB8fA%3D%3D&w=1000&q=80"),
    // Item(id: 4, name: "Partido 4", desc: "Rayados vs Chivas", color: "#33505a", image: "https://raw.githubusercontent.com/Daniel-Hernandez-Jrz/GridViewFlutterDHJ/master/assets/images/6.jpg"),
    // Item(id: 5, name: "Partido 5", desc: "America vs Rayados", color: "#33505a", image: "https://raw.githubusercontent.com/Daniel-Hernandez-Jrz/GridViewFlutterDHJ/master/assets/images/5.jpg"),
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  // final String price;
  final String color;
  final String image;

  Item({required this.id, required this.name, required this.desc,  required this.color, required this.image});
}
