// To parse this JSON data, do
//
//     final episodeByContentModel = episodeByContentModelFromJson(jsonString);

import 'dart:convert';

EpisodeByContentModel episodeByContentModelFromJson(String str) =>
    EpisodeByContentModel.fromJson(json.decode(str));

String episodeByContentModelToJson(EpisodeByContentModel data) =>
    json.encode(data.toJson());

class EpisodeByContentModel {
  int? status;
  String? message;
  List<Result>? result;
  int? totalRows;
  int? totalPage;
  int? currentPage;
  bool? morePage;

  EpisodeByContentModel({
    this.status,
    this.message,
    this.result,
    this.totalRows,
    this.totalPage,
    this.currentPage,
    this.morePage,
  });

  factory EpisodeByContentModel.fromJson(Map<String, dynamic> json) =>
      EpisodeByContentModel(
        status: _parseInt(json["status"]),
        message: json["message"],
        result: json['result'] == null
            ? null
            : List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
        totalRows: _parseInt(json["total_rows"]),
        totalPage: _parseInt(json["total_page"]),
        currentPage: _parseInt(json["current_page"]),
        morePage: json["more_page"] is bool ? json["more_page"] : (json["more_page"] == "1" || json["more_page"] == 1),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "result": List<dynamic>.from(result?.map((x) => x.toJson()) ?? []),
        "total_rows": totalRows,
        "total_page": totalPage,
        "current_page": currentPage,
        "more_page": morePage,
      };
}

class Result {
  int? id;
  int? contentId;
  int? contentType;
  int? categoryId;
  int? languageId;
  int? artistId;
  String? name;
  String? title;
  String? image;
  String? portraitImg;
  String? landscapeImg;
  String? description;
  int? audioType;
  String? audio;
  String? musicUploadType;
  String? music;
  int? musicDuration;
  int? audioDuration;
  int? isAudioPaid;
  int? isAudioCoin;
  int? totalAudioPlayed;
  int? videoType;
  String? video;
  int? videoDuration;
  int? totalEpisode;
  int? totalReviews;
  int? isVideoPaid;
  int? isVideoCoin;
  int? totalVideoPlayed;
  String? book;
  int? totalPlayed;
  int? isBookPaid;
  int? isBookCoin;
  int? totalBookPlayed;
  String? fullNovel;
  int? isPaidNovel;
  int? novelCoin;
  int? sortable;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? stopTime;
  int? isBuy;
  String? avgRating;

