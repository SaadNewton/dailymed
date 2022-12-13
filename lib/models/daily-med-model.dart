class DailyMedModel {
  List<Data>? data;
  Metadata? metadata;

  DailyMedModel({this.data, this.metadata});

  DailyMedModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    return data;
  }
}

class Data {
  String? code;
  String? codingSystem;
  String? type;
  String? name;

  Data({this.code, this.codingSystem, this.type, this.name});

  Data.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    codingSystem = json['codingSystem'];
    type = json['type'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['codingSystem'] = this.codingSystem;
    data['type'] = this.type;
    data['name'] = this.name;
    return data;
  }
}

class Metadata {
  String? dbPublishedDate;
  int? elementsPerPage;
  String? currentUrl;
  String? nextPageUrl;
  int? totalElements;
  int? totalPages;
  int? currentPage;
  String? previousPage;
  String? previousPageUrl;
  int? nextPage;

  Metadata(
      {this.dbPublishedDate,
        this.elementsPerPage,
        this.currentUrl,
        this.nextPageUrl,
        this.totalElements,
        this.totalPages,
        this.currentPage,
        this.previousPage,
        this.previousPageUrl,
        this.nextPage});

  Metadata.fromJson(Map<String, dynamic> json) {
    dbPublishedDate = json['db_published_date'];
    elementsPerPage = json['elements_per_page'];
    currentUrl = json['current_url'];
    nextPageUrl = json['next_page_url'];
    totalElements = json['total_elements'];
    totalPages = json['total_pages'];
    currentPage = json['current_page'];
    previousPage = json['previous_page'];
    previousPageUrl = json['previous_page_url'];
    nextPage = json['next_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['db_published_date'] = this.dbPublishedDate;
    data['elements_per_page'] = this.elementsPerPage;
    data['current_url'] = this.currentUrl;
    data['next_page_url'] = this.nextPageUrl;
    data['total_elements'] = this.totalElements;
    data['total_pages'] = this.totalPages;
    data['current_page'] = this.currentPage;
    data['previous_page'] = this.previousPage;
    data['previous_page_url'] = this.previousPageUrl;
    data['next_page'] = this.nextPage;
    return data;
  }
}
