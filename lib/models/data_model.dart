// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

FormModel welcomeFromJson(String str) => FormModel.fromJson(json.decode(str));

String welcomeToJson(FormModel data) => json.encode(data.toJson());

class FormModel {
  bool status;
  dynamic errorType;
  String formName;
  String formCategory;
  String buttonType;
  List<Field> fields;
  String acknowledgementMessage;
  String formType;
  bool isFreezed;
  dynamic isFreezedValidationMessage;
  bool isPrerequisiteApplicable;
  dynamic prerequisiteValidationMessage;
  bool dependentAdhocFormExists;
  dynamic dependentAdhocFormIdList;
  String htmlAcknowledgementMessage;
  bool isHtmlAcknowledgement;
  dynamic adhocFormFilledStatus;
  bool isAdhocFormFilled;
  PaymentInfo paymentInfo;
  List<dynamic> merchantAccountList;
  dynamic recordIndex;
  bool singleSignOnUrlExist;
  dynamic singleSignOnUrl;
  bool isRankingEnabled;
  String rankCalculatorType;
  bool isDraftAllowed;
  dynamic triggerAction;
  dynamic pointsObtained;
  dynamic totalPoints4Obtained;
  String formCreationLanguageCode;
  String currentLanguageCode;
  List<LanguageList> languageList;
  bool displayRankingAcknowledgement;
  bool isHistoryAvailable;
  String prerequisiteTitle;
  dynamic graphInfo;
  List<dynamic> inheritDataConfigList;
  bool displayAdhocStatus;
  dynamic formStatusInfo;
  dynamic statusList;
  dynamic statusFormId;
  dynamic targetUserId;
  dynamic formId;
  dynamic formSubmittedOn;
  bool enableSubmission;
  dynamic pendingAssociatedForms;
  dynamic updateAdhocFormTriggerAction;

  FormModel({
    required this.status,
    required this.errorType,
    required this.formName,
    required this.formCategory,
    required this.buttonType,
    required this.fields,
    required this.acknowledgementMessage,
    required this.formType,
    required this.isFreezed,
    required this.isFreezedValidationMessage,
    required this.isPrerequisiteApplicable,
    required this.prerequisiteValidationMessage,
    required this.dependentAdhocFormExists,
    required this.dependentAdhocFormIdList,
    required this.htmlAcknowledgementMessage,
    required this.isHtmlAcknowledgement,
    required this.adhocFormFilledStatus,
    required this.isAdhocFormFilled,
    required this.paymentInfo,
    required this.merchantAccountList,
    required this.recordIndex,
    required this.singleSignOnUrlExist,
    required this.singleSignOnUrl,
    required this.isRankingEnabled,
    required this.rankCalculatorType,
    required this.isDraftAllowed,
    required this.triggerAction,
    required this.pointsObtained,
    required this.totalPoints4Obtained,
    required this.formCreationLanguageCode,
    required this.currentLanguageCode,
    required this.languageList,
    required this.displayRankingAcknowledgement,
    required this.isHistoryAvailable,
    required this.prerequisiteTitle,
    required this.graphInfo,
    required this.inheritDataConfigList,
    required this.displayAdhocStatus,
    required this.formStatusInfo,
    required this.statusList,
    required this.statusFormId,
    required this.targetUserId,
    required this.formId,
    required this.formSubmittedOn,
    required this.enableSubmission,
    required this.pendingAssociatedForms,
    required this.updateAdhocFormTriggerAction,
  });

  factory FormModel.fromJson(Map<String, dynamic> json) => FormModel(
    status: json["Status"],
    errorType: json["ErrorType"],
    formName: json["FormName"],
    formCategory: json["FormCategory"],
    buttonType: json["ButtonType"],
    fields: List<Field>.from(json["Fields"].map((x) => Field.fromJson(x))),
    acknowledgementMessage: json["AcknowledgementMessage"],
    formType: json["FormType"],
    isFreezed: json["IsFreezed"],
    isFreezedValidationMessage: json["IsFreezedValidationMessage"],
    isPrerequisiteApplicable: json["IsPrerequisiteApplicable"],
    prerequisiteValidationMessage: json["PrerequisiteValidationMessage"],
    dependentAdhocFormExists: json["DependentAdhocFormExists"],
    dependentAdhocFormIdList: json["DependentAdhocFormIDList"],
    htmlAcknowledgementMessage: json["HtmlAcknowledgementMessage"],
    isHtmlAcknowledgement: json["IsHtmlAcknowledgement"],
    adhocFormFilledStatus: json["AdhocFormFilledStatus"],
    isAdhocFormFilled: json["IsAdhocFormFilled"],
    paymentInfo: PaymentInfo.fromJson(json["PaymentInfo"]),
    merchantAccountList: List<dynamic>.from(
      json["MerchantAccountList"].map((x) => x),
    ),
    recordIndex: json["RecordIndex"],
    singleSignOnUrlExist: json["SingleSignOnUrlExist"],
    singleSignOnUrl: json["SingleSignOnUrl"],
    isRankingEnabled: json["IsRankingEnabled"],
    rankCalculatorType: json["RankCalculatorType"],
    isDraftAllowed: json["IsDraftAllowed"],
    triggerAction: json["TriggerAction"],
    pointsObtained: json["PointsObtained"],
    totalPoints4Obtained: json["TotalPoints4Obtained"],
    formCreationLanguageCode: json["FormCreationLanguageCode"],
    currentLanguageCode: json["CurrentLanguageCode"],
    languageList: List<LanguageList>.from(
      json["LanguageList"].map((x) => LanguageList.fromJson(x)),
    ),
    displayRankingAcknowledgement: json["DisplayRankingAcknowledgement"],
    isHistoryAvailable: json["IsHistoryAvailable"],
    prerequisiteTitle: json["PrerequisiteTitle"],
    graphInfo: json["GraphInfo"],
    inheritDataConfigList: List<dynamic>.from(
      json["InheritDataConfigList"].map((x) => x),
    ),
    displayAdhocStatus: json["DisplayAdhocStatus"],
    formStatusInfo: json["FormStatusInfo"],
    statusList: json["StatusList"],
    statusFormId: json["StatusFormID"],
    targetUserId: json["TargetUserID"],
    formId: json["FormId"],
    formSubmittedOn: json["FormSubmittedOn"],
    enableSubmission: json["EnableSubmission"],
    pendingAssociatedForms: json["PendingAssociatedForms"],
    updateAdhocFormTriggerAction: json["UpdateAdhocFormTriggerAction"],
  );

