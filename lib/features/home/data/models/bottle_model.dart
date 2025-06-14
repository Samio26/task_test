import 'package:tesstt_task/features/home/domain/entities/bottle.dart';

class BottleModel extends Bottle {
  const BottleModel(
      {required super.videoUrl,
      required super.id,
      required super.name,
      required super.year,
      required super.progress,
      required super.number,
      required super.image});

  factory BottleModel.fromJson(Map<String, dynamic> json) {
    return BottleModel(
        videoUrl: json["video_url"],
        id: json['id'],
        name: json['name'],
        year: json['year'],
        progress: json['progress'],
        number: json['number'],
        image: json['image_url']);
  }

  Map<String, dynamic> toJson() {
    return {
      "video_url": videoUrl,
      'id': id,
      'name': name,
      'year': year,
      "progress": progress,
      "number": number,
      "image_url": image
    };
  }
}
