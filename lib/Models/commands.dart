class CommandModel
{
  static List<Command>commands = [];
}

class Command
{
  final String name;
  final String icon;
  final List<String> phrases;

  Command(this.name, this.icon, this.phrases);

  factory Command.fromMap(Map<String, dynamic> map)
  {
    return Command(
        map["name"].toString(),
        map["icon"].toString(),
        List<String>.from(map["phrases"]),
    );
  }

  Map<String, dynamic> toMap() => {
    "name": name,
    "icon": icon,
    "phrases": phrases,
  };
}