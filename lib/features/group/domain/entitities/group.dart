class Group {
  final String id;
  final String name;
  final List<String> memberIds;
  final DateTime updatedAt;
  final int version;
  final bool isDeleted;

  Group({required this.id,
   required this.name, 
   required this.memberIds,
    required this.updatedAt, 
    required this.version, 
    required this.isDeleted});
  
}