  Map<String, dynamic> toJson() => {
    "Status": status,
    "ErrorType": errorType,
    "FormName": formName,
    "FormCategory": formCategory,
    "ButtonType": buttonType,
    "Fields": List<dynamic>.from(fields.map((x) => x.toJson())),
    "AcknowledgementMessage": acknowledgementMessage,
    "FormType": formType,
    "IsFreezed": isFreezed,
    "IsFreezedValidationMessage": isFreezedValidationMessage,
    "IsPrerequisiteApplicable": isPrerequisiteApplicable,
    "PrerequisiteValidationMessage": prerequisiteValidationMessage,
    "DependentAdhocFormExists": dependentAdhocFormExists,
    "DependentAdhocFormIDList": dependentAdhocFormIdList,
    "HtmlAcknowledgementMessage": htmlAcknowledgementMessage,
    "IsHtmlAcknowledgement": isHtmlAcknowledgement,
    "AdhocFormFilledStatus": adhocFormFilledStatus,
    "IsAdhocFormFilled": isAdhocFormFilled,
    "PaymentInfo": paymentInfo.toJson(),
    "MerchantAccountList": List<dynamic>.from(
      merchantAccountList.map((x) => x),
    ),
    "RecordIndex": recordIndex,
    "SingleSignOnUrlExist": singleSignOnUrlExist,
    "SingleSignOnUrl": singleSignOnUrl,
    "IsRankingEnabled": isRankingEnabled,
    "RankCalculatorType": rankCalculatorType,
    "IsDraftAllowed": isDraftAllowed,
    "TriggerAction": triggerAction,
    "PointsObtained": pointsObtained,
    "TotalPoints4Obtained": totalPoints4Obtained,
    "FormCreationLanguageCode": formCreationLanguageCode,
    "CurrentLanguageCode": currentLanguageCode,
    "LanguageList": List<dynamic>.from(languageList.map((x) => x.toJson())),
    "DisplayRankingAcknowledgement": displayRankingAcknowledgement,
    "IsHistoryAvailable": isHistoryAvailable,
    "PrerequisiteTitle": prerequisiteTitle,
    "GraphInfo": graphInfo,
    "InheritDataConfigList": List<dynamic>.from(
      inheritDataConfigList.map((x) => x),
    ),
    "DisplayAdhocStatus": displayAdhocStatus,
    "FormStatusInfo": formStatusInfo,
    "StatusList": statusList,
    "StatusFormID": statusFormId,
    "TargetUserID": targetUserId,
    "FormId": formId,
    "FormSubmittedOn": formSubmittedOn,
    "EnableSubmission": enableSubmission,
    "PendingAssociatedForms": pendingAssociatedForms,
    "UpdateAdhocFormTriggerAction": updateAdhocFormTriggerAction,
  };
}

class Field {
  TextEditingController? controller;
  String fieldId;
  String fieldName;
  String fieldType;
  dynamic fieldValue;
  String? fieldMaxLength;
  bool isMandate;
  String? fieldDescription;
  String sequence;
  List<FieldOption> fieldOptions;
  CalendarConfig? calendarConfig;
  String fieldRegex;
  String? fieldValidationConfig;
  String fieldValidationMessage;
  String? fieldHelpText;
  String fieldInfo;
  bool isDependent;
  List<FieldDependencyConfig>? fieldDependencyConfig;
  FileUploadOption? fileUploadOption;
  bool fieldPaymentEnabled;
  String? pointsAllocated;
  bool fieldOptionPointEnabled;
  List<AdditionalFieldValue>? additionalFieldValues;
  List<MultiFileUploadOption>? multiFileUploadOption;
  String? profileFieldCode;
  dynamic programLenthList;
  dynamic optionFieldAutoSelectConfig;
  bool enableDefaultFieldConfig;
  bool hideField;
  bool isReadOnly;
  bool enableAutocomplete;
  String? maxGroupLimit;
  String? minGroupRequired;
  bool isGroupedField;
  String? groupId;
  int groupSequence;
  List<List<Field>>? subFieldList;
  AdditionalFieldConfig? additionalFieldConfig;
  int maxOptionSelection;
  bool prepopulateValue;
  String? formula;
  String? config;
  GroupedFieldDisplayStyle? groupedFieldDisplayStyle;
  List<dynamic>? groupHeaders;
  ThemeConfig? themeConfig;
  dynamic inheritedId;
  dynamic linkedFieldId;

