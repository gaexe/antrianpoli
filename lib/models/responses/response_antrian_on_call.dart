class ResponseAntrianOnCall {
  ResponseAntrianOnCall({
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
    this.antrianJenis,
    this.antrianStatus,
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
  final AntrianJenis? antrianJenis;
  final AntrianStatus? antrianStatus;
  final Loket? loket;

  factory ResponseAntrianOnCall.fromJson(Map<String, dynamic> json) {
    return ResponseAntrianOnCall(
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
      antrianJenis: json["antrian_jenis"] == null ? null : AntrianJenis.fromJson(json["antrian_jenis"]),
      antrianStatus: json["antrian_status"] == null ? null : AntrianStatus.fromJson(json["antrian_status"]),
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
        "antrian_jenis": antrianJenis?.toJson(),
        "antrian_status": antrianStatus?.toJson(),
        "loket": loket?.toJson(),
      };
}

class AntrianJenis {
  AntrianJenis({
    this.idAntrianJenis,
    this.jenisAntrian,
    this.kode,
    this.counter,
    this.idPenjamin,
    this.isActive,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
  });

  final int? idAntrianJenis;
  final String? jenisAntrian;
  final String? kode;
  final num? counter;
  final int? idPenjamin;
  final bool? isActive;
  final DateTime? createdAt;
  final String? createdBy;
  final DateTime? updatedAt;
  final String? updatedBy;

  factory AntrianJenis.fromJson(Map<String, dynamic> json) {
    return AntrianJenis(
      idAntrianJenis: json["id_antrian_jenis"],
      jenisAntrian: json["jenis_antrian"],
      kode: json["kode"],
      counter: json["counter"],
      idPenjamin: json["id_penjamin"],
      isActive: json["is_active"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      createdBy: json["created_by"],
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      updatedBy: json["updated_by"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id_antrian_jenis": idAntrianJenis,
        "jenis_antrian": jenisAntrian,
        "kode": kode,
        "counter": counter,
        "id_penjamin": idPenjamin,
        "is_active": isActive,
        "created_at": createdAt?.toIso8601String(),
        "created_by": createdBy,
        "updated_at": updatedAt?.toIso8601String(),
        "updated_by": updatedBy,
      };
}

class AntrianStatus {
  AntrianStatus({
    this.idAntrianStatus,
    this.statusAntrian,
  });

  final int? idAntrianStatus;
  final String? statusAntrian;

  factory AntrianStatus.fromJson(Map<String, dynamic> json) {
    return AntrianStatus(
      idAntrianStatus: json["id_antrian_status"],
      statusAntrian: json["status_antrian"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id_antrian_status": idAntrianStatus,
        "status_antrian": statusAntrian,
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
