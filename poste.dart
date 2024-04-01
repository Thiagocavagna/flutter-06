class Poste {
  final int idUsuario;
  final int id;
  final String titulo;

  const Poste({
    required this.idUsuario,
    required this.id,
    required this.titulo,
  });

  factory Poste.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'userId': int idUsuarioR,
        'id': int idR,
        'title': String tituloR,
      } =>
        Poste(
          idUsuario: idUsuarioR,
          id: idR,
          titulo: tituloR,
        ),
      _ => throw const FormatException('Falha ao carregar Poste.'),
    };
  }
}
