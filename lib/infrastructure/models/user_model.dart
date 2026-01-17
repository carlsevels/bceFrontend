class User {
  int? id;
  String? email;
  DatosPersonales? datosPersonales;
  String? updatedAt;
  String? createdAt;

  User({
    this.id,
    this.email,
    this.datosPersonales,
    this.updatedAt,
    this.createdAt,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    datosPersonales = json['datosPersonales'] != null
        ? DatosPersonales?.fromJson(json['datosPersonales'])
        : null;
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    if (datosPersonales != null) {
      data['datosPersonales'] = datosPersonales?.toJson();
    }
    data['updatedAt'] = updatedAt;
    data['createdAt'] = createdAt;
    return data;
  }
}

class DatosPersonales {
  int? id;
  String? nombre;
  String? apellidoPaterno;
  String? apellidoMaterno;
  String? curp;
  String? fechaNacimiento;
  String? genero;
  String? numCelular;
  String? fotografia;
  GeneralModel? escolaridad;
  GeneralModel? ocupacion;
  int? userId;
  String? updatedAt;
  String? createdAt;

  DatosPersonales({
    this.id,
    this.nombre,
    this.apellidoPaterno,
    this.apellidoMaterno,
    this.curp,
    this.fechaNacimiento,
    this.genero,
    this.numCelular,
    this.fotografia,
    this.escolaridad,
    this.ocupacion,
    this.userId,
    this.updatedAt,
    this.createdAt,
  });

  DatosPersonales.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    apellidoPaterno = json['apellidoPaterno'];
    apellidoMaterno = json['apellidoMaterno'];
    curp = json['curp'];
    fechaNacimiento = json['fechaNacimiento'];
    genero = json['genero'];
    numCelular = json['numCelular'];
    fotografia = json['fotografia'];
    escolaridad = json['escolaridad'] != null
        ? GeneralModel?.fromJson(json['escolaridad'])
        : null;
    ocupacion = json['ocupacion'] != null
        ? GeneralModel?.fromJson(json['ocupacion'])
        : null;
    userId = json['userId'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['nombre'] = nombre;
    data['apellidoPaterno'] = apellidoPaterno;
    data['apellidoMaterno'] = apellidoMaterno;
    data['curp'] = curp;
    data['fechaNacimiento'] = fechaNacimiento;
    data['genero'] = genero;
    data['numCelular'] = numCelular;
    data['fotografia'] = fotografia;
    if (escolaridad != null) {
      data['escolaridad'] = escolaridad?.toJson();
    }
    if (ocupacion != null) {
      data['ocupacion'] = ocupacion?.toJson();
    }
    data['userId'] = userId;
    data['updatedAt'] = updatedAt;
    data['createdAt'] = createdAt;
    return data;
  }
}

class GeneralModel {
  int? id;
  String? text;
  int? datosPersonalesId;
  String? updatedAt;
  String? createdAt;

  GeneralModel({
    this.id,
    this.text,
    this.datosPersonalesId,
    this.updatedAt,
    this.createdAt,
  });

  GeneralModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    datosPersonalesId = json['datosPersonalesId'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['text'] = text;
    data['datosPersonalesId'] = datosPersonalesId;
    data['updatedAt'] = updatedAt;
    data['createdAt'] = createdAt;
    return data;
  }
}
