class ResponseAntrianDisplay {
  ResponseAntrianDisplay({
    this.responseResult,
    this.statusCode,
    this.data,
    this.message,
  });

  final bool? responseResult;
  final num? statusCode;
  final Data? data;
  final List<String>? message;

  factory ResponseAntrianDisplay.fromJson(Map<String, dynamic> json) {
    return ResponseAntrianDisplay(
      responseResult: json["responseResult"],
      statusCode: json["statusCode"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      message: json["message"] == null ? [] : List<String>.from(json["message"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "responseResult": responseResult,
        "statusCode": statusCode,
        "data": data?.toJson(),
        "message": message?.map((x) => x).toList(),
      };
}

class Data {
  Data({
    this.antrian,
    this.info,
  });

  final List<Antrian>? antrian;
  final Info? info;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      antrian: json["antrian"] == null ? [] : List<Antrian>.from(json["antrian"]!.map((x) => Antrian.fromJson(x))),
      info: json["info"] == null ? null : Info.fromJson(json["info"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "antrian": antrian?.map((x) => x.toJson()).toList(),
        "info": info?.toJson(),
      };
}

class Antrian {
  Antrian({
    this.idAntrian,
    this.noAntrian,
    this.idAntrianJenis,
    this.idAntrianStatus,
    this.createdAt,
    this.idLoket,
    this.callingAt,
    this.isCallingNow,
    this.startAdmisiAt,
    this.startAdmisiBy,
    this.endAdmisiAt,
    this.endAdmisiBy,
    this.loket,
  });

  final String? idAntrian;
  final String? noAntrian;
  final int? idAntrianJenis;
  final int? idAntrianStatus;
  final DateTime? createdAt;
  final int? idLoket;
  final DateTime? callingAt;
  final bool? isCallingNow;
  final dynamic startAdmisiAt;
  final dynamic startAdmisiBy;
  final dynamic endAdmisiAt;
  final dynamic endAdmisiBy;
  final Loket? loket;

  factory Antrian.fromJson(Map<String, dynamic> json) {
    return Antrian(
      idAntrian: json["id_antrian"],
      noAntrian: json["no_antrian"],
      idAntrianJenis: json["id_antrian_jenis"],
      idAntrianStatus: json["id_antrian_status"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      idLoket: json["id_loket"],
      callingAt: DateTime.tryParse(json["calling_at"] ?? ""),
      isCallingNow: json["is_calling_now"],
      startAdmisiAt: json["start_admisi_at"],
      startAdmisiBy: json["start_admisi_by"],
      endAdmisiAt: json["end_admisi_at"],
      endAdmisiBy: json["end_admisi_by"],
      loket: json["loket"] == null ? null : Loket.fromJson(json["loket"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id_antrian": idAntrian,
        "no_antrian": noAntrian,
        "id_antrian_jenis": idAntrianJenis,
        "id_antrian_status": idAntrianStatus,
        "created_at": createdAt?.toIso8601String(),
        "id_loket": idLoket,
        "calling_at": callingAt?.toIso8601String(),
        "is_calling_now": isCallingNow,
        "start_admisi_at": startAdmisiAt,
        "start_admisi_by": startAdmisiBy,
        "end_admisi_at": endAdmisiAt,
        "end_admisi_by": endAdmisiBy,
        "loket": loket?.toJson(),
      };
}

class Loket {
  Loket({
    this.idLoket,
    this.namaLoket,
    this.idAntrianJenis,
    this.isActive,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
  });

  final int? idLoket;
  final String? namaLoket;
  final int? idAntrianJenis;
  final bool? isActive;
  final DateTime? createdAt;
  final String? createdBy;
  final DateTime? updatedAt;
  final dynamic updatedBy;

  factory Loket.fromJson(Map<String, dynamic> json) {
    return Loket(
      idLoket: json["id_loket"],
      namaLoket: json["nama_loket"],
      idAntrianJenis: json["id_antrian_jenis"],
      isActive: json["is_active"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      createdBy: json["created_by"],
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      updatedBy: json["updated_by"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id_loket": idLoket,
        "nama_loket": namaLoket,
        "id_antrian_jenis": idAntrianJenis,
        "is_active": isActive,
        "created_at": createdAt?.toIso8601String(),
        "created_by": createdBy,
        "updated_at": updatedAt?.toIso8601String(),
        "updated_by": updatedBy,
      };
}

class Info {
  Info({
    this.title,
    this.subtitle,
    this.videoUrl,
  });

  final String? title;
  final String? subtitle;
  final String? videoUrl;

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      title: json["title"],
      subtitle: json["subtitle"],
      videoUrl: json["video_url"],
    );
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "video_url": videoUrl,
      };
}