  Field({
    required this.controller,
    required this.fieldId,
    required this.fieldName,
    required this.fieldType,
    required this.fieldValue,
    required this.fieldMaxLength,
    required this.isMandate,
    required this.fieldDescription,
    required this.sequence,
    required this.fieldOptions,
    required this.calendarConfig,
    required this.fieldRegex,
    required this.fieldValidationConfig,
    required this.fieldValidationMessage,
    required this.fieldHelpText,
    required this.fieldInfo,
    required this.isDependent,
    required this.fieldDependencyConfig,
    required this.fileUploadOption,
    required this.fieldPaymentEnabled,
    required this.pointsAllocated,
    required this.fieldOptionPointEnabled,
    required this.additionalFieldValues,
    required this.multiFileUploadOption,
    required this.profileFieldCode,
    required this.programLenthList,
    required this.optionFieldAutoSelectConfig,
    required this.enableDefaultFieldConfig,
    required this.hideField,
    required this.isReadOnly,
    required this.enableAutocomplete,
    required this.maxGroupLimit,
    required this.minGroupRequired,
    required this.isGroupedField,
    required this.groupId,
    required this.groupSequence,
    required this.subFieldList,
    required this.additionalFieldConfig,
    required this.maxOptionSelection,
    required this.prepopulateValue,
    required this.formula,
    required this.config,
    required this.groupedFieldDisplayStyle,
    required this.groupHeaders,
    required this.themeConfig,
    required this.inheritedId,
    required this.linkedFieldId,
  });

  factory Field.fromJson(Map<String, dynamic> json) => Field(
    controller: TextEditingController(),
    fieldId: json["FieldID"],
    fieldName: json["FieldName"],
    fieldType: json["FieldType"],
    fieldValue: json["FieldValue"],
    fieldMaxLength: json["FieldMaxLength"],
    isMandate: json["IsMandate"],
    fieldDescription: json["FieldDescription"],
    sequence: json["Sequence"],
    fieldOptions: List<FieldOption>.from(
      json["FieldOptions"].map((x) => FieldOption.fromJson(x)),
    ),
    calendarConfig: json["CalendarConfig"] == null
        ? null
        : CalendarConfig.fromJson(json["CalendarConfig"]),
    fieldRegex: json["FieldRegex"],
    fieldValidationConfig: json["FieldValidationConfig"],
    fieldValidationMessage: json["FieldValidationMessage"],
    fieldHelpText: json["FieldHelpText"],
    fieldInfo: json["FieldInfo"],
    isDependent: json["IsDependent"],
    fieldDependencyConfig: json["FieldDependencyConfig"] == null
        ? []
        : List<FieldDependencyConfig>.from(
            json["FieldDependencyConfig"]!.map(
              (x) => FieldDependencyConfig.fromJson(x),
            ),
          ),
    fileUploadOption: json["FileUploadOption"] == null
        ? null
        : FileUploadOption.fromJson(json["FileUploadOption"]),
    fieldPaymentEnabled: json["FieldPaymentEnabled"],
    pointsAllocated: json["PointsAllocated"],
    fieldOptionPointEnabled: json["FieldOptionPointEnabled"],
    additionalFieldValues: json["AdditionalFieldValues"] == null
        ? []
        : List<AdditionalFieldValue>.from(
            json["AdditionalFieldValues"]!.map(
              (x) => AdditionalFieldValue.fromJson(x),
            ),
          ),
    multiFileUploadOption: json["MultiFileUploadOption"] == null
        ? []
        : List<MultiFileUploadOption>.from(
            json["MultiFileUploadOption"]!.map(
              (x) => MultiFileUploadOption.fromJson(x),
            ),
          ),
    profileFieldCode: json["ProfileFieldCode"],
    programLenthList: json["ProgramLenthList"],
    optionFieldAutoSelectConfig: json["OptionFieldAutoSelectConfig"],
    enableDefaultFieldConfig: json["EnableDefaultFieldConfig"],
    hideField: json["HideField"],
    isReadOnly: json["IsReadOnly"],
    enableAutocomplete: json["EnableAutocomplete"],
    maxGroupLimit: json["MaxGroupLimit"],
    minGroupRequired: json["MinGroupRequired"],
    isGroupedField: json["IsGroupedField"],
    groupId: json["GroupId"],
    groupSequence: json["GroupSequence"],
    subFieldList: json["SubFieldList"] == null
        ? []
        : List<List<Field>>.from(
            json["SubFieldList"]!.map(
              (x) => List<Field>.from(x.map((x) => Field.fromJson(x))),
            ),
          ),
    additionalFieldConfig: json["AdditionalFieldConfig"] == null
        ? null
        : AdditionalFieldConfig.fromJson(json["AdditionalFieldConfig"]),
    maxOptionSelection: json["MaxOptionSelection"],
    prepopulateValue: json["PrepopulateValue"],
    formula: json["Formula"],
    config: json["Config"],
    groupedFieldDisplayStyle: json["GroupedFieldDisplayStyle"] == null
        ? null
        : groupedFieldDisplayStyleValues.map[json["GroupedFieldDisplayStyle"]],
    groupHeaders: json["GroupHeaders"] == null
        ? []
        : List<dynamic>.from(json["GroupHeaders"]!.map((x) => x)),
    themeConfig: json["ThemeConfig"] == null
        ? null
        : ThemeConfig.fromJson(json["ThemeConfig"]),
    inheritedId: json["InheritedID"],
    linkedFieldId: json["LinkedFieldID"],
  );

