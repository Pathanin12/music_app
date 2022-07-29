// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

class MusicListModel {
  MusicListModel({
    this.hits,
  });

  List<Hit>? hits;

  factory MusicListModel.fromRawJson(String str) => MusicListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MusicListModel.fromJson(Map<String, dynamic> json) => MusicListModel(
    hits: json["hits"] == null ? null : List<Hit>.from(json["hits"].map((x) => Hit.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "hits": hits == null ? null : List<dynamic>.from(hits!.map((x) => x.toJson())),
  };
}

class Hit {
  Hit({
    this.track,
  });

  Track? track;

  factory Hit.fromRawJson(String str) => Hit.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Hit.fromJson(Map<String, dynamic> json) => Hit(
    track: json["track"] == null ? null : Track.fromJson(json["track"]),
  );

  Map<String, dynamic> toJson() => {
    "track": track == null ? null : track!.toJson(),
  };
}

class Track {
  Track({
    this.layout,
    this.type,
    this.key,
    this.title,
    this.subtitle,
    this.share,
    this.images,
    this.hub,
    this.artists,
    this.url,
  });

  String? layout;
  String? type;
  String? key;
  String? title;
  String? subtitle;
  Share? share;
  TrackImages? images;
  Hub? hub;
  List<Artist>? artists;
  String? url;

  factory Track.fromRawJson(String str) => Track.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Track.fromJson(Map<String, dynamic> json) => Track(
    layout: json["layout"] == null ? null : json["layout"],
    type: json["type"] == null ? null : json["type"],
    key: json["key"] == null ? null : json["key"],
    title: json["title"] == null ? null : json["title"],
    subtitle: json["subtitle"] == null ? null : json["subtitle"],
    share: json["share"] == null ? null : Share.fromJson(json["share"]),
    images: json["images"] == null ? null : TrackImages.fromJson(json["images"]),
    hub: json["hub"] == null ? null : Hub.fromJson(json["hub"]),
    artists: json["artists"] == null ? null : List<Artist>.from(json["artists"].map((x) => Artist.fromJson(x))),
    url: json["url"] == null ? null : json["url"],
  );

  Map<String, dynamic> toJson() => {
    "layout": layout == null ? null : layout,
    "type": type == null ? null : type,
    "key": key == null ? null : key,
    "title": title == null ? null : title,
    "subtitle": subtitle == null ? null : subtitle,
    "share": share == null ? null : share!.toJson(),
    "images": images == null ? null : images!.toJson(),
    "hub": hub == null ? null : hub!.toJson(),
    "artists": artists == null ? null : List<dynamic>.from(artists!.map((x) => x.toJson())),
    "url": url == null ? null : url,
  };
}

class Artist {
  Artist({
    this.id,
    this.adamid,
  });

  String? id;
  String? adamid;

  factory Artist.fromRawJson(String str) => Artist.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Artist.fromJson(Map<String, dynamic> json) => Artist(
    id: json["id"] == null ? null : json["id"],
    adamid: json["adamid"] == null ? null : json["adamid"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "adamid": adamid == null ? null : adamid,
  };
}

class Hub {
  Hub({
    this.type,
    this.image,
    this.actions,
    this.options,
    this.providers,
    this.explicit,
    this.displayname,
  });

  String? type;
  String? image;
  List<Action>? actions;
  List<Option>? options;
  List<Provider>? providers;
  bool? explicit;
  String? displayname;

  factory Hub.fromRawJson(String str) => Hub.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Hub.fromJson(Map<String, dynamic> json) => Hub(
    type: json["type"] == null ? null : json["type"],
    image: json["image"] == null ? null : json["image"],
    actions: json["actions"] == null ? null : List<Action>.from(json["actions"].map((x) => Action.fromJson(x))),
    options: json["options"] == null ? null : List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
    providers: json["providers"] == null ? null : List<Provider>.from(json["providers"].map((x) => Provider.fromJson(x))),
    explicit: json["explicit"] == null ? null : json["explicit"],
    displayname: json["displayname"] == null ? null : json["displayname"],
  );

  Map<String, dynamic> toJson() => {
    "type": type == null ? null : type,
    "image": image == null ? null : image,
    "actions": actions == null ? null : List<dynamic>.from(actions!.map((x) => x.toJson())),
    "options": options == null ? null : List<dynamic>.from(options!.map((x) => x.toJson())),
    "providers": providers == null ? null : List<dynamic>.from(providers!.map((x) => x.toJson())),
    "explicit": explicit == null ? null : explicit,
    "displayname": displayname == null ? null : displayname,
  };
}

class Action {
  Action({
    this.name,
    this.type,
    this.id,
    this.uri,
  });

  Name? name;
  ActionType? type;
  String? id;
  String? uri;

  factory Action.fromRawJson(String str) => Action.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Action.fromJson(Map<String, dynamic> json) => Action(
    name: json["name"] == null ? null : nameValues.map[json["name"]],
    type: json["type"] == null ? null : actionTypeValues.map[json["type"]],
    id: json["id"] == null ? null : json["id"],
    uri: json["uri"] == null ? null : json["uri"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : nameValues.reverse![name],
    "type": type == null ? null : actionTypeValues.reverse![type],
    "id": id == null ? null : id,
    "uri": uri == null ? null : uri,
  };
}

enum Name { APPLE, HUB_APPLEMUSIC_DEEPLINK, HUB_SPOTIFY_SEARCHDEEPLINK, HUB_DEEZER_SEARCHDEEPLINK }

final nameValues = EnumValues({
  "apple": Name.APPLE,
  "hub:applemusic:deeplink": Name.HUB_APPLEMUSIC_DEEPLINK,
  "hub:deezer:searchdeeplink": Name.HUB_DEEZER_SEARCHDEEPLINK,
  "hub:spotify:searchdeeplink": Name.HUB_SPOTIFY_SEARCHDEEPLINK
});

enum ActionType { APPLEMUSICPLAY, URI, APPLEMUSICOPEN }

final actionTypeValues = EnumValues({
  "applemusicopen": ActionType.APPLEMUSICOPEN,
  "applemusicplay": ActionType.APPLEMUSICPLAY,
  "uri": ActionType.URI
});

class Option {
  Option({
    this.caption,
    this.actions,
    this.beacondata,
    this.image,
    this.type,
    this.listcaption,
    this.overflowimage,
    this.colouroverflowimage,
    this.providername,
  });

  OptionCaption? caption;
  List<Action>? actions;
  Beacondata? beacondata;
  String? image;
  BeacondataType? type;
  Listcaption? listcaption;
  String? overflowimage;
  bool? colouroverflowimage;
  Providername? providername;

  factory Option.fromRawJson(String str) => Option.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Option.fromJson(Map<String, dynamic> json) => Option(
    caption: json["caption"] == null ? null : optionCaptionValues.map[json["caption"]],
    actions: json["actions"] == null ? null : List<Action>.from(json["actions"].map((x) => Action.fromJson(x))),
    beacondata: json["beacondata"] == null ? null : Beacondata.fromJson(json["beacondata"]),
    image: json["image"] == null ? null : json["image"],
    type: json["type"] == null ? null : beacondataTypeValues.map[json["type"]],
    listcaption: json["listcaption"] == null ? null : listcaptionValues.map[json["listcaption"]],
    overflowimage: json["overflowimage"] == null ? null : json["overflowimage"],
    colouroverflowimage: json["colouroverflowimage"] == null ? null : json["colouroverflowimage"],
    providername: json["providername"] == null ? null : providernameValues.map[json["providername"]],
  );

  Map<String, dynamic> toJson() => {
    "caption": caption == null ? null : optionCaptionValues.reverse![caption],
    "actions": actions == null ? null : List<dynamic>.from(actions!.map((x) => x.toJson())),
    "beacondata": beacondata == null ? null : beacondata!.toJson(),
    "image": image == null ? null : image,
    "type": type == null ? null : beacondataTypeValues.reverse![type],
    "listcaption": listcaption == null ? null : listcaptionValues.reverse![listcaption],
    "overflowimage": overflowimage == null ? null : overflowimage,
    "colouroverflowimage": colouroverflowimage == null ? null : colouroverflowimage,
    "providername": providername == null ? null : providernameValues.reverse![providername],
  };
}

class Beacondata {
  Beacondata({
    this.type,
    this.providername,
  });

  BeacondataType? type;
  Providername? providername;

  factory Beacondata.fromRawJson(String str) => Beacondata.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Beacondata.fromJson(Map<String, dynamic> json) => Beacondata(
    type: json["type"] == null ? null : beacondataTypeValues.map[json["type"]],
    providername: json["providername"] == null ? null : providernameValues.map[json["providername"]],
  );

  Map<String, dynamic> toJson() => {
    "type": type == null ? null : beacondataTypeValues.reverse![type],
    "providername": providername == null ? null : providernameValues.reverse![providername],
  };
}

enum Providername { APPLEMUSIC, ITUNES }

final providernameValues = EnumValues({
  "applemusic": Providername.APPLEMUSIC,
  "itunes": Providername.ITUNES
});

enum BeacondataType { OPEN, BUY }

final beacondataTypeValues = EnumValues({
  "buy": BeacondataType.BUY,
  "open": BeacondataType.OPEN
});

enum OptionCaption { OPEN, BUY }

final optionCaptionValues = EnumValues({
  "BUY": OptionCaption.BUY,
  "OPEN": OptionCaption.OPEN
});

enum Listcaption { OPEN_IN_APPLE_MUSIC, BUY_ON_I_TUNES }

final listcaptionValues = EnumValues({
  "Buy on iTunes": Listcaption.BUY_ON_I_TUNES,
  "Open in Apple Music": Listcaption.OPEN_IN_APPLE_MUSIC
});

class Provider {
  Provider({
    this.caption,
    this.images,
    this.actions,
    this.type,
  });

  ProviderCaption? caption;
  ProviderImages? images;
  List<Action>? actions;
  ProviderType? type;

  factory Provider.fromRawJson(String str) => Provider.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Provider.fromJson(Map<String, dynamic> json) => Provider(
    caption: json["caption"] == null ? null : providerCaptionValues.map[json["caption"]],
    images: json["images"] == null ? null : ProviderImages.fromJson(json["images"]),
    actions: json["actions"] == null ? null : List<Action>.from(json["actions"].map((x) => Action.fromJson(x))),
    type: json["type"] == null ? null : providerTypeValues.map[json["type"]],
  );

  Map<String, dynamic> toJson() => {
    "caption": caption == null ? null : providerCaptionValues.reverse![caption],
    "images": images == null ? null : images?.toJson(),
    "actions": actions == null ? null : List<dynamic>.from(actions!.map((x) => x.toJson())),
    "type": type == null ? null : providerTypeValues.reverse![type],
  };
}

enum ProviderCaption { OPEN_IN_SPOTIFY, OPEN_IN_DEEZER }

final providerCaptionValues = EnumValues({
  "Open in Deezer": ProviderCaption.OPEN_IN_DEEZER,
  "Open in Spotify": ProviderCaption.OPEN_IN_SPOTIFY
});

class ProviderImages {
  ProviderImages({
    this.overflow,
    this.imagesDefault,
  });

  String? overflow;
  String? imagesDefault;

  factory ProviderImages.fromRawJson(String str) => ProviderImages.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProviderImages.fromJson(Map<String, dynamic> json) => ProviderImages(
    overflow: json["overflow"] == null ? null : json["overflow"],
    imagesDefault: json["default"] == null ? null : json["default"],
  );

  Map<String, dynamic> toJson() => {
    "overflow": overflow == null ? null : overflow,
    "default": imagesDefault == null ? null : imagesDefault,
  };
}

enum ProviderType { SPOTIFY, DEEZER }

final providerTypeValues = EnumValues({
  "DEEZER": ProviderType.DEEZER,
  "SPOTIFY": ProviderType.SPOTIFY
});

class TrackImages {
  TrackImages({
    this.background,
    this.coverart,
    this.coverarthq,
    this.joecolor,
  });

  String? background;
  String? coverart;
  String? coverarthq;
  String? joecolor;

  factory TrackImages.fromRawJson(String str) => TrackImages.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TrackImages.fromJson(Map<String, dynamic> json) => TrackImages(
    background: json["background"] == null ? null : json["background"],
    coverart: json["coverart"] == null ? null : json["coverart"],
    coverarthq: json["coverarthq"] == null ? null : json["coverarthq"],
    joecolor: json["joecolor"] == null ? null : json["joecolor"],
  );

  Map<String, dynamic> toJson() => {
    "background": background == null ? null : background,
    "coverart": coverart == null ? null : coverart,
    "coverarthq": coverarthq == null ? null : coverarthq,
    "joecolor": joecolor == null ? null : joecolor,
  };
}

class Share {
  Share({
    this.subject,
    this.text,
    this.href,
    this.image,
    this.twitter,
    this.html,
    this.avatar,
    this.snapchat,
  });

  String? subject;
  String? text;
  String? href;
  String? image;
  String? twitter;
  String? html;
  String? avatar;
  String? snapchat;

  factory Share.fromRawJson(String str) => Share.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Share.fromJson(Map<String, dynamic> json) => Share(
    subject: json["subject"] == null ? null : json["subject"],
    text: json["text"] == null ? null : json["text"],
    href: json["href"] == null ? null : json["href"],
    image: json["image"] == null ? null : json["image"],
    twitter: json["twitter"] == null ? null : json["twitter"],
    html: json["html"] == null ? null : json["html"],
    avatar: json["avatar"] == null ? null : json["avatar"],
    snapchat: json["snapchat"] == null ? null : json["snapchat"],
  );

  Map<String, dynamic> toJson() => {
    "subject": subject == null ? null : subject,
    "text": text == null ? null : text,
    "href": href == null ? null : href,
    "image": image == null ? null : image,
    "twitter": twitter == null ? null : twitter,
    "html": html == null ? null : html,
    "avatar": avatar == null ? null : avatar,
    "snapchat": snapchat == null ? null : snapchat,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
