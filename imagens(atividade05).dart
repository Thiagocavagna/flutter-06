class Imagens {
  final int albumId;
  final int id;
  final String titulo;
  final String url;
  final String thumbnailUrl;

  const Imagens(
      {required this.albumId,
      required this.id,
      required this.titulo,
      required this.url,
      required this.thumbnailUrl});

  factory Imagens.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'albumId': int idUsuarioR,
        'id': int idR,
        'title': String tituloR,
        'url': String urlR,
        'thumbnailUrl': String thumbnailUrlR
      } =>
        Imagens(
            albumId: idUsuarioR,
            id: idR,
            titulo: tituloR,
            url: urlR,
            thumbnailUrl: thumbnailUrlR),
      _ => throw const FormatException('Falha ao carregar Imagem.'),
    };
  }
}