  Map<String, dynamic> toJson() => {
    "FieldID": fieldId,
    "FieldName": fieldName,
    "FieldType": fieldType,
    "FieldValue": fieldValue,
    "FieldMaxLength": fieldMaxLength,
    "IsMandate": isMandate,
    "FieldDescription": fieldDescription,
    "Sequence": sequence,
    "FieldOptions": List<dynamic>.from(fieldOptions.map((x) => x.toJson())),
    "CalendarConfig": calendarConfig?.toJson(),
    "FieldRegex": fieldRegex,
    "FieldValidationConfig": fieldValidationConfig,
    "FieldValidationMessage": fieldValidationMessage,
    "FieldHelpText": fieldHelpText,
    "FieldInfo": fieldInfo,
    "IsDependent": isDependent,
    "FieldDependencyConfig": fieldDependencyConfig == null
        ? []
        : List<dynamic>.from(fieldDependencyConfig!.map((x) => x.toJson())),
    "FileUploadOption": fileUploadOption?.toJson(),
    "FieldPaymentEnabled": fieldPaymentEnabled,
    "PointsAllocated": pointsAllocated,
    "FieldOptionPointEnabled": fieldOptionPointEnabled,
    "AdditionalFieldValues": additionalFieldValues == null
        ? []
        : List<dynamic>.from(additionalFieldValues!.map((x) => x.toJson())),
    "MultiFileUploadOption": multiFileUploadOption == null
        ? []
        : List<dynamic>.from(multiFileUploadOption!.map((x) => x.toJson())),
    "ProfileFieldCode": profileFieldCode,
    "ProgramLenthList": programLenthList,
    "OptionFieldAutoSelectConfig": optionFieldAutoSelectConfig,
    "EnableDefaultFieldConfig": enableDefaultFieldConfig,
    "HideField": hideField,
    "IsReadOnly": isReadOnly,
    "EnableAutocomplete": enableAutocomplete,
    "MaxGroupLimit": maxGroupLimit,
    "MinGroupRequired": minGroupRequired,
    "IsGroupedField": isGroupedField,
    "GroupId": groupId,
    "GroupSequence": groupSequence,
    "SubFieldList": subFieldList == null
        ? []
        : List<dynamic>.from(
            subFieldList!.map(
              (x) => List<dynamic>.from(x.map((x) => x.toJson())),
            ),
          ),
    "AdditionalFieldConfig": additionalFieldConfig?.toJson(),
    "MaxOptionSelection": maxOptionSelection,
    "PrepopulateValue": prepopulateValue,
    "Formula": formula,
    "Config": config,
    "GroupedFieldDisplayStyle":
        groupedFieldDisplayStyleValues.reverse[groupedFieldDisplayStyle],
    "GroupHeaders": groupHeaders == null
        ? []
        : List<dynamic>.from(groupHeaders!.map((x) => x)),
    "ThemeConfig": themeConfig?.toJson(),
    "InheritedID": inheritedId,
    "LinkedFieldID": linkedFieldId,
  };
}

class AdditionalFieldConfig {
  AdhocFormForumFieldConfig? adhocFormForumFieldConfig;
  GeographicMapFieldConfig? geographicMapFieldConfig;
  dynamic templateFieldConfig;
  WorkshopListFieldConfig? workshopListFieldConfig;

  AdditionalFieldConfig({
    required this.adhocFormForumFieldConfig,
    required this.geographicMapFieldConfig,
    required this.templateFieldConfig,
    required this.workshopListFieldConfig,
  });

  factory AdditionalFieldConfig.fromJson(
    Map<String, dynamic> json,
  ) => AdditionalFieldConfig(
    adhocFormForumFieldConfig: json["AdhocFormForumFieldConfig"] == null
        ? null
        : AdhocFormForumFieldConfig.fromJson(json["AdhocFormForumFieldConfig"]),
    geographicMapFieldConfig: json["GeographicMapFieldConfig"] == null
        ? null
        : GeographicMapFieldConfig.fromJson(json["GeographicMapFieldConfig"]),
    templateFieldConfig: json["TemplateFieldConfig"],
    workshopListFieldConfig: json["WorkshopListFieldConfig"] == null
        ? null
        : WorkshopListFieldConfig.fromJson(json["WorkshopListFieldConfig"]),
  );

  Map<String, dynamic> toJson() => {
    "AdhocFormForumFieldConfig": adhocFormForumFieldConfig?.toJson(),
    "GeographicMapFieldConfig": geographicMapFieldConfig?.toJson(),
    "TemplateFieldConfig": templateFieldConfig,
    "WorkshopListFieldConfig": workshopListFieldConfig?.toJson(),
  };
}

class AdhocFormForumFieldConfig {
  bool autoSync;
  bool biWeeklyEmailNotification;
  String display;
  String displayStyle;
  bool emailNotification;
  String forumAction;
  dynamic forumCategoryId;
  int maxSelection;
  bool pushNotification;
  bool weeklyEmailNotification;

  AdhocFormForumFieldConfig({
    required this.autoSync,
    required this.biWeeklyEmailNotification,
    required this.display,
    required this.displayStyle,
    required this.emailNotification,
    required this.forumAction,
    required this.forumCategoryId,
    required this.maxSelection,
    required this.pushNotification,
    required this.weeklyEmailNotification,
  });

