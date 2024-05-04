class PokemonMetadataDTO {
  int? count;
  String? next;
  String? previous;
  List<PokemonResult>? results;

  PokemonMetadataDTO({this.count, this.next, this.previous, this.results});

  PokemonMetadataDTO.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <PokemonResult>[];
      json['results'].forEach((v) {
        results!.add(PokemonResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PokemonResult {
  String? name;
  String? url;

  PokemonResult({this.name, this.url});

  PokemonResult.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
