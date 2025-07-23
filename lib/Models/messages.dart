class MessageModel
{
  static List<Message>messages = [];
  Message getByPos(int pos) => messages[pos];
}

class Message
{
  final String tagline;
  final String common;
  final String commonPhrases;
  final String stop;
  final String speak;
  final String personalization;
  final String save;
  final String reset;
  final String theme;
  final String language;
  final String pitch;
  final String volume;
  final String speed;
  final String selected;
  final String command;
  final String enterToSpeak;
  final String custom;

  Message(
    this.tagline,
    this.common,
    this.commonPhrases,
    this.stop,
    this.speak,
    this.personalization,
    this.save,
    this.reset,
    this.theme,
    this.language,
    this.pitch,
    this.volume,
    this.speed,
    this.selected,
    this.command,
    this.enterToSpeak,
    this.custom
  );

  factory Message.fromMap(Map<String, dynamic> map)
  {
    return Message(
      map["tagline"].toString(),
      map["common"].toString(),
      map["commonPhrases"].toString(),
      map["stop"].toString(),
      map["speak"].toString(),
      map["personalization"].toString(),
      map["save"].toString(),
      map["reset"].toString(),
      map["theme"].toString(),
      map["language"].toString(),
      map["pitch"].toString(),
      map["volume"].toString(),
      map["speed"].toString(),
      map["selected"].toString(),
      map["command"].toString(),
      map["enterToSpeak"].toString(),
      map["custom"].toString()
    );
  }

  Map<String, dynamic> toMap() => {
    "tagline": tagline,
    "common": common,
    "commonPhrases": commonPhrases,
    "stop": stop,
    "speak": speak,
    "personalization": personalization,
    "save": save,
    "reset": reset,
    "theme": theme,
    "language": language,
    "pitch": pitch,
    "volume": volume,
    "speed": speed,
    "selected": selected,
    "command": command,
    "enterToSpeak": enterToSpeak,
    "custom": custom
  };
}