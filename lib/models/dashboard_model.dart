// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

DashboardModel dashboardFromJson(String str) =>
    DashboardModel.fromJson(json.decode(str));

String dashboardtoJson(DashboardModel data) => json.encode(data.toJson());

class DashboardModel {
  bool status;
  dynamic errorType;
  List<Menu> menus;
  List<dynamic> draftMenus;
  List<TagList> tagList;
  bool refreshDashBoard;
  dynamic menuPath;
  String customizedMenuConfig;

  DashboardModel({
    required this.status,
    required this.errorType,
    required this.menus,
    required this.draftMenus,
    required this.tagList,
    required this.refreshDashBoard,
    required this.menuPath,
    required this.customizedMenuConfig,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
    status: json["Status"] ?? false,
    errorType: json["ErrorType"],
    menus: json["Menus"] == null
        ? []
        : List<Menu>.from(json["Menus"].map((x) => Menu.fromJson(x))),
    draftMenus: json["DraftMenus"] == null
        ? []
        : List<dynamic>.from(json["DraftMenus"].map((x) => x)),
    tagList: json["TagList"] == null
        ? []
        : List<TagList>.from(json["TagList"].map((x) => TagList.fromJson(x))),
    refreshDashBoard: json["RefreshDashBoard"] ?? false,
    menuPath: json["MenuPath"],
    customizedMenuConfig: json["CustomizedMenuConfig"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "Status": status,
    "ErrorType": errorType,
    "Menus": List<dynamic>.from(menus.map((x) => x.toJson())),
    "DraftMenus": List<dynamic>.from(draftMenus.map((x) => x)),
    "TagList": List<dynamic>.from(tagList.map((x) => x.toJson())),
    "RefreshDashBoard": refreshDashBoard,
    "MenuPath": menuPath,
    "CustomizedMenuConfig": customizedMenuConfig,
  };
}

class Menu {
  String id;
  String name;
  String imageUrl;
  dynamic description;
  String parentId;
  String instituteId;
  dynamic masterPageUrl;
  String? pageUrl;
  String? descriptionId;
  int sequenceNo;
  String languageId;
  dynamic comments;
  String createdBy;
  String createdDate;
  String? updatedBy;
  String? updatedDate;
  String filePath;
  List<String>? imageList;
  String? adhocFormId;
  dynamic fromDate;
  dynamic toDate;
  String? pageUrlId;
  bool isLive;
  bool isFavorite;
  List<TagList> menuTagList;
  bool hideMenuName;
  bool isPreviewAvailable;
  String? showIn;
  List<AdhocFormList>? adhocFormList;
  dynamic pageName;
  String? themeConfig;

  Menu({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.parentId,
    required this.instituteId,
    required this.masterPageUrl,
    required this.pageUrl,
    required this.descriptionId,
    required this.sequenceNo,
    required this.languageId,
    required this.comments,
    required this.createdBy,
    required this.createdDate,
    required this.updatedBy,
    required this.updatedDate,
    required this.filePath,
    required this.imageList,
    required this.adhocFormId,
    required this.fromDate,
    required this.toDate,
    required this.pageUrlId,
    required this.isLive,
    required this.isFavorite,
    required this.menuTagList,
    required this.hideMenuName,
    required this.isPreviewAvailable,
    required this.showIn,
    required this.adhocFormList,
    required this.pageName,
    required this.themeConfig,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
    id: json["Id"],
    name: json["Name"],
    imageUrl: json["ImageUrl"],
    description: json["Description"],
    parentId: json["ParentID"],
    instituteId: json["InstituteID"],
    masterPageUrl: json["MasterPageUrl"],
    pageUrl: json["PageUrl"],
    descriptionId: json["DescriptionID"],
    sequenceNo: json["SequenceNo"],
    languageId: json["LanguageId"],
    comments: json["Comments"],
    createdBy: json["CreatedBy"],
    createdDate: json["CreatedDate"],
    updatedBy: json["UpdatedBy"],
    updatedDate: json["UpdatedDate"],
    filePath: json["file_path"],
    imageList: json["Image_List"] == null
        ? []
        : List<String>.from(json["Image_List"]),
    adhocFormId: json["Adhoc_Form_ID"],
    fromDate: json["FromDate"],
    toDate: json["ToDate"],
    pageUrlId: json["PageUrlID"],
    isLive: json["IsLive"],
    isFavorite: json["IsFavorite"],
    menuTagList: json["MenuTagList"] == null
        ? []
        : List<TagList>.from(
            json["MenuTagList"].map((x) => TagList.fromJson(x)),
          ),
    hideMenuName: json["HideMenuName"],
    isPreviewAvailable: json["IsPreviewAvailable"],
    showIn: json["ShowIn"],
    adhocFormList: json["AdhocFormList"] == null
        ? []
        : List<AdhocFormList>.from(
            json["AdhocFormList"]!.map((x) => AdhocFormList.fromJson(x)),
          ),
    pageName: json["PageName"],
    themeConfig: json["ThemeConfig"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "Name": name,
    "ImageUrl": imageUrl,
    "Description": description,
    "ParentID": parentId,
    "InstituteID": instituteId,
    "MasterPageUrl": masterPageUrl,
    "PageUrl": pageUrl,
    "DescriptionID": descriptionId,
    "SequenceNo": sequenceNo,
    "LanguageId": languageId,
    "Comments": comments,
    "CreatedBy": createdBy,
    "CreatedDate": createdDate,
    "UpdatedBy": updatedBy,
    "UpdatedDate": updatedDate,
    "file_path": filePath,
    "Image_List": imageList == null
        ? []
        : List<dynamic>.from(imageList!.map((x) => x)),
    "Adhoc_Form_ID": adhocFormId,
    "FromDate": fromDate,
    "ToDate": toDate,
    "PageUrlID": pageUrlId,
    "IsLive": isLive,
    "IsFavorite": isFavorite,
    "MenuTagList": List<dynamic>.from(menuTagList.map((x) => x.toJson())),
    "HideMenuName": hideMenuName,
    "IsPreviewAvailable": isPreviewAvailable,
    "ShowIn": showIn,
    "AdhocFormList": adhocFormList == null
        ? []
        : List<dynamic>.from(adhocFormList!.map((x) => x.toJson())),
    "PageName": pageName,
    "ThemeConfig": themeConfig,
  };
}

class AdhocFormList {
  String formId;
  String formName;

  AdhocFormList({required this.formId, required this.formName});

  factory AdhocFormList.fromJson(Map<String, dynamic> json) =>
      AdhocFormList(formId: json["FormId"], formName: json["FormName"]);

  Map<String, dynamic> toJson() => {"FormId": formId, "FormName": formName};
}

class TagList {
  String tagId;
  String tagName;

  TagList({required this.tagId, required this.tagName});

  factory TagList.fromJson(Map<String, dynamic> json) =>
      TagList(tagId: json["TagID"], tagName: json["TagName"]);

  Map<String, dynamic> toJson() => {"TagID": tagId, "TagName": tagName};
}
