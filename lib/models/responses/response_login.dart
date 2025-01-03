class ResponseLogin {
  ResponseLogin({
      this.responseResult, 
      this.statusCode, 
      this.data, 
      this.message,});

  ResponseLogin.fromJson(dynamic json) {
    responseResult = json['responseResult'];
    statusCode = json['statusCode'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'] != null ? json['message'].cast<String>() : [];
  }
  bool? responseResult;
  num? statusCode;
  Data? data;
  List<String>? message;
ResponseLogin copyWith({  bool? responseResult,
  num? statusCode,
  Data? data,
  List<String>? message,
}) => ResponseLogin(  responseResult: responseResult ?? this.responseResult,
  statusCode: statusCode ?? this.statusCode,
  data: data ?? this.data,
  message: message ?? this.message,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['responseResult'] = responseResult;
    map['statusCode'] = statusCode;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['message'] = message;
    return map;
  }

}

class Data {
  Data({
      this.idNakes, 
      this.nama, 
      this.nik, 
      this.username, 
      this.fileFotoName, 
      this.fileFotoUrl, 
      this.idJabatan, 
      this.namaJabatan, 
      this.idPoli, 
      this.namaPoli, 
      this.idRole, 
      this.namaRole, 
      this.kodeDpjp, 
      this.idSatuSehat, 
      this.hfis, 
      this.accessToken, 
      this.menus,});

  Data.fromJson(dynamic json) {
    idNakes = json['id_nakes'];
    nama = json['nama'];
    nik = json['nik'];
    username = json['username'];
    fileFotoName = json['file_foto_name'];
    fileFotoUrl = json['file_foto_url'];
    idJabatan = json['id_jabatan'];
    namaJabatan = json['nama_jabatan'];
    idPoli = json['id_poli'];
    namaPoli = json['nama_poli'];
    idRole = json['id_role'];
    namaRole = json['nama_role'];
    kodeDpjp = json['kode_dpjp'];
    idSatuSehat = json['id_satu_sehat'];
    hfis = json['hfis'];
    accessToken = json['access_token'];
    if (json['menu'] != null) {
      menus = [];
      json['menu'].forEach((v) {
        menus?.add(Menus.fromJson(v));
      });
    }
  }
  num? idNakes;
  String? nama;
  String? nik;
  String? username;
  dynamic fileFotoName;
  dynamic fileFotoUrl;
  num? idJabatan;
  String? namaJabatan;
  num? idPoli;
  String? namaPoli;
  num? idRole;
  String? namaRole;
  dynamic kodeDpjp;
  dynamic idSatuSehat;
  dynamic hfis;
  String? accessToken;
  List<Menus>? menus;
Data copyWith({  num? idNakes,
  String? nama,
  String? nik,
  String? username,
  dynamic fileFotoName,
  dynamic fileFotoUrl,
  num? idJabatan,
  String? namaJabatan,
  num? idPoli,
  String? namaPoli,
  num? idRole,
  String? namaRole,
  dynamic kodeDpjp,
  dynamic idSatuSehat,
  dynamic hfis,
  String? accessToken,
  List<Menus>? menus,
}) => Data(  idNakes: idNakes ?? this.idNakes,
  nama: nama ?? this.nama,
  nik: nik ?? this.nik,
  username: username ?? this.username,
  fileFotoName: fileFotoName ?? this.fileFotoName,
  fileFotoUrl: fileFotoUrl ?? this.fileFotoUrl,
  idJabatan: idJabatan ?? this.idJabatan,
  namaJabatan: namaJabatan ?? this.namaJabatan,
  idPoli: idPoli ?? this.idPoli,
  namaPoli: namaPoli ?? this.namaPoli,
  idRole: idRole ?? this.idRole,
  namaRole: namaRole ?? this.namaRole,
  kodeDpjp: kodeDpjp ?? this.kodeDpjp,
  idSatuSehat: idSatuSehat ?? this.idSatuSehat,
  hfis: hfis ?? this.hfis,
  accessToken: accessToken ?? this.accessToken,
  menus: menus ?? this.menus,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_nakes'] = idNakes;
    map['nama'] = nama;
    map['nik'] = nik;
    map['username'] = username;
    map['file_foto_name'] = fileFotoName;
    map['file_foto_url'] = fileFotoUrl;
    map['id_jabatan'] = idJabatan;
    map['nama_jabatan'] = namaJabatan;
    map['id_poli'] = idPoli;
    map['nama_poli'] = namaPoli;
    map['id_role'] = idRole;
    map['nama_role'] = namaRole;
    map['kode_dpjp'] = kodeDpjp;
    map['id_satu_sehat'] = idSatuSehat;
    map['hfis'] = hfis;
    map['access_token'] = accessToken;
    if (menus != null) {
      map['menu'] = menus?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Menus {
  Menus({
      this.idRoleMenu, 
      this.idRole, 
      this.idMenu, 
      this.menu,});

  Menus.fromJson(dynamic json) {
    idRoleMenu = json['id_role_menu'];
    idRole = json['id_role'];
    idMenu = json['id_menu'];
    menu = json['menu'] != null ? Menu.fromJson(json['menu']) : null;
  }
  num? idRoleMenu;
  num? idRole;
  num? idMenu;
  Menu? menu;
Menus copyWith({  num? idRoleMenu,
  num? idRole,
  num? idMenu,
  Menu? menu,
}) => Menus(  idRoleMenu: idRoleMenu ?? this.idRoleMenu,
  idRole: idRole ?? this.idRole,
  idMenu: idMenu ?? this.idMenu,
  menu: menu ?? this.menu,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_role_menu'] = idRoleMenu;
    map['id_role'] = idRole;
    map['id_menu'] = idMenu;
    if (menu != null) {
      map['menu'] = menu?.toJson();
    }
    return map;
  }

}

class Menu {
  Menu({
      this.idMenu, 
      this.urut, 
      this.caption, 
      this.icon, 
      this.toggleChild, 
      this.url, 
      this.idParent, 
      this.isParent, 
      this.isActive, 
      this.isAdmin, 
      this.isClient,});

  Menu.fromJson(dynamic json) {
    idMenu = json['id_menu'];
    urut = json['urut'];
    caption = json['caption'];
    icon = json['icon'];
    toggleChild = json['toggle_child'];
    url = json['url'];
    idParent = json['id_parent'];
    isParent = json['is_parent'];
    isActive = json['is_active'];
    isAdmin = json['is_admin'];
    isClient = json['is_client'];
  }
  num? idMenu;
  num? urut;
  String? caption;
  String? icon;
  dynamic toggleChild;
  String? url;
  dynamic idParent;
  bool? isParent;
  bool? isActive;
  bool? isAdmin;
  bool? isClient;
Menu copyWith({  num? idMenu,
  num? urut,
  String? caption,
  String? icon,
  dynamic toggleChild,
  String? url,
  dynamic idParent,
  bool? isParent,
  bool? isActive,
  bool? isAdmin,
  bool? isClient,
}) => Menu(  idMenu: idMenu ?? this.idMenu,
  urut: urut ?? this.urut,
  caption: caption ?? this.caption,
  icon: icon ?? this.icon,
  toggleChild: toggleChild ?? this.toggleChild,
  url: url ?? this.url,
  idParent: idParent ?? this.idParent,
  isParent: isParent ?? this.isParent,
  isActive: isActive ?? this.isActive,
  isAdmin: isAdmin ?? this.isAdmin,
  isClient: isClient ?? this.isClient,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_menu'] = idMenu;
    map['urut'] = urut;
    map['caption'] = caption;
    map['icon'] = icon;
    map['toggle_child'] = toggleChild;
    map['url'] = url;
    map['id_parent'] = idParent;
    map['is_parent'] = isParent;
    map['is_active'] = isActive;
    map['is_admin'] = isAdmin;
    map['is_client'] = isClient;
    return map;
  }

}