  factory AdhocFormForumFieldConfig.fromJson(Map<String, dynamic> json) =>
      AdhocFormForumFieldConfig(
        autoSync: json["AutoSync"],
        biWeeklyEmailNotification: json["BiWeeklyEmailNotification"],
        display: json["Display"],
        displayStyle: json["DisplayStyle"],
        emailNotification: json["EmailNotification"],
        forumAction: json["ForumAction"],
        forumCategoryId: json["ForumCategoryID"],
        maxSelection: json["MaxSelection"],
        pushNotification: json["PushNotification"],
        weeklyEmailNotification: json["WeeklyEmailNotification"],
      );

  Map<String, dynamic> toJson() => {
    "AutoSync": autoSync,
    "BiWeeklyEmailNotification": biWeeklyEmailNotification,
    "Display": display,
    "DisplayStyle": displayStyle,
    "EmailNotification": emailNotification,
    "ForumAction": forumAction,
    "ForumCategoryID": forumCategoryId,
    "MaxSelection": maxSelection,
    "PushNotification": pushNotification,
    "WeeklyEmailNotification": weeklyEmailNotification,
  };
}

class GeographicMapFieldConfig {
  bool allowUserToSelectAddress;
  String calculateDistance;
  String selectionStyle;
  String tags;

  GeographicMapFieldConfig({
    required this.allowUserToSelectAddress,
    required this.calculateDistance,
    required this.selectionStyle,
    required this.tags,
  });

  factory GeographicMapFieldConfig.fromJson(Map<String, dynamic> json) =>
      GeographicMapFieldConfig(
        allowUserToSelectAddress: json["AllowUserToSelectAddress"],
        calculateDistance: json["CalculateDistance"],
        selectionStyle: json["SelectionStyle"],
        tags: json["Tags"],
      );

  Map<String, dynamic> toJson() => {
    "AllowUserToSelectAddress": allowUserToSelectAddress,
    "CalculateDistance": calculateDistance,
    "SelectionStyle": selectionStyle,
    "Tags": tags,
  };
}

class WorkshopListFieldConfig {
  CustomDateRange customDateRange;
  int days;
  String displayStyle;
  String displayWorkshop;
  String exhibitorFieldId;
  String maxWorkshopSelection;
  bool showWorkshopDetailsInPopup;
  String workshopAction;
  String workshopFilterType;
  String workshopPresenterRoleAction;
  List<dynamic> workshopPresenterRolesList;
  String workshopSelectionStyle;

  WorkshopListFieldConfig({
    required this.customDateRange,
    required this.days,
    required this.displayStyle,
    required this.displayWorkshop,
    required this.exhibitorFieldId,
    required this.maxWorkshopSelection,
    required this.showWorkshopDetailsInPopup,
    required this.workshopAction,
    required this.workshopFilterType,
    required this.workshopPresenterRoleAction,
    required this.workshopPresenterRolesList,
    required this.workshopSelectionStyle,
  });

  factory WorkshopListFieldConfig.fromJson(Map<String, dynamic> json) =>
      WorkshopListFieldConfig(
        customDateRange: CustomDateRange.fromJson(json["CustomDateRange"]),
        days: json["Days"],
        displayStyle: json["DisplayStyle"],
        displayWorkshop: json["DisplayWorkshop"],
        exhibitorFieldId: json["ExhibitorFieldID"],
        maxWorkshopSelection: json["MaxWorkshopSelection"],
        showWorkshopDetailsInPopup: json["ShowWorkshopDetailsInPopup"],
        workshopAction: json["WorkshopAction"],
        workshopFilterType: json["WorkshopFilterType"],
        workshopPresenterRoleAction: json["WorkshopPresenterRoleAction"],
        workshopPresenterRolesList: List<dynamic>.from(
          json["WorkshopPresenterRolesList"].map((x) => x),
        ),
        workshopSelectionStyle: json["WorkshopSelectionStyle"],
      );

  Map<String, dynamic> toJson() => {
    "CustomDateRange": customDateRange.toJson(),
    "Days": days,
    "DisplayStyle": displayStyle,
    "DisplayWorkshop": displayWorkshop,
    "ExhibitorFieldID": exhibitorFieldId,
    "MaxWorkshopSelection": maxWorkshopSelection,
    "ShowWorkshopDetailsInPopup": showWorkshopDetailsInPopup,
    "WorkshopAction": workshopAction,
    "WorkshopFilterType": workshopFilterType,
    "WorkshopPresenterRoleAction": workshopPresenterRoleAction,
    "WorkshopPresenterRolesList": List<dynamic>.from(
      workshopPresenterRolesList.map((x) => x),
    ),
    "WorkshopSelectionStyle": workshopSelectionStyle,
  };
}

class CustomDateRange {
  dynamic endDate;
  dynamic startDate;

  CustomDateRange({required this.endDate, required this.startDate});

  factory CustomDateRange.fromJson(Map<String, dynamic> json) =>
      CustomDateRange(endDate: json["EndDate"], startDate: json["StartDate"]);

  Map<String, dynamic> toJson() => {"EndDate": endDate, "StartDate": startDate};
}

class AdditionalFieldValue {
  String code;
  bool enableAutoSelect;
  List<dynamic>? fieldOptions;
  bool hideField;
  String? label;
  String? maxSelection;
  bool promptReason4Cancellation;
  String? selectionStyle;
  int sequence;
  dynamic text;
  String? value;

  AdditionalFieldValue({
    required this.code,
    required this.enableAutoSelect,
    required this.fieldOptions,
    required this.hideField,
    required this.label,
    required this.maxSelection,
    required this.promptReason4Cancellation,
    required this.selectionStyle,
    required this.sequence,
    required this.text,
    required this.value,
  });

  factory AdditionalFieldValue.fromJson(Map<String, dynamic> json) =>
      AdditionalFieldValue(
        code: json["Code"],
        enableAutoSelect: json["EnableAutoSelect"],
        fieldOptions: json["FieldOptions"] == null
            ? []
            : List<dynamic>.from(json["FieldOptions"]!.map((x) => x)),
        hideField: json["HideField"],
        label: json["Label"],
        maxSelection: json["MaxSelection"],
        promptReason4Cancellation: json["PromptReason4Cancellation"],
        selectionStyle: json["SelectionStyle"],
        sequence: json["Sequence"],
        text: json["Text"],
        value: json["Value"],
      );

  Map<String, dynamic> toJson() => {
    "Code": code,
    "EnableAutoSelect": enableAutoSelect,
    "FieldOptions": fieldOptions == null
        ? []
        : List<dynamic>.from(fieldOptions!.map((x) => x)),
    "HideField": hideField,
    "Label": label,
    "MaxSelection": maxSelection,
    "PromptReason4Cancellation": promptReason4Cancellation,
    "SelectionStyle": selectionStyle,
    "Sequence": sequence,
    "Text": text,
    "Value": value,
  };
}

class CalendarConfig {
  dynamic limitType;
  dynamic minDate;
  dynamic maxDate;
  dynamic dependentField;
  dynamic dependentInterval;
  dynamic allowedDates;
  RestrictedDates restrictedDates;

  CalendarConfig({
    required this.limitType,
    required this.minDate,
    required this.maxDate,
    required this.dependentField,
    required this.dependentInterval,
    required this.allowedDates,
    required this.restrictedDates,
  });

  factory CalendarConfig.fromJson(Map<String, dynamic> json) => CalendarConfig(
    limitType: json["LimitType"],
    minDate: json["MinDate"],
    maxDate: json["MaxDate"],
    dependentField: json["DependentField"],
    dependentInterval: json["DependentInterval"],
    allowedDates: json["AllowedDates"],
    restrictedDates: RestrictedDates.fromJson(json["RestrictedDates"]),
  );

  Map<String, dynamic> toJson() => {
    "LimitType": limitType,
    "MinDate": minDate,
    "MaxDate": maxDate,
    "DependentField": dependentField,
    "DependentInterval": dependentInterval,
    "AllowedDates": allowedDates,
    "RestrictedDates": restrictedDates.toJson(),
  };
}

class RestrictedDates {
  List<dynamic> customDates;
  dynamic daysOfMonths;
  dynamic months;
  dynamic weekDays;

  RestrictedDates({
    required this.customDates,
    required this.daysOfMonths,
    required this.months,
    required this.weekDays,
  });

  factory RestrictedDates.fromJson(Map<String, dynamic> json) =>
      RestrictedDates(
        customDates: List<dynamic>.from(json["CustomDates"].map((x) => x)),
        daysOfMonths: json["DaysOfMonths"],
        months: json["Months"],
        weekDays: json["WeekDays"],
      );

  Map<String, dynamic> toJson() => {
    "CustomDates": List<dynamic>.from(customDates.map((x) => x)),
    "DaysOfMonths": daysOfMonths,
    "Months": months,
    "WeekDays": weekDays,
  };
}

class FieldDependencyConfig {
  String dependencyType;
  String dependencyTypeId;
  int selectionCount;
  String? selectOptionId;
  bool disablePossibleMatch;

  FieldDependencyConfig({
    required this.dependencyType,
    required this.dependencyTypeId,
    required this.selectionCount,
    required this.selectOptionId,
    required this.disablePossibleMatch,
  });

  factory FieldDependencyConfig.fromJson(Map<String, dynamic> json) =>
      FieldDependencyConfig(
        dependencyType: json["DependencyType"],
        dependencyTypeId: json["DependencyTypeID"],
        selectionCount: json["SelectionCount"],
        selectOptionId: json["SelectOptionId"],
        disablePossibleMatch: json["DisablePossibleMatch"],
      );

  Map<String, dynamic> toJson() => {
    "DependencyType": dependencyType,
    "DependencyTypeID": dependencyTypeId,
    "SelectionCount": selectionCount,
    "SelectOptionId": selectOptionId,
    "DisablePossibleMatch": disablePossibleMatch,
  };
}

class FieldOption {
  String value;
  String text;
  String? regularExpression;
  dynamic dependencyConfig;
  String? fieldOptionInfo;
  String? paymentAmount;
  String? pointsAllocated;
  dynamic defaultSelectConfig;
  String? autoSelectConfig;
  String? code;
  StyleConfig? styleConfig;
  String? description;
  List<FoConfigList>? foConfigList;

  FieldOption({
    required this.value,
    required this.text,
    required this.regularExpression,
    required this.dependencyConfig,
    required this.fieldOptionInfo,
    required this.paymentAmount,
    required this.pointsAllocated,
    required this.defaultSelectConfig,
    required this.autoSelectConfig,
    required this.code,
    required this.styleConfig,
    required this.description,
    required this.foConfigList,
  });

  factory FieldOption.fromJson(Map<String, dynamic> json) => FieldOption(
    value: json["Value"],
    text: json["Text"],
    regularExpression: json["RegularExpression"],
    dependencyConfig: json["DependencyConfig"],
    fieldOptionInfo: json["FieldOptionInfo"],
    paymentAmount: json["PaymentAmount"],
    pointsAllocated: json["PointsAllocated"],
    defaultSelectConfig: json["DefaultSelectConfig"],
    autoSelectConfig: json["AutoSelectConfig"],
    code: json["Code"],
    styleConfig: json["StyleConfig"] == null
        ? null
        : StyleConfig.fromJson(json["StyleConfig"]),
    description: json["Description"],
    foConfigList: json["FOConfigList"] == null
        ? []
        : List<FoConfigList>.from(
            json["FOConfigList"]!.map((x) => FoConfigList.fromJson(x)),
          ),
  );

  Map<String, dynamic> toJson() => {
    "Value": value,
    "Text": text,
    "RegularExpression": regularExpression,
    "DependencyConfig": dependencyConfig,
    "FieldOptionInfo": fieldOptionInfo,
    "PaymentAmount": paymentAmount,
    "PointsAllocated": pointsAllocated,
    "DefaultSelectConfig": defaultSelectConfig,
    "AutoSelectConfig": autoSelectConfig,
    "Code": code,
    "StyleConfig": styleConfig?.toJson(),
    "Description": description,
    "FOConfigList": foConfigList == null
        ? []
        : List<dynamic>.from(foConfigList!.map((x) => x.toJson())),
  };
}

class FoConfigList {
  String id;
  bool isPrimary;
  String workshopId;

  FoConfigList({
    required this.id,
    required this.isPrimary,
    required this.workshopId,
  });

  factory FoConfigList.fromJson(Map<String, dynamic> json) => FoConfigList(
    id: json["ID"],
    isPrimary: json["IsPrimary"],
    workshopId: json["WorkshopID"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "IsPrimary": isPrimary,
    "WorkshopID": workshopId,
  };
}

class StyleConfig {
  String backgroundColor;
  bool bold;
  String fontColor;
  bool italic;
  bool underline;

  StyleConfig({
    required this.backgroundColor,
    required this.bold,
    required this.fontColor,
    required this.italic,
    required this.underline,
  });

  factory StyleConfig.fromJson(Map<String, dynamic> json) => StyleConfig(
    backgroundColor: json["BackgroundColor"],
    bold: json["Bold"],
    fontColor: json["FontColor"],
    italic: json["Italic"],
    underline: json["Underline"],
  );

  Map<String, dynamic> toJson() => {
    "BackgroundColor": backgroundColor,
    "Bold": bold,
    "FontColor": fontColor,
    "Italic": italic,
    "Underline": underline,
  };
}

class FileUploadOption {
  String maxFileSize;
  String repositoryId;
  String documentTypeCode;
  String eConsentCode;
  String eConsentDescription;
  List<String> fileTypeList;
  bool expiryDateApplicable;
  bool startDateApplicable;
  String id;

  FileUploadOption({
    required this.maxFileSize,
    required this.repositoryId,
    required this.documentTypeCode,
    required this.eConsentCode,
    required this.eConsentDescription,
    required this.fileTypeList,
    required this.expiryDateApplicable,
    required this.startDateApplicable,
    required this.id,
  });

  factory FileUploadOption.fromJson(Map<String, dynamic> json) =>
      FileUploadOption(
        maxFileSize: json["MaxFileSize"],
        repositoryId: json["RepositoryID"],
        documentTypeCode: json["DocumentTypeCode"],
        eConsentCode: json["eConsentCode"],
        eConsentDescription: json["eConsentDescription"],
        fileTypeList: List<String>.from(json["FileTypeList"].map((x) => x)),
        expiryDateApplicable: json["ExpiryDateApplicable"],
        startDateApplicable: json["StartDateApplicable"],
        id: json["ID"],
      );

  Map<String, dynamic> toJson() => {
    "MaxFileSize": maxFileSize,
    "RepositoryID": repositoryId,
    "DocumentTypeCode": documentTypeCode,
    "eConsentCode": eConsentCode,
    "eConsentDescription": eConsentDescription,
    "FileTypeList": List<dynamic>.from(fileTypeList.map((x) => x)),
    "ExpiryDateApplicable": expiryDateApplicable,
    "StartDateApplicable": startDateApplicable,
    "ID": id,
  };
}

enum GroupedFieldDisplayStyle { DATA_TABLE }

final groupedFieldDisplayStyleValues = EnumValues({
  "DataTable": GroupedFieldDisplayStyle.DATA_TABLE,
});

class MultiFileUploadOption {
  String documentTypeCode;
  String documentTypeName;
  bool expiryDateApplicable;
  String fieldName;
  List<String> fileTypeList;
  bool isActive;
  bool isMandate;
  String maxFileSize;
  String repositoryId;
  String sequence;
  bool startDateApplicable;
  String uploadOptionId;
  String eConsentCode;
  String eConsentDescription;

  MultiFileUploadOption({
    required this.documentTypeCode,
    required this.documentTypeName,
    required this.expiryDateApplicable,
    required this.fieldName,
    required this.fileTypeList,
    required this.isActive,
    required this.isMandate,
    required this.maxFileSize,
    required this.repositoryId,
    required this.sequence,
    required this.startDateApplicable,
    required this.uploadOptionId,
    required this.eConsentCode,
    required this.eConsentDescription,
  });

