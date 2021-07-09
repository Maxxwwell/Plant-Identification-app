//////this class dictactes the information the plant show have. Over here we want it to have a name, family...
//////...and the other details provided withing the plant identification//////


class Plants {
  final String common_name;
  final String family;
  final String genus;
  final String id;
  final String image_url;
  final String scientific_name;
  final String about;
  final String wiki_url;

  Plants(
      {this.common_name,
      this.family,
      this.genus,
      this.id,
      this.image_url,
      this.scientific_name,
      this.about,
      this.wiki_url});
}