  Result({
    this.id,
    this.contentId,
    this.contentType,
    this.artistId,
    this.categoryId,
    this.novelCoin,
    this.totalPlayed,
    this.totalReviews,
    this.languageId,
    this.fullNovel,
    this.isPaidNovel,
    this.name,
    this.title,
    this.musicUploadType,
    this.music,
    this.musicDuration,
    this.portraitImg,
    this.image,
    this.description,
    this.audioType,
    this.avgRating,
    this.audio,
    this.audioDuration,
    this.isAudioPaid,
    this.isAudioCoin,
    this.totalAudioPlayed,
    this.videoType,
    this.video,
    this.videoDuration,
    this.landscapeImg,
    this.isVideoPaid,
    this.isVideoCoin,
    this.totalVideoPlayed,
    this.book,
    this.isBookPaid,
    this.totalEpisode,
    this.isBookCoin,
    this.totalBookPlayed,
    this.sortable,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.stopTime,
    this.isBuy,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: _parseInt(json["id"]),
        contentId: _parseInt(json["content_id"]),
        contentType: _parseInt(json["content_type"]),
        name: json["name"],
        artistId: _parseInt(json["artist_id"]),
        title: json["title"],
        categoryId: _parseInt(json["category_id"]),
        languageId: _parseInt(json["language_id"]),
        totalPlayed: _parseInt(json["total_played"]),
        fullNovel: json["full_novel"],
        isPaidNovel: _parseInt(json["is_paid_novel"]),
        landscapeImg: json["landscape_img"],
        novelCoin: _parseInt(json["novel_coin"]),
        musicUploadType: json["music_upload_type"],
        music: json["music"],
        musicDuration: _parseInt(json["music_duration"]),
        portraitImg: json["portrait_img"],
        image: json["image"],
        description: json["description"],
        totalEpisode: _parseInt(json["total_episode"]),
        audioType: _parseInt(json["audio_type"]),
        audio: json["audio"],
        totalReviews: _parseInt(json["total_reviews"]),
        audioDuration: _parseInt(json["audio_duration"]),
        isAudioPaid: _parseInt(json["is_audio_paid"]),
        isAudioCoin: _parseInt(json["is_audio_coin"]),
        totalAudioPlayed: _parseInt(json["total_audio_played"]),
        videoType: _parseInt(json["video_type"]),
        video: json["video"],
        videoDuration: _parseInt(json["video_duration"]),
        isVideoPaid: _parseInt(json["is_video_paid"]),
        isVideoCoin: _parseInt(json["is_video_coin"]),
        totalVideoPlayed: _parseInt(json["total_video_played"]),
        book: json["book"],
        isBookPaid: _parseInt(json["is_book_paid"]),
        isBookCoin: _parseInt(json["is_book_coin"]),
        totalBookPlayed: _parseInt(json["total_book_played"]),
        sortable: _parseInt(json["sortable"]),
        status: _parseInt(json["status"]),
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        stopTime: _parseInt(json["stop_time"]),
        isBuy: _parseInt(json["is_buy"]),
        avgRating: json["avg_rating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "content_id": contentId,
        "content_type": contentType,
        "artist_id": artistId,
        "landscape_img": landscapeImg,
        "name": name,
        "image": image,
        "category_id": categoryId,
        "language_id": languageId,
        "title": title,
        "music_upload_type": musicUploadType,
        "music": music,
        "music_duration": musicDuration,
        'total_reviews': totalReviews,
        "portrait_img": portraitImg,
        "total_played": totalPlayed,
        "description": description,
        "audio_type": audioType,
        "audio": audio,
        "full_novel": fullNovel,
        "is_paid_novel": isPaidNovel,
        "avg_rating": avgRating,
        "novel_coin": novelCoin,
        "audio_duration": audioDuration,
        "is_audio_paid": isAudioPaid,
        "is_audio_coin": isAudioCoin,
        "total_audio_played": totalAudioPlayed,
        "total_episode": totalEpisode,
        "video_type": videoType,
        "video": video,
        "video_duration": videoDuration,
        "is_video_paid": isVideoPaid,
        "is_video_coin": isVideoCoin,
        "total_video_played": totalVideoPlayed,
        "book": book,
        "is_book_paid": isBookPaid,
        "is_book_coin": isBookCoin,
        "total_book_played": totalBookPlayed,
        "sortable": sortable,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "stop_time": stopTime,
        "is_buy": isBuy,
      };

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "content_id": contentId,
      "artist_id": artistId,
      "content_type": contentType,
      "name": name,
      "category_id": categoryId,
      "language_id": languageId,
      "total_played": totalPlayed,
      "total_episode": totalEpisode,
      "avg_rating": avgRating,
      'total_reviews': totalReviews,
      "image": image,
      "title": title,
      "music_upload_type": musicUploadType,
      "music": music,
      "music_duration": musicDuration,
      "landscape_img": landscapeImg,
      "portrait_img": portraitImg,
      "description": description,
      "audio_type": audioType,
      "audio": audio,
      "audio_duration": audioDuration,
      "is_audio_paid": isAudioPaid,
      "is_audio_coin": isAudioCoin,
      "total_audio_played": totalAudioPlayed,
      "video_type": videoType,
      "video": video,
      "video_duration": videoDuration,
      "is_video_paid": isVideoPaid,
      "is_video_coin": isVideoCoin,
      "total_video_played": totalVideoPlayed,
      "book": book,
      "is_book_paid": isBookPaid,
      "is_book_coin": isBookCoin,
      "total_book_played": totalBookPlayed,
      "sortable": sortable,
      "status": status,
      "created_at": createdAt,
      "updated_at": updatedAt,
      "stop_time": stopTime,
      "is_buy": isBuy,
    };
  }
}

// Helper function to safely parse integers from dynamic values
int? _parseInt(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is String) {
    return int.tryParse(value);
  }
  return null;
}
