class Album {
  //tipo di dato delle chiamate che andiamo a fare
  final int userId;
  final int id;
  final String title;

  const Album({required this.userId, required this.id, required this.title});

  //i dati ci arrivano in json ma devono essere convertiti in oggetto Album

  factory Album.fromJson(Map<String, dynamic> json) { //factory crea un oggetto Album
    return Album(userId: json["userId"], id: json["id"], title: json["title"]);
  }
}