  factory MultiFileUploadOption.fromJson(Map<String, dynamic> json) =>
      MultiFileUploadOption(
        documentTypeCode: json["DocumentTypeCode"],
        documentTypeName: json["DocumentTypeName"],
        expiryDateApplicable: json["ExpiryDateApplicable"],
        fieldName: json["FieldName"],
        fileTypeList: List<String>.from(json["FileTypeList"].map((x) => x)),
        isActive: json["IsActive"],
        isMandate: json["IsMandate"],
        maxFileSize: json["MaxFileSize"],
        repositoryId: json["RepositoryID"],
        sequence: json["Sequence"],
        startDateApplicable: json["StartDateApplicable"],
        uploadOptionId: json["UploadOptionID"],
        eConsentCode: json["eConsentCode"],
        eConsentDescription: json["eConsentDescription"],
      );

  Map<String, dynamic> toJson() => {
    "DocumentTypeCode": documentTypeCode,
    "DocumentTypeName": documentTypeName,
    "ExpiryDateApplicable": expiryDateApplicable,
    "FieldName": fieldName,
    "FileTypeList": List<dynamic>.from(fileTypeList.map((x) => x)),
    "IsActive": isActive,
    "IsMandate": isMandate,
    "MaxFileSize": maxFileSize,
    "RepositoryID": repositoryId,
    "Sequence": sequence,
    "StartDateApplicable": startDateApplicable,
    "UploadOptionID": uploadOptionId,
    "eConsentCode": eConsentCode,
    "eConsentDescription": eConsentDescription,
  };
}

class ThemeConfig {
  Alignment alignment;
  String fontSize;
  FontColor fontColor;
  BackgroundColor backgroundColor;
  TextStyle textStyle;
  dynamic rowNumber;
  dynamic columns;
  dynamic headerText;
  bool isDefault2Spilt;
  dynamic index;

  ThemeConfig({
    required this.alignment,
    required this.fontSize,
    required this.fontColor,
    required this.backgroundColor,
    required this.textStyle,
    required this.rowNumber,
    required this.columns,
    required this.headerText,
    required this.isDefault2Spilt,
    required this.index,
  });

  factory ThemeConfig.fromJson(Map<String, dynamic> json) => ThemeConfig(
    alignment: alignmentValues.map[json["Alignment"]]!,
    fontSize: json["FontSize"],
    fontColor: fontColorValues.map[json["FontColor"]]!,
    backgroundColor: backgroundColorValues.map[json["BackgroundColor"]]!,
    textStyle: textStyleValues.map[json["TextStyle"]]!,
    rowNumber: json["RowNumber"],
    columns: json["Columns"],
    headerText: json["HeaderText"],
    isDefault2Spilt: json["IsDefault2Spilt"],
    index: json["Index"],
  );

  Map<String, dynamic> toJson() => {
    "Alignment": alignmentValues.reverse[alignment],
    "FontSize": fontSize,
    "FontColor": fontColorValues.reverse[fontColor],
    "BackgroundColor": backgroundColorValues.reverse[backgroundColor],
    "TextStyle": textStyleValues.reverse[textStyle],
    "RowNumber": rowNumber,
    "Columns": columns,
    "HeaderText": headerText,
    "IsDefault2Spilt": isDefault2Spilt,
    "Index": index,
  };
}

enum Alignment { LEFT }

final alignmentValues = EnumValues({"left": Alignment.LEFT});

enum BackgroundColor { THE_2_F5_D83 }

final backgroundColorValues = EnumValues({
  "#2f5d83": BackgroundColor.THE_2_F5_D83,
});

enum FontColor { FFFFFF }

final fontColorValues = EnumValues({"#ffffff": FontColor.FFFFFF});

enum TextStyle { BOLD }

final textStyleValues = EnumValues({"bold": TextStyle.BOLD});

class LanguageList {
  String code;
  int instituteId;
  String languageCode;
  String text;
  int value;

  LanguageList({
    required this.code,
    required this.instituteId,
    required this.languageCode,
    required this.text,
    required this.value,
  });

  factory LanguageList.fromJson(Map<String, dynamic> json) => LanguageList(
    code: json["Code"],
    instituteId: json["InstituteID"],
    languageCode: json["LanguageCode"],
    text: json["Text"],
    value: json["Value"],
  );

  Map<String, dynamic> toJson() => {
    "Code": code,
    "InstituteID": instituteId,
    "LanguageCode": languageCode,
    "Text": text,
    "Value": value,
  };
}

class PaymentInfo {
  bool receivePaymentEnabled;
  String paymentAmount;
  bool isPaymentMandate;
  dynamic userPaymentDate;

  PaymentInfo({
    required this.receivePaymentEnabled,
    required this.paymentAmount,
    required this.isPaymentMandate,
    required this.userPaymentDate,
  });

  factory PaymentInfo.fromJson(Map<String, dynamic> json) => PaymentInfo(
    receivePaymentEnabled: json["ReceivePaymentEnabled"],
    paymentAmount: json["PaymentAmount"],
    isPaymentMandate: json["IsPaymentMandate"],
    userPaymentDate: json["UserPaymentDate"],
  );

  Map<String, dynamic> toJson() => {
    "ReceivePaymentEnabled": receivePaymentEnabled,
    "PaymentAmount": paymentAmount,
    "IsPaymentMandate": isPaymentMandate,
    "UserPaymentDate": userPaymentDate,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
