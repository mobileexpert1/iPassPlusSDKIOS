//import Foundation
//class FrenchDataValueds {
//func getDictionary() -> [String: String] {
//return [
//
//    "dsfds" : ""
//
//    ,"العملية المطلوبة تمت بالفعل :RFID_Error_AlreadyDone" : "RFID"
//,"مشغول RFID_Error_Busy" : "RFID: RFID"
//,"فشل :RFID_Error_Failed" : "RFID"
//,"ملف: خطأ في الإدخال/الإخراج RFID_Error_FileIOError" : "RFID"
//,"مجلد غير صالح :RFID_Error_InvalidDirectory" : "RFID"
//في الاستدعاء معلمة غير صالحة :RFID_Error_InvalidParameter" : "RFID"
//ExecuteCommand()",
//,"لا يتم الكشف عن رقاقة :RFID_Error_NoChipDetected" : "RFID"
//,"غير متاح :RFID_Error_NotAvailable" : "RFID"
//,"نفاد الذاكرة :RFID_Error_NotEnoughMemory" : "RFID"
//,"الجهاز غير مهيأ :RFID_Error_NotInitialized" : "RFID"
//,"لم يتم التنفيذ :RFID_Error_NotPerformed" : "RFID"
//,"البرنامج الثابت يحتاج إلى تحديث بإصدار أحدث :RFID_Error_OldFirmware" : "RFID"
//لا يمكن توصيل البط :RFID_Error_PCSC_CantConnectCard" : "PCSC"
//," اقة
//,"البطاقة مشغولة :RFID_Error_PCSC_CardIsBusy" : "PCSC"
//,"البطاقة غير متصلة :RFID_Error_PCSC_CardIsNotConnected" : "PCSC"
//"RFID_Error_PCSC_ExtLe_Failed" : "PCSC: فشل في ExtLe",
//,"فشل :RFID_Error_PCSC_Failed" : "PCSC"
//,"فشل في البطاقة الذكية :RFID_Error_PCSC_FailedSCard" : "PCSC"
//,"تم إلغاء العملية :RFID_Error_PCSC_OperationCancelled" : "PCSC"
//,"القارئ غير متاح :RFID_Error_PCSC_ReaderNotAvailable" : "PCSC"
//"RFID_Error_Session_AccessControl_AA_Failed" : "RFID: فشل AA",
//"RFID_Error_Session_AccessControl_CA_Failed" : "RFID: فشل CA",
//غير CA خيار :RFID_Error_Session_AccessControl_IncorrectOptionCA" : "RFID"
//,"صحيح
//"RFID_Error_Session_AccessControl_RI_Failed" : "RFID: فشل RI",
//"RFID_Error_Session_AccessControl_RequiresCA" : "RFID: يتطلب CA",
//"RFID_Error_Session_AccessControl_RequiresCAKeys" : "RFID: يتطلب مفاتيح CA",
//"RFID_Error_Session_AccessControl_RequiresPACE" : "RFID: يتطلب PACE",
//"RFID_Error_Session_AccessControl_RequiresSM" : "RFID: يتطلب SM",
//"RFID_Error_Session_AccessControl_RequiresTA" : "RFID: يتطلب TA",
//"RFID_Error_Session_AccessControl_TA_Failed" : "RFID: فشل TA",
//نوع التحكم في الوصول :RFID_Error_Session_AccessControl_UnknownType" : "RFID"
//,"غير معروف
//بيانات مفتاح ا :RFID_Error_Session_AccessKey_IncorrectData" : "RFID"
//لوصول غير
//,"صحيحة
//غير صحيح SM نوع :RFID_Error_Session_AccessKey_IncorrectSMType" : "RFID"
//,"لمفتاح الوصول
//,"المفتاح غير مضبوط :RFID_Error_Session_AccessKey_NotSet" : "RFID"
//,"مفتاح الوصول مقيد :RFID_Error_Session_AccessKey_Restricted" : "RFID"
//نوع غير معروف لمفتاح :RFID_Error_Session_AccessKey_UnknownType" : "RFID"
//,"الوصول
//غير SM نوع :RFID_Error_Session_AccessKey_UnsupportedSMType" : "RFID"
//,"مدعوم لمفتاح الوصول
//,"ملف: الوصول مرفوض RFID_Error_Session_File_AccessDenied" : "RFID"
//,"ملف: لا يمكن قراءة البيانات RFID_Error_Session_File_CantReadData" : "RFID"
//,"ملف: لا يمكن استخدام البيانات RFID_Error_Session_File_CantUseData" : "RFID"
//ملف: محتوى البيانات RFID_Error_Session_File_Contents_UnexpectedData" : "RFID"
//,"غير متوقع
//,"ملف: بيانات غير صحيحة RFID_Error_Session_File_IncorrectData" : "RFID"
//,"ملف: البيانات غير كافية RFID_Error_Session_File_NotEnoughData" : "RFID"
//,"ملف: بيانات غير متوقعة RFID_Error_Session_File_UnexpectedData" : "RFID"
//,"ملف: علامة خاطئة RFID_Error_Session_File_WrongTag" : "RFID"
//,"بيانات غير صحيحة :RFID_Error_Session_IncorrectData" : "RFID"
//بيانات مساعدة غير :RFID_Error_Session_InvalidAuxData_CommunityID" : "RFID"
//,"صالحة لمعرف المجتمع
//بيانات مساعدة غير :RFID_Error_Session_InvalidAuxData_DateOfBirth" : "RFID"
//,"صالحة لتاريخ الميلاد
//بيانات مساعدة غير :RFID_Error_Session_InvalidAuxData_DateOfExpiry" : "RFID"
//,"صالحة لتاريخ انتهاء الصلاحية
//,"الجلسة مغلقة :RFID_Error_Session_IsClosed" : "RFID"
//,"فشل التحقق من التجزئة :RFID_Error_Session_PA_HashCheckFailed" : "RFID"
//فشل الت :RFID_Error_Session_PA_SignatureCheckFailed" : "RFID"
//,"SO حقق من توقيع
//,"نوع الإجراء غير مضبوط :RFID_Error_Session_ProcedureType_NotSet" : "RFID"
//,"نوع الإجراء غير معروف :RFID_Error_Session_ProcedureType_Unknown" : "RFID"
//نوع :RFID_Error_Session_ProcedureType_Unsupported" : "RFID"
//الإجراء غير
//,"مدعوم
//إدارة كلمة المرور :RFID_Error_Session_PwdManagement_NotAuthorized" : "RFID"
//,"غير مصرح بها
//,"نوع المحطة شهادة سيئة :RFID_Error_Session_TerminalType_BadCertificate" : "RFID"
//,"نوع المحطة غير مضبوط :RFID_Error_Session_TerminalType_NotSet" : "RFID"
//,"نوع المحطة غير معروف :RFID_Error_Session_TerminalType_Unknown" : "RFID"
//عملية غير مدعومة :RFID_Error_Session_Terminal_UnsupportedOperation" : "RFID"
//,"للمحطة
//معرف التوقيع الإلكتروني غير :RFID_Error_Session_eSign_PIN_NotSet" : "RFID"
//,"مضبوط
//معرف التوقيع الإلكتروني غير :RFID_Error_Session_eSign_PIN_NotVerified" : "RFID"
//,"متحقق
//التوقيع الإلكتروني :RFID_Error_Session_eSign_RequiresAppSelection" : "RFID"
//,"يتطلب اختيار التطبيق
//,"أمر غير معروف :RFID_Error_UnknownCommand" : "RFID"
//,"فشل اختيار التطبيق :RFID_LAYER6_APP_SELECTION_FAILURE" : "LAYER6"
//,"فشل المصادقة الخارجية :RFID_LAYER6_EXT_AUTH_FAILURE" : "LAYER6"
//,"قراءة خارج نهاية الملف / نهاية غير متوقعة :RFID_LAYER6_FILE_EOF1" : "LAYER6"
//,"قراءة خارج نهاية الملف / نهاية غير متوقعة :RFID_LAYER6_FILE_EOF2" : "LAYER6"
//فشل اختيار الملف / الملف غير مو :RFID_LAYER6_FILE_NOT_FOUND" : "LAYER6"
//," جود
//,"فشل المصادقة العامة :RFID_LAYER6_GENERAL_AUTH_FAILURE" : "LAYER6"
//"RFID_LAYER6_GET_CHALLENGE_FAILURE" : "LAYER6: فشل GET
//CHALLENGE",
//,"معلمات غير صحيحة :RFID_LAYER6_INCORRECT_PARAMS" : "LAYER6"
//,"فشل المصادقة الداخلية :RFID_LAYER6_INT_AUTH_FAILURE" : "LAYER6"
//"RFID_LAYER6_MSE_SET_AT_FAILURE" : "LAYER6: فشل MSE:Set AT",
//"RFID_LAYER6_MSE_SET_DST_FAILURE" : "LAYER6: فشل MSE:Set DST",
//"RFID_LAYER6_MSE_SET_KAT_FAILURE" : "LAYER6: فشل MSE:Set KAT",
//,"فشل التشفير في المصادقة المتبادلة :RFID_LAYER6_MUTUAL_AUTH_ENC_FAIL" : "LAYER6"
//,"فشل المصادقة المتبادلة :RFID_LAYER6_MUTUAL_AUTH_FAILURE" : "LAYER6"
//في المصادقة MAC فشل :RFID_LAYER6_MUTUAL_AUTH_MAC_FAIL" : "LAYER6"
//,"المتبادلة
//بيانات الاستجابة غير :RFID_LAYER6_NON_TLV_RESPONSE_DATA" : "LAYER6"
//TLV",
//,"لا توجد بيانات مرجعية :RFID_LAYER6_NO_REFERENCE_DATA" : "LAYER6"
//"RFID_LAYER6_PSO_CERTIFICATE_FAILURE" : "LAYER6: فشل شهادة PSO",
//,"كلمة المرور محظورة :RFID_LAYER6_PWD_BLOCKED" : "LAYER6"
//,"كلمة المرور محظورة :RFID_LAYER6_PWD_BLOCKED_2" : "LAYER6"
//,"تم تعطيل كلمة المرور :RFID_LAYER6_PWD_DEACTIVATED" : "LAYER6"
//,"تم تعطيل كلمة المرور :RFID_LAYER6_PWD_DEACTIVATED_2" : "LAYER6"
//,"فشل كلمة المرور :RFID_LAYER6_PWD_FAILED" : "LAYER6"
//,"تم تعليق كلمة المرور :RFID_LAYER6_PWD_SUSPENDED" : "LAYER6"
//,"تم تعليق كلمة المرور :RFID_LAYER6_PWD_SUSPENDED_2" : "LAYER6"
//,"لم يتم تنشيط الرسائل الآمنة :RFID_LAYER6_SECURITY_MANAGER" : "LAYER6"
//- فشل الرسائل الآمنة :RFID_LAYER6_SM_DO87_INCORRECT" : "LAYER6"
//,"غير صحيح cryptogram
//"RFID_LAYER6_SM_DO87_MISSING" : "LAYER6: فشل الرسائل الآمنة - cryptogram
//,"مفقود
//,"مفقود MAC - فشل الرسائل الآمنة :RFID_LAYER6_SM_DO8E_MISSING" : "LAYER6"
//- فشل الرسائل الآمنة :RFID_LAYER6_SM_DO99_MISSING" : "LAYER6"
//بايتات الحالة
//,"المؤمنة مفقودة
//غير MAC - فشل الرسائل الآمنة :RFID_LAYER6_SM_MAC_INCORRECT" : "LAYER6"
//,"صحيح
//طول البيانات غير صحيح :RFID_LAYER6_WRONG_RND_ICC_LENGTH" : "LAYER6"
//(APDU_INS_GET_CHALLENGE)",
//"RSDT_RFID_READING_FINISHED" : "انتهاء قراءة بيانات RFID",
//,"غير معروف" : "TCT_Unknown"
//,"اختلاف سطوع الصفحتين" : "chd_BackgroundComparisonError"
//,"فشل الحماية العكسية" : "chd_BadAreaInAxial"
//,"خطأ في تنسيق بيانات الباركود" : "chd_BarcodeDataFormatError"
//,"تم قراءة الباركود بأخطاء" : "chd_BarcodeReadedWithErrors"
//,"خطأ في معلمات الباركود" : "chd_BarcodeSizeParamsError"
//,"تم إلغاء المستند" : "chd_DocumentIsCancelling"
//,"يجب تلوين العنصر" : "chd_ElementShouldBeColored"
//,"يجب أن يكون العنصر من الدرجات الرمادية" : "chd_ElementShouldBeGrayscale"
//,"استثناء معترض" : "chd_ExceptionInModule"
//,"غير صحيحة IPI معلمات" : "chd_FalseIPIParameters"
//,"وجود أجسام لامعة زائدة" : "chd_FalseLuminiscenceError"
//,"التوهج الزائف في الأشعة فوق البنفسجية" : "chd_FalseLuminiscenceInBlank"
//"chd_FalseLuminiscenceInMRZ" : "توهج زائد في MRZ",
//,"لا توجد ألياف" : "chd_FibersNotFound"
//,"ضوء زائد في الأشعة تحت الحمراء" : "chd_FieldPosCorrector_Highlight_IR"
//,"خطأ منطقي عند مقارنة الحقول" : "chd_FieldsComparisonLogicError"
//,"عدم تطابق الكائن المحدد" : "chd_FixedPatternError"
//,"الهولوجرام غير موجود" : "chd_HologramElementAbsent"
//,"تم العثور على الهولوجرام" : "chd_HologramElementPresent"
//,"لا توجد صور جانبية أو علوية" : "chd_Hologram_Side_Top_Images_Absent"
//سطوع الخلفية غير ص " : "chd_IncorrectBackgroundLight"
//," حيح
//,"لون النص غير صحيح" : "chd_IncorrectTextColor"
//,"خطأ في معالجة البيانات الداخلية" : "chd_InternalError"
//,"المجموع النصي غير صالح" : "chd_InvalidChecksum"
//صيغة الحقل لا تتطاب " : "chd_InvalidFieldFormat"
//," ق مع وصف المستند
//,"بيانات إدخال غير صالحة" : "chd_InvalidInputData"
//,"يجب أن يكون الكائن غير مرئي" : "chd_InvisibleElementPresent"
//,"خطأ منطقي في البيانات" : "chd_LogicError"
//ت " : "chd_LowContrastInIRLight"
//," باين ضئيل في الضوء تحت الحمراء
//,"ظروف إضاءة غير مناسبة لالتقاط الصور" : "chd_MobileImages_LowLightConditions"
//فارق ضئيل بين الصور في خطط إضاءة " : "chd_MobileImages_WhileUVNoDifference"
//,"مختلفة
//الصو " : "chd_NecessaryImageNotFound"
//," رة المطلوبة لهذا الفحص غير موجودة
//,"يجب أن يحتوي هذا المستند على المزيد من رموز الباركود" : "chd_NotAllBarcodesRead"
//,"تحت الضوء الأبيض OVI عدم تطابق لون الكائن" : "chd_OVI_BadColor_Front"
//"chd_OVI_BadColor_Percent" : "نسبة منخفضة من التطابق بين عناصر OVI",
//,"تحت الضوء العكسي OVI عدم تطابق لون الكائن" : "chd_OVI_BadColor_Side"
//,"ثابت OVI لون" : "chd_OVI_ColorInvariable"
//"chd_OVI_IR_Invisible" : "عدم تطابق تباين الكائن OVI",
//"chd_OVI_InsufficientArea" : "مساحة غير كافية لكائن OVI",
//,"غير متناسق OVI مجال ألوان كائن" : "chd_OVI_Wide_Color_Spread"
//,"لا توجد أخطاء" : "chd_Pass"
//,"توهج زائف في منطقة الصورة" : "chd_PhotoFalseLuminiscence"
//,"ألوان النمط على الصورة والفارغة مختلفة" : "chd_PhotoPattern_DifferentColors"
//,"سمك خطوط النمط مختلف" : "chd_PhotoPattern_DifferentLinesThickness"
//"chd_PhotoPattern_IR_Visible" : "نمط الأمان مرئي في IR",
//,"يحتوي النمط بين الصورة والفارغة على انقطاع" : "chd_PhotoPattern_Interrupted"
//,"لون غير صالح للنمط الأمني" : "chd_PhotoPattern_InvalidColor"
//,"حافة الصورة لا تتقاطع مع النمط" : "chd_PhotoPattern_Not_Intersect"
//,"لم يتم العثور على النمط في منطقة الصورة" : "chd_PhotoPattern_PatternNotFound"
//,"النمط على الصورة مزاحج" : "chd_PhotoPattern_Shifted"
//,"خطوط النمط تنحرف رأسيًا" : "chd_PhotoPattern_Shifted_Vert"
//لم يتم ا " : "chd_PhotoSidesNotFound"
//," لعثور على الحافة الصورة المطلوبة
//,"حجم الصورة غير صحيح" : "chd_PhotoSize_Is_Wrong"
//,"زوايا الصورة لا تلبي المتطلبات" : "chd_Photo_Corners_Is_Wrong"
//,"شكل الصورة ليس مستطيلا ً " : "chd_Photo_IsNot_Rectangle"
//,"لا توجد صورة حية" : "chd_PortraitComparison_NoLivePhoto"
//,"لا توجد وجوه مكتشفة في الصورة" : "chd_PortraitComparison_NoPortraitDetected"
//,"لا يوجد ترخيص للخدمة" : "chd_PortraitComparison_NoServiceLicense"
//,"الخدمة لا تستجيب" : "chd_PortraitComparison_NoServiceReply"
//,"لا توجد صور كافية" : "chd_PortraitComparison_NotEnoughImages"
//,"الصور الشخصية لا تتطابق" : "chd_PortraitComparison_PortraitsDiffer"
//,"خطأ في الخدمة" : "chd_PortraitComparison_ServiceError"
//,"عدم تطابق البيانات من مصادر مختلفة" : "chd_SourcesComparisonError"
//,"تعرض زائد أو توهجات في الصورة تحت الضوء فوق البنفسجي" : "chd_SpecksInUV"
//,"خطأ في صياغة البيانات" : "chd_SyntaxError"
//,"يجب أن يكون لون النص أزرق" : "chd_TextColorShouldBeBlue"
//,"يجب أن يكون لون النص أخضر" : "chd_TextColorShouldBeGreen"
//,"يجب أن يكون لون النص أحمر" : "chd_TextColorShouldBeRed"
//يجب أن يكون لون " : "chd_TextShouldBeBlack"
//," النص أسود
//,"الدقة منخفضة جدًا لكشف الألياف" : "chd_TooLowResolution"
//,"يوجد الكثير من الكائنات" : "chd_TooManyObjects"
//,"قيمة التحول أكبر من القيمة المسموح بها" : "chd_TooMuchShift"
//,"عدم تطابق كائنات التوهج" : "chd_TrueLuminiscenceError"
//,"خطأ في فحص الورق الباهت بالأشعة فوق البنفسجية" : "chd_UVDullPaperError"
//,"فحص الورق الباهت بالأشعة فوق البنفسجية في منطقة الفارغ" : "chd_UVDullPaper_Blank"
//"chd_UVDullPaper_MRZ" : "فحص الورق الباهت بالأشعة فوق البنفسجية في منطقة MRZ",
//,"فحص الورق الباهت بالأشعة فوق البنفسجية في منطقة الصورة" : "chd_UVDullPaper_Photo"
//,"تعذر اتخاذ قرار موثوق" : "chd_UncertainVerification"
//,"رفض غير معروف" : "chd_Unknown"
//,"لا يوجد كائن مرئي تحت الأشعة تحت الحمراء" : "chd_VisibleElementAbsent"
//"strAGY" : "AGY",
//"strAKADateofBirth" : "تاريخ الميلاد AKA",
//"strAKAGivenNames" : "الأسماء الأولى AKA",
//"strAKANamePrefix" : "بادئة الاسم AKA",
//"strAKANameSuffix" : "لاحقة الاسم AKA",
//"strAKASocialSecurityNumber" : "رقم الضمان الاجتماعي AKA",
//"strAKASurname" : "اللقب AKA",
//"strAKASurnameAndGivenNames" : "الاسم الكامل AKA",
//"strALTCode" : "رمز ALT",
//,"اللقب الأكاديمي" : "strAcademicTitle"
//,"التقاط صورة وبدء المعالجة" : "strAccessibilityCameraButton"
//,"إغلاق" : "strAccessibilityCloseButton"
//,"ضوء" : "strAccessibilityTorchButton"
//,"مرافقة بواسطة" : "strAccompaniedby"
//,"العنوان" : "strAddress"
//,"المنطقة" : "strAddressArea"
//,"الوحدة" : "strAddressBuilding"
//,"المدينة" : "strAddressCity"
//,"البلد" : "strAddressCountry"
//,"الشقة" : "strAddressFlat"
//,"المبنى" : "strAddressHouse"
//,"رمز الولاية" : "strAddressJurisdictionCode"
//,"الموقع" : "strAddressLocation"
//,"البلدية" : "strAddressMunicipality"
//,"الرمز البريدي" : "strAddressPostalCode"
//,"الولاية" : "strAddressState"
//,"الشارع" : "strAddressStreet"
//,"الرقم الإداري" : "strAdministrativeNumber"
//,"العمر" : "strAge"
//,"العمر عند الإصدار" : "strAgeAtIssue"
//,"معرف الشركة الجوية لمصدر بطاقة الصعود" : "strAirlineDesignatorofboardingpassissuer"
//,"اسم الشركة الجوية" : "strAirlineName"
//,"برنامج الولاء للمسافرين المتكررين للشركة الجوية" : "strAirlineNameFrequentFlyer"
//,"الرمز الرقمي للشركة الجوية" : "strAirlineNumericCode"
//,"مطار المغادرة" : "strAirportFrom"
//,"مطار الوصول" : "strAirportTo"
//," ساسيات الح " : "strAllergies"
//التطبيق ليس لديه إذن لاستخدام الكاميرا، يرجى تغيير " : "strApplicationDoNotHavePermission"
//,"إعدادات الخصوصية
//,"رقم التطبيق" : "strApplicationNumber"
//,"اسم فني" : "strArtisticName"
//,"رقم التحقق" : "strAuditInformation"
//,"التحقق من الأصالة" : "strAuthentification"
//,"سلطة الإصدار" : "strAuthority"
//,"رمز سلطة الإصدار" : "strAuthorityCode"
//,")سلطة الإصدار (الوطنية" : "strAuthorityRUS"
//,"رقم التفويض" : "strAuthorizationNumber"
//,"حماية محورية" : "strAxialProtection"
//"strBDBType" : "نوع BDB",
//,"رقم بطاقة البنك" : "strBankCardNumber"
//,"صلاحية بطاقة البنك" : "strBankCardValidThru"
//,"رقم الورقة النقدية" : "strBanknoteNumber"
//,"رمز شريطي" : "strBarcode"
//,"فحص تنسيق رمز الشريطي" : "strBarcodeFormatCheck"
//,"رقم المزايا" : "strBenefitsNumber"
//,"الرمز الثنائي" : "strBinaryCode"
//,"مالك تنسيق البيومتريات" : "strBiometricFormatOwner"
//,"نوع تنسيق البيومتريات" : "strBiometricFormatType"
//,"معرف المنتج البيومتري" : "strBiometricProductID"
//,"النوع الفرعي للبيانات البيومترية" :"strBiometricSubtype"
//,"نوع البيانات البيومترية" :"strBiometricType"
//,"العنصر الفارغ" :"strBlankElement"
//,"فصيلة الدم" :"strBloodGroup"
//,"رقم الكتيب" :"strBookletNumber"
//,"حتى strCCWUntil": "CCW"
//"strCDLClass": "فئة CDL",
//"strCSCCode": "رمز CSC",
//"strCVV": "CVV/CVC",
//,"العيار" :"strCaliber"
//,"الكاميرا غير متوفرة" :"strCameraUnavailable"
//,"رقم الوصول للبطاقة" :"strCardAccessNumber"
//,"الفئة" :"strCategory"
//,"قرن الميلاد" :"strCenturyDateOfBirth"
//,"رقم الهيكل" :"strChassisNumber"
//,"رقم تسلسل الوصول" :"strCheckInSequenceNumber"
//,"الأطفال" :"strChildren"
//,"جنسية الشخص الأول" :"strCitizenshipOfFirstPerson"
//,"جنسية الشخص الثاني" :"strCitizenshipOfSecondPerson"
//,"الحالة الاجتماعية" :"strCivilStatus"
//,"توزيع الألوان" :"strColorDynamic"
//,"رموز المركبات التجارية" :"strCommercialVehicleCodes"
//,"اسم الشركة" :"strCompanyName"
//,"رمز الحجرة" :"strCompartmentCode"
//,"البشرة" :"strComplexion"
//,"نوع الامتثال" :"strComplianceType"
//,"الشروط" :"strConditions"
//,"التكوين" :"strConfiguration"
//,"رقم التحكم" :"strControlNo"
//,"نسخة" :"strCopy"
//,"رمز المحكمة" :"strCourtCode"
//,"المقاطعة" :"strCty"
//,"التاريخ الحالي" :"strCurrentDate"
//,"معلومات الحضانة" :"strCustodyInfo"
//,"دليل التطبيق" :"strDFTAppDirectory"
//," شهادة ال " :"strDFTCertificate"
//"strDG1": "ًالمنطقة القابلة للقراءة آليا (DG1)",
//"strDG10": "غير معرف (DG10)",
//"strDG11": "تفاصيل شخصية إضافية (DG11)",
//"strDG12": "تفاصيل المستند الإضافية (DG12)",
//"strDG13": "تفاصيل اختيارية (DG13)",
//"strDG14": "معلومات EAC (DG14)",
//"strDG15": "معلومات المصادقة النشطة (DG15)",
//"strDG16": "الأشخاص للإعلام بهم (DG16)",
//"strDG17": "DG17",
//"strDG18": "DG18",
//"strDG19": "DG19",
//- البيولوجيا " :"strDG2"
//,")DG2( بيانات الوجه
//"strDG20": "DG20",
//- البيولوجيا " :"strDG3"
//بصمة(بصمات)
//,")DG3( الأصبع
//- البيولوجيا " :"strDG4"
//,")DG4( بيانات القزحية
//"strDG5": "الصور الشخصية (DG5)",
//"strDG6": "غير معرف (DG6)",
//"strDG7": "صورة التوقيع / العلامة المعتادة (DG7)",
//"strDG8": "غير معرف (DG8)",
//"strDG9": "غير معرف (DG9)",
//,"رمز قيد رخصة القيادة التجارية" :"strDLCDLRestrictionCode"
//,"فئة رخصة القيادة" :"strDLClass"
//,"سارية من A1 فئة رخصة القيادة" :"strDLClassCodeA1From"
//"strDLClassCodeA1Notes": "رموز فئة رخصة القيادة A1",
//,"سارية حتى A1 فئة رخصة القيادة" :"strDLClassCodeA1To"
//,"سارية من A2 فئة رخصة القيادة" :"strDLClassCodeA2From"
//"strDLClassCodeA2Notes": "رموز فئة رخصة القيادة A2",
//,"سارية حتى A2 فئة رخصة القيادة" :"strDLClassCodeA2To"
//,"سارية من A3 فئة رخصة القيادة" :"strDLClassCodeA3From"
//"strDLClassCodeA3Notes": "رموز فئة رخصة القيادة A3",
//,"سارية حتى A3 فئة رخصة القيادة" :"strDLClassCodeA3To"
//,"سارية من A فئة رخصة القيادة" :"strDLClassCodeAFrom"
//,"سارية من AM فئة رخصة القيادة" :"strDLClassCodeAMFrom"
//"strDLClassCodeAMNotes": "رموز فئة رخصة القيادة AM",
//,"سارية حتى AM فئة رخصة القيادة" :"strDLClassCodeAMTo"
//"strDLClassCodeANotes": "رموز فئة رخصة القيادة A",
//,"سارية حتى A فئة رخصة القيادة" :"strDLClassCodeATo"
//,"سارية من B1 فئة رخصة القيادة" :"strDLClassCodeB1From"
//رموز فئة " :"strDLClassCodeB1Notes"
//,"B1 رخصة القيادة
//,"سارية حتى B1 فئة رخصة القيادة" :"strDLClassCodeB1To"
//,"سارية من B2E فئة رخصة القيادة" :"strDLClassCodeB2EFrom"
//"strDLClassCodeB2ENotes": "رموز فئة رخصة القيادة B2E",
//,"سارية حتى B2E فئة رخصة القيادة" :"strDLClassCodeB2ETo"
//,"سارية من B2 فئة رخصة القيادة" :"strDLClassCodeB2From"
//"strDLClassCodeB2Notes": "رموز فئة رخصة القيادة B2",
//,"سارية حتى B2 فئة رخصة القيادة" :"strDLClassCodeB2To"
//,"سارية من BE فئة رخصة القيادة" :"strDLClassCodeBEFrom"
//"strDLClassCodeBENotes": "رموز فئة رخصة القيادة BE",
//,"سارية حتى BE فئة رخصة القيادة" :"strDLClassCodeBETo"
//,"سارية من B فئة رخصة القيادة" :"strDLClassCodeBFrom"
//"strDLClassCodeBNotes": "رموز فئة رخصة القيادة B",
//,"سارية من BTP فئة رخصة القيادة" :"strDLClassCodeBTPFrom"
//"strDLClassCodeBTPNotes": "رموز فئة رخصة القيادة BTP",
//,"سارية حتى BTP فئة رخصة القيادة" :"strDLClassCodeBTPTo"
//,"سارية حتى B فئة رخصة القيادة" :"strDLClassCodeBTo"
//,"سارية من C1E فئة رخصة القيادة" :"strDLClassCodeC1EFrom"
//"strDLClassCodeC1ENotes": "رموز فئة رخصة القيادة C1E",
//,"سارية حتى C1E فئة رخصة القيادة" :"strDLClassCodeC1ETo"
//,"سارية من C1 فئة رخصة القيادة" :"strDLClassCodeC1From"
//"strDLClassCodeC1Notes": "رموز فئة رخصة القيادة C1",
//,"سارية حتى C1 فئة رخصة القيادة" :"strDLClassCodeC1To"
//,"سارية من C2 فئة رخصة القيادة" :"strDLClassCodeC2From"
//"strDLClassCodeC2Notes": "رموز فئة رخصة القيادة C2",
//,"سارية حتى C2 فئة رخصة القيادة" :"strDLClassCodeC2To"
//,"سارية من C3 فئة رخصة القيادة" :"strDLClassCodeC3From"
//"strDLClassCodeC3Notes": "رموز فئة رخصة القيادة C3",
//,"سارية حتى C3 فئة رخصة القيادة" :"strDLClassCodeC3To"
//,"سارية من CA فئة رخصة القيادة" :"strDLClassCodeCAFrom"
//"strDLClassCodeCANotes": "رموز فئة رخصة القيادة CA",
//,"سارية حتى CA فئة رخصة القيادة" :"strDLClassCodeCATo"
//,"سارية من CE فئة رخصة القيادة" :"strDLClassCodeCEFrom"
//"strDLClassCodeCENotes": "رموز فئة رخصة القيادة CE",
//,"سارية حتى CE فئة رخصة القيادة" :"strDLClassCodeCETo"
//,"سارية من C فئة رخصة القيادة" :"strDLClassCodeCFrom"
//"strDLClassCodeCNotes": "رموز فئة رخصة القيادة C",
//,"سارية حتى C فئة رخصة القيادة" :"strDLClassCodeCTo"
//,"سارية من D1E فئة رخصة القيادة" :"strDLClassCodeD1EFrom"
//"strDLClassCodeD1ENotes": "رموز فئة رخصة القيادة D1E",
//,"سارية حتى D1E فئة رخصة القيادة" :"strDLClassCodeD1ETo"
//,"سارية من D1 فئة رخصة القيادة" :"strDLClassCodeD1From"
//"strDLClassCodeD1Notes": "رموز فئة رخصة القيادة D1",
//,"سارية حتى D1 فئة رخصة القيادة" :"strDLClassCodeD1To"
//,"سارية من D2 فئة رخصة القيادة" :"strDLClassCodeD2From"
//"strDLClassCodeD2Notes": "رموز فئة رخصة القيادة D2",
//,"سارية حتى D2 فئة رخصة القيادة" :"strDLClassCodeD2To"
//,"سارية من DE فئة رخصة القيادة" :"strDLClassCodeDEFrom"
//"strDLClassCodeDENotes": "رموز فئة رخصة القيادة DE",
//,"سارية حتى DE فئة رخصة القيادة" :"strDLClassCodeDETo"
//,"سارية من D فئة رخصة القيادة" :"strDLClassCodeDFrom"
//"strDLClassCodeDNotes": "رموز فئة رخصة القيادة D",
//,"سارية حتى D فئة رخصة القيادة" :"strDLClassCodeDTo"
//,"سارية من E فئة رخصة القيادة" :"strDLClassCodeEFrom"
//رموز فئة رخص " :"strDLClassCodeENotes"
//,"E ة القيادة
//,"سارية حتى E فئة رخصة القيادة" :"strDLClassCodeETo"
//,"سارية من FA1 فئة رخصة القيادة" :"strDLClassCodeFA1From"
//"strDLClassCodeFA1Notes": "رموز فئة رخصة القيادة FA1",
//,"سارية حتى FA1 فئة رخصة القيادة" :"strDLClassCodeFA1To"
//,"سارية من FA فئة رخصة القيادة" :"strDLClassCodeFAFrom"
//"strDLClassCodeFANotes": "رموز فئة رخصة القيادة FA",
//,"سارية حتى FA فئة رخصة القيادة" :"strDLClassCodeFATo"
//,"سارية من FB فئة رخصة القيادة" :"strDLClassCodeFBFrom"
//رموز فئة " :"strDLClassCodeFBNotes"
//,"FB رخصة القيادة
//,"سارية حتى FB فئة رخصة القيادة" :"strDLClassCodeFBTo"
//,"سارية من F فئة رخصة القيادة" :"strDLClassCodeFFrom"
//"strDLClassCodeFNotes": "رموز فئة رخصة القيادة F",
//,"سارية حتى F فئة رخصة القيادة" :"strDLClassCodeFTo"
//,"سارية من G1 فئة رخصة القيادة" :"strDLClassCodeG1From"
//"strDLClassCodeG1Notes": "رموز فئة رخصة القيادة G1",
//,"سارية حتى G1 فئة رخصة القيادة" :"strDLClassCodeG1To"
//,"سارية من G فئة رخصة القيادة" :"strDLClassCodeGFrom"
//رموز فئة رخصة " :"strDLClassCodeGNotes"
//,"G القيادة
//,"سارية حتى G فئة رخصة القيادة" :"strDLClassCodeGTo"
//,"سارية من HC فئة رخصة القيادة" :"strDLClassCodeHCFrom"
//"strDLClassCodeHCNotes": "رموز فئة رخصة القيادة HC",
//,"سارية حتى HC فئة رخصة القيادة" :"strDLClassCodeHCTo"
//,"سارية من H فئة رخصة القيادة" :"strDLClassCodeHFrom"
//"strDLClassCodeHNotes": "رموز فئة رخصة القيادة H",
//,"سارية من HR فئة رخصة القيادة" :"strDLClassCodeHRFrom"
//"strDLClassCodeHRNotes": "رموز فئة رخصة القيادة HR",
//سارية حت HR فئة رخصة القيادة" :"strDLClassCodeHRTo"
//," ى
//,"سارية حتى H فئة رخصة القيادة" :"strDLClassCodeHTo"
//,"سارية من I فئة رخصة القيادة" :"strDLClassCodeIFrom"
//"strDLClassCodeINotes": "رموز فئة رخصة القيادة I",
//,"سارية حتى I فئة رخصة القيادة" :"strDLClassCodeITo"
//فئة رخص " :"strDLClassCodeJFrom"
//,"سارية من J ة القيادة
//"strDLClassCodeJNotes": "رموز فئة رخصة القيادة J",
//,"سارية حتى J فئة رخصة القيادة" :"strDLClassCodeJTo"
//,"سارية من K فئة رخصة القيادة" :"strDLClassCodeKFrom"
//"strDLClassCodeKNotes": "رموز فئة رخصة القيادة K",
//,"سارية حتى K فئة رخصة القيادة" :"strDLClassCodeKTo"
//,"سارية من LC فئة رخصة القيادة" :"strDLClassCodeLCFrom"
//"strDLClassCodeLCNotes": "رموز فئة رخصة القيادة LC",
//,"سارية حتى LC فئة رخصة القيادة" :"strDLClassCodeLCTo"
//فئة ر " :"strDLClassCodeLFrom"
//,"سارية من L خصة القيادة
//,"سارية من LK فئة رخصة القيادة" :"strDLClassCodeLKFrom"
//"strDLClassCodeLKNotes": "رموز فئة رخصة القيادة LK",
//,"سارية حتى LK فئة رخصة القيادة" :"strDLClassCodeLKTo"
//"strDLClassCodeLNotes": "رموز فئة رخصة القيادة L",
//,"سارية من LR فئة رخصة القيادة" :"strDLClassCodeLRFrom"
//"strDLClassCodeLRNotes": "رموز فئة رخصة القيادة LR",
//,"سارية حتى LR فئة رخصة القيادة" :"strDLClassCodeLRTo"
//,"سارية حتى L فئة رخصة القيادة" :"strDLClassCodeLTo"
//فئة " :"strDLClassCodeMCFrom"
//,"سارية من MC رخصة القيادة
//"strDLClassCodeMCNotes": "رموز فئة رخصة القيادة MC",
//,"سارية حتى MC فئة رخصة القيادة" :"strDLClassCodeMCTo"
//,"سارية من M فئة رخصة القيادة" :"strDLClassCodeMFrom"
//"strDLClassCodeMNotes": "رموز فئة رخصة القيادة M",
//,"سارية من MR فئة رخصة القيادة" :"strDLClassCodeMRFrom"
//"strDLClassCodeMRNotes": "رموز فئة رخصة القيادة MR",
//,"سارية حتى MR فئة رخصة القيادة" :"strDLClassCodeMRTo"
//,"سارية حتى M فئة رخصة القيادة" :"strDLClassCodeMTo"
//فئة رخصة القي " :"strDLClassCodeNFrom"
//,"سارية من N ادة
//"strDLClassCodeNNotes": "رموز فئة رخصة القيادة N",
//,"سارية حتى N فئة رخصة القيادة" :"strDLClassCodeNTo"
//,"سارية من RE فئة رخصة القيادة" :"strDLClassCodeREFrom"
//"strDLClassCodeRENotes": "رموز فئة رخصة القيادة RE",
//,"سارية حتى RE فئة رخصة القيادة" :"strDLClassCodeRETo"
//,"سارية من R فئة رخصة القيادة" :"strDLClassCodeRFrom"
//"strDLClassCodeRNotes": "رموز فئة رخصة القيادة R",
//,"سارية حتى R فئة رخصة القيادة" :"strDLClassCodeRTo"
//,"سارية من S فئة رخصة القيادة" :"strDLClassCodeSFrom"
//"strDLClassCodeSNotes": "رموز فئة رخصة القيادة S",
//,"سارية حتى S فئة رخصة القيادة" :"strDLClassCodeSTo"
//,"سارية من TB فئة رخصة القيادة" :"strDLClassCodeTBFrom"
//"strDLClassCodeTBNotes": "رموز فئة رخصة القيادة TB",
//,"سارية حتى TB القيادة فئة رخصة " :"strDLClassCodeTBTo"
//,"سارية من T فئة رخصة القيادة" :"strDLClassCodeTFrom"
//,"سارية من TM فئة رخصة القيادة" :"strDLClassCodeTMFrom"
//"strDLClassCodeTMNotes": "رموز فئة رخصة القيادة TM",
//,"سارية حتى TM فئة رخصة القيادة" :"strDLClassCodeTMTo"
//"strDLClassCodeTNotes": "رموز فئة رخصة القيادة T",
//,"سارية من TR فئة رخصة القيادة" :"strDLClassCodeTRFrom"
//"strDLClassCodeTRNotes": "رموز فئة رخصة القيادة TR",
//,"سارية حتى TR فئة رخصة القيادة" :"strDLClassCodeTRTo"
//,"سارية حتى T فئة رخصة القيادة" :"strDLClassCodeTTo"
//,"سارية من TV فئة رخصة القيادة" :"strDLClassCodeTVFrom"
//"strDLClassCodeTVNotes": "رموز فئة رخصة القيادة TV",
//,"سارية حتى TV فئة رخصة القيادة" :"strDLClassCodeTVTo"
//,"سارية من V فئة رخصة القيادة" :"strDLClassCodeVFrom"
//"strDLClassCodeVNotes": "رموز فئة رخصة القيادة V",
//,"سارية حتى V فئة رخصة القيادة" :"strDLClassCodeVTo"
//,"سارية من W فئة رخصة القيادة" :"strDLClassCodeWFrom"
//"strDLClassCodeWNotes": "رموز فئة رخصة القيادة W",
//,"سارية حتى W فئة رخصة القيادة" :"strDLClassCodeWTo"
//,"تاريخ إصدار النسخة المكررة" :"strDLDuplicateDate"
//,"رمز توقيع رخصة القيادة" :"strDLEndorsed"
//,"نوع البطاقة" :"strDLIssType"
//,"تاريخ إنشاء السجل" :"strDLRecordCreated"
//,"رمز قيود رخصة القيادة" :"strDLRestrictionCode"
//,"تاريخ بلوغ سن الثامنة عشر" :"strDLUnder18Date"
//,"تاريخ بلوغ سن التاسعة عشر" :"strDLUnder19Date"
//,"تاريخ بلوغ سن الحادية والعشرين" :"strDLUnder21Date"
//,"رقم البطاقة الوطنية" :"strDNINumber"
//"strDSCertificateIssuer": "مصدر شهادة DS",
//موضوع " :"strDSCertificateSubject"
//,"DS شهادة
//"strDSCertificateValidFrom": "صالحة من تاريخ شهادة DS",
//"strDSCertificateValidTo": "صالحة إلى تاريخ شهادة DS",
//"strDUFNumber": "رقم DUF",
//,"مميز البيانات" :"strDataDiscriminator"
//,"تاريخ التجديد الأول" :"strDateFirstRenewal"
//,"تاريخ ميلاد الزوج" :"strDateOfBirthOfHusband"
//,"تاريخ ميلاد الزوجة" :"strDateOfBirthOfWife"
//,"تاريخ انتهاء التأمين" :"strDateOfInsuranceExpiry"
//,"تاريخ التجديد الثاني" :"strDateSecondRenewal"
//,"تاريخ الميلاد" :"strDateofBirth"
//,"الرقم التحققي لتاريخ الميلاد" :"strDateofBirthCheckDigit"
//,"مجموع التحقق لتاريخ الميلاد" :"strDateofBirthChecksum"
//,"تاريخ الإنشاء" :"strDateofCreation"
//,"تاريخ الانتهاء" :"strDateofExpiry"
//,"الرقم التحققي لتاريخ الانتهاء" :"strDateofExpiryCheckDigit"
//,"مجموع التحقق لتاريخ الانتهاء" :"strDateofExpiryChecksum"
//,"تاريخ الرحلة" :"strDateofFlight"
//,"تاريخ الإصدار" :"strDateofIssue"
//,"تاريخ إصدار بطاقة الصعود إلى الطائرة" :"strDateofIssueBoardingPass"
//الرقم التحققي لتاريخ الإصدا " :"strDateofIssueCheckDigit"
//," ر
//,"مجموع التحقق لتاريخ الإصدار" :"strDateofIssueChecksum"
//,"تاريخ التخصيص الشخصي" :"strDateofPersonalization"
//,"تاريخ التسجيل" :"strDateofRegistration"
//,"اليوم" :"strDay"
//,"القسم" :"strDepartment"
//,"رقم القسم" :"strDeptNumber"
//,"الوجهة" :"strDestination"
//,"البيانات التقديرية" :"strDiscretionaryData"
//,"رقم وزارة الدفاع" :"strDoDNumber"
//,"رمز فئة المستند" :"strDocumentClassCode"
//,"فئة المستند" :"strDocumentClassName"
//,"المميز المستند" :"strDocumentDiscriminator"
//,"رقم المستند" :"strDocumentNumber"
//,"الرقم التحققي لرقم المستند" :"strDocumentNumberCheckDigit"
//,"مجموع التحقق لرقم المستند" :"strDocumentNumberChecksum"
//,"سلسلة المستند" :"strDocumentSeries"
//,"المستند صغير جدا لإدخاله في الإطار" :"strDocumentTooSmall"
//,"المانح" :"strDonor"
//,"رقم الملف" :"strDossierNumber"
//,"مدة الإقامة" :"strDurationofStay"
//,"نوع البيئة للمركبة" :"strECEnvironmentalType"
//"strEDLDG1": "عناصر البيانات النصية (DG1)",
//"strEDLDG10": "غير محدد (DG10)",
//بيانات داخل " :"strEDLDG11"
//,")DG11( ية اختيارية
//"strEDLDG12": "تحذير عدم التطابق (DG12)",
//"strEDLDG13": "معلومات المصادقة النشطة (DG13)",
//"strEDLDG14": "معلومات EAC (DG14)",
//"strEDLDG2": "معلومات صاحب الترخيص (DG2)",
//"strEDLDG3": "تفاصيل السلطة الصادرة (DG3)",
//"strEDLDG4": "صورة البورتريه (DG4)",
//"strEDLDG5": "صورة التوقيع / العلامة المعتادة (DG5)",
//"strEDLDG6": "البيانات الوجهية الحيوية (DG6)",
//- البيانات الحيوية " :"strEDLDG7"
//,")DG7( بصمة(بصمات) الأصابع
//- البيانات الحيوية " :"strEDLDG8"
//,")DG8( بيانات القزحية
//- البيانات الحيوية " :"strEDLDG9"
//,")DG9( أخرى
//"strEFCOM": "EF.COM",
//"strEFCVCA": "EF.CVCA",
//"strEFCardAccess": "EF.CardAccess",
//"strEFCardSecurity": "EF.CardSecurity",
//"strEFChipSecurity": "EF.ChipSecurity",
//"strEFSOD": "EF.SOD",
//"strEQVCode": "رمز EQV",
//,"مؤشر التذكرة الإلكترونية" :"strElectronicTicketIndicator"
//,"العنصر" :"strElement"
//,"تاريخ انتهاء التوقيع" :"strEndorsementExpirationDate"
//,"نموذج المحرك" :"strEngineModel"
//,"رقم المحرك" :"strEngineNumber"
//,"قوة المحرك" :"strEnginePower"
//,"حجم المحرك" :"strEngineVolume"
//,"خطأ" :"strError"
//,"تاريخ الامتحان" :"strExamDate"
//,"ما عدا في الخزانات" :"strExeptInTanks"
//,"قزحية" :"strEye"
//,"لون العين" :"strEyesColor"
//,"الكلية" :"strFaculty"
//,"تشعاع زائف" :"strFalseLuminescence"
//,"اسم العائلة / الاسم الأول عند الولادة" :"strFamilyName"
//,"الاسم العائلي المقطوع / الاسم الأول عند الولادة المقطوع" :"strFamilyNameTruncation"
//,"خدمة السرعة" :"strFastTrack"
//,"بلد ميلاد الأب" :"strFatherCountryOfBirth"
//,"تاريخ ميلاد الأب" :"strFatherDateOfBirth"
//,"اسم الأب الشخصي" :"strFatherGivenName"
//,"رقم شخصي للأب" :"strFatherPersonalNumber"
//,"مكان ميلاد الأب" :"strFatherPlaceOfBirth"
//,"لقب الأب" :"strFatherSurname"
//,"اسم الأب" :"strFathersName"
//,")اسم الأب (وطني" :"strFathersNameRUS"
//,"الانتخابات الفيدرالية" :"strFederalElections"
//,"رسوم" :"strFee"
//"strFieldFromMRZ": "حقل من MRZ",
//"strFieldTypeDocumentImage" :
//"Document image",
//"strFillElement" : "Filling
//element",
//"strFinalCheckDigit" : "Final
//check digit",
//"strFinalChecksum" : "Final
//checksum",
//"strFingerprint" : "Fingerprint",
//"strFirstIssueDate" : "First issue
//date",
//"strFirstNameTruncation" : "First
//name truncation",
//"strFlightNumber" : "Flight
//number",
//"strFolioNumber" : "Folio number",
//"strFormOfEducation" : "Form of
//education",
//"strFreeBaggageAllowance" : "Free
//baggage allowance",
//"strFrequentFlyerAirlineDesignator" :
//"Frequent flyer airline designator",
//"strFrequentFlyerNumber" :
//"Frequent flyer number",
//"strFromAirportCode" : "Code of
//the airport of departure",
//"strFuelType" : "Fuel type",
//"strGNIBNumber" : "GNIB number",
//"strGhostPortrait" : "Ghost
//portrait",
//"strGivenNames" : "Given name",
//"strGivenNamesRUS" : "Given name
//(National)",
//"strGlaresOnDocument" : "Évitez
//les reflets sur le document",
//"strGrandfatherName" :
//"Grandfather's name",
//"strHairColor" : "Hair color",
//"strHealthNumber" : "Health
//insurance number",
//"strHeight" : "Height",
//"strHoldDocumentStraight" : "Hold
//the document straight",
//"strHoloSimple" : "Hologram
//availability",
//"strHoloVerifyDinamic" : "Verify
//dynamic hologram",
//"strHoloVerifyMultiStatic" :
//"Verify Multi Static Hologram",
//"strHoloVerifyStatic" : "Verify
//Static Hologram",
//"strHolograms" : "Holograms",
//"strIPI" : "IPI (invisible
//personal information)",
//"strIRB900" : "IR B900 ink",
//"strIRVis" : "IR transparency",
//"strISOIssuerIDNumber" : "ID
//number of ISO issuer",
//"strIdentifier" : "Identifier",
//"strIdentityCardNumber" :
//"Identity card number",
//"strIdentityCardNumberCheckDigit" : "Check
//digit for identity card number",
//"strIdentityCardNumberChecksum" :
//"Checksum for identity card number",
//"strImagePattern" : "Image
//patterns",
//"strInTanks" : "In tanks",
//"strInventoryNumber" : "Inventory
//number",
//"strInvitationNumber" :
//"Invitation number",
//"strInvitationNumberCheckDigit" :
//"Check digit for invitation number",
//"strInvitationNumberChecksum" :
//"Checksum for invitation number",
//"strInvitedBy" : "Invited by",
//"strIssueTimestamp" : "Issue
//time",
//"strIssuingStateCode" : "Issuing
//state code",
//"strIssuingStateName" : "Issuing
//state",
//"strJurisdictionEndorsementCode" :
//"Jurisdiction endorsement code",
//"strJurisdictionRestrictionCode" :
//"Jurisdiction restriction code",
//"strJurisdictionVehicleClass" :
//"Jurisdiction vehicle class",
//"strKeepDeviceStill" : "Tenez
//l'appareil immobile",
//"strLicenseNumber" : "License
//number",
//"strLimitedDurationDocumentIndicator" :
//"Indicator of document limited duration",
//"strLine1CheckDigit" : "Check
//digit for line 1",
//"strLine1Checksum" : "Checksum for
//line 1",
//"strLine1OptionalData" : "Optional
//data from line 1",
//"strLine2CheckDigit" : "Check
//digit for line 2",
//"strLine2Checksum" : "Checksum for
//line 2",
//"strLine2OptionalData" : "Optional
//data from line 2",
//"strLine3CheckDigit" : "Check
//digit for line 3",
//المجموع التحققي للسطر " :"strLine3Checksum"
//," 3
//بيانات اختيارية من السطر " :"strLine3OptionalData"
//," 3
//,"...البحث عن وثيقة" :"strLookingDocument"
//تاريخ انتهاء حالة المبتدئ في الدراجة " :"strMCNoviceDate"
//," النارية
//,"مرز" :"strMRZ"
//"strMRZLinesICAORFID": "أسطر مرز من ICAO RFID",
//السطر " :"strMRZString1"
//1
//," من مرز
//السطر " :"strMRZString2"
//2
//," من مرز
//السطر " :"strMRZString3"
//3
//," من مرز
//,"أسطر مرز" :"strMRZStrings"
//,"أسطر مرز بمجاميع التحقق الصحيحة" :"strMRZStringsWithCorrectCheckSums"
//,"نوع مرز" :"strMRZType"
//- عنوان البريد " :"strMailingAddressCity"
//," المدينة
//- عنوان البريد " :"strMailingAddressJurisdictionCode"
//," رمز الولاية
//- عنوان البريد " :"strMailingAddressPostalCode"
//," الرمز البريدي
//- عنوان البريد " :"strMailingAddressStreet"
//," الشارع
//,"صنع" :"strMake"
//,"الحالة الزوجية" :"strMaritalStatus"
//,")الحد الأقصى للوزن للمقطورة (بفرامل" :"strMaxMassofTrailerBraked"
//,")الحد الأقصى للوزن للمقطورة (بدون فرامل" :"strMaxMassofTrailerUnbraked"
//,"السرعة القصوى" :"strMaxSpeed"
//,"ملاحظات / رموز طبية" :"strMedicalIndicatorCodes"
//,"الاسم الأوسط" :"strMiddleName"
//,"اقتطاع الاسم الأوسط" :"strMiddleNameTruncation"
//,"بيانات ميفار" :"strMifareData"
//,"صلاحية ميفار" :"strMifareValidity"
//,"رقم الهوية العسكرية" :"strMilitaryBookNumber"
//,"الموديل" :"strModel"
//,"الشهر" :"strMonth"
//,"الرهن من قبل" :"strMortgageBy"
//,"بلد ميلاد الأم" :"strMotherCountryOfBirth"
//,"تاريخ ميلاد الأم" :"strMotherDateOfBirth"
//," لأم الشخصي اسم ا " :"strMotherGivenName"
//,"رقم شخصي للأم" :"strMotherPersonalNumber"
//,"مكان ميلاد الأم" :"strMotherPlaceOfBirth"
//,"لقب الأم" :"strMotherSurname"
//,"اسم الأم" :"strMothersName"
//,"بادئة الاسم" :"strNamePrefix"
//,"لاحقة الاسم" :"strNameSuffix"
//,"الجنسية" :"strNationality"
//,"رمز الجنسية" :"strNationalityCode"
//,"مؤشر غير مقيم" :"strNonResidentIndicator"
//,"لا شيء" :"strNone"
//,"غير معرف" :"strNotDefined"
//,"عدد إصدار البطاقة" :"strNumberOfCardIssuance"
//الرقم التحققي " :"strNumberOfCardIssuanceCheckDigit"
//," لعدد إصدار البطاقة
//,"مجموع التحقق لعدد إصدار البطاقة" :"strNumberOfCardIssuanceChecksum"
//,"عدد الأسطوانات" :"strNumberOfCylinders"
//,"عدد المحاور" :"strNumberofAxels"
//,"عدد النسخ" :"strNumberofDuplicates"
//,"عدد الإدخالات" :"strNumberofEntries"
//,"عدد المقاعد" :"strNumberofSeats"
//,"عدد مكان الوقوف" :"strNumberofStandingPlaces"
//"strOCRNumber": "رقم OCR",
//,"حسنًا" :"strOK"
//,"ملاحظات" :"strObservations"
//,"تاريخ الإصدار القديم" :"strOldDateOfIssue"
//," قديم رقم المستند ال " :"strOldDocumentNumber"
//,"مكان الإصدار القديم" :"strOldPlaceOfIssue"
//,"بيانات اختيارية" :"strOptionalData"
//,"الرقم التحققي للبيانات الاختيارية" :"strOptionalDataCheckDigit"
//,"مجموع التحقق للبيانات الاختيارية" :"strOptionalDataChecksum"
//,"تفاصيل اختيارية" :"strOptionalDetails"
//,"المنظمة" :"strOrganization"
//,"أخرى" :"strOther"
//,"اسم آخر" :"strOtherName"
//,"اسم شخص آخر" :"strOtherPersonName"
//,"هويات صالحة أخرى" :"strOtherValidID"
//,"المالك" :"strOwner"
//"strPDF417Codec": "ترميز PDF417",
//"strPNRCode": "رمز PNR",
//,"أسماء الوالدين" :"strParrentsGivenNames"
//,"رقم جواز السفر" :"strPassportNumber"
//,"الرقم التحققي لرقم جواز السفر" :"strPassportNumberCheckDigit"
//,"المجموع التحققي لرقم جواز السفر" :"strPassportNumberChecksum"
//,"نسخة رأس المستخدم" :"strPatronHeaderVersion"
//,"مقارنة سمك خطوط النمط" :"strPatternDifferentLinesThickness"
//,"نمط غير مرئي في الأشعة تحت الحمراء" :"strPatternIRInvisible"
//,"لا توجد انقطاعات" :"strPatternNotInterrupted"
//,"عناصر النمط غير متحركة" :"strPatternNotShifted"
//,"ألوان النمط متماثلة" :"strPatternSameColors"
//,"درجة الأجر" :"strPayGrade"
//,"سعة الحمولة" :"strPayloadCapacity"
//,"حمولة المحور المسموح بها" :"strPermissibleAxleLoad"
//,"فئة التصريح بالقيادة" :"strPermitDLClass"
//,"تاريخ انتهاء التصريح" :"strPermitDateofExpiry"
//,"تاريخ إصدار التصريح" :"strPermitDateofIssue"
//,"رمز التصديق على التصريح" :"strPermitEndorsed"
//,"معرف التصريح" :"strPermitIdentifier"
//,"رمز القيود على التصريح" :"strPermitRestrictionCode"
//," عنوان الشخص المطلع:" :"strPersonToNotifyAddress"
//,"تاريخ سجل الإخطار للشخص" :"strPersonToNotifyDateofRecord"
//,"اسم الشخص المطلع" :"strPersonToNotifyName"
//,"هاتف الشخص المطلع" :"strPersonToNotifyPhone"
//,"الرقم الشخصي" :"strPersonalNumber"
//,"الرقم التحققي للرقم الشخصي" :"strPersonalNumberCheckDigit"
//,"المجموع التحققي للرقم الشخصي" :"strPersonalNumberChecksum"
//,"ملخص البيانات الشخصية" :"strPersonalSummary"
//الرقم التسل " :"strPersonalizationSN"
//," سلي للتخصيص الشخصي
//,"الهاتف" :"strPhone"
//,"منطقة الصورة" :"strPhotoArea"
//,"لون الصورة" :"strPhotoColor"
//,"زوايا الصورة" :"strPhotoCorners"
//,"عنصر الصورة" :"strPhotoElement"
//,"نوع تضمين الصورة" :"strPhotoEmbedType"
//,"...معالجة الصورة" :"strPhotoProcessing"
//,"شكل الصورة" :"strPhotoShape"
//,"فحص الحجم" :"strPhotoSizeCheck"
//,"أدرج المستند في الإطار" :"strPlaceDocumentInFrame"
//,")مكان الميلاد (الوطني" :"strPlaceOfBirthRUS"
//رمز الولاية " :"strPlaceOfBirthStateCode"
//," لمكان الميلاد
//,"مكان الفحص" :"strPlaceOfExamination"
//,"مكان الإصدار" :"strPlaceOfIssue"
//,"يرجى وضع الهاتف على المستند" :"strPlacePhoneOnDoc"
//,"مكان الميلاد" :"strPlaceofBirth"
//,"منطقة مكان الميلاد" :"strPlaceofBirthArea"
//,"مكان التسجيل" :"strPlaceofRegistration"
//,"المنطقة الشرطية" :"strPoliceDistrict"
//,"صورة شخصية" :"strPortrait"
//,"مقارنة الصور الشخصية" :"strPortraitComparison"
//,"صورة الطفل" :"strPortraitOfChild"
//صورة شخصية مقابل صورة الك " :"strPortraitVSCamera"
//," اميرا
//,"صورة شخصية مقابل صورة شبح" :"strPortraitVSGhost"
//"strPortraitVSRFID": "صورة شخصية مقابل صورة شريحة RFID",
//,"نسبة الطاقة إلى الوزن" :"strPowerWeightRatio"
//,"دائرة" :"strPrecinct"
//,"...جاري تجهيز الكاميرا" :"strPrepareCamera"
//,"يرجى تقديم الصفحة التالية" :"strPresentNextPage"
//,"نوع/رقم المستند السابق" :"strPreviousType"
//,"...جاري معالجة المستند" :"strProcessingDocument"
//,"المهنة" :"strProfession"
//,"رقم الهوية المهنية" :"strProfessionalIdNumber"
//,"دليل على الجنسية" :"strProofOfCitizenship"
//,"رمز شبه عشوائي" :"strPseudoCode"
//,"غرض الدخول" :"strPurposeOfEntry"
//,"مقابل صورة الكاميرا RFID صورة شريحة" :"strRFIDVSCamera"
//,"العرق/الأصل العرقي" :"strRaceEthnicity"
//,"الرتبة" :"strRank"
//"strReadingRFID": "قراءة بيانات شريحة RFID",
//"strReadingRFIDDGiOS": "قراءة بيانات %@ من شريحة RFID",
//,"نوع المستند المعترف به" :"strRecognizedDocumentType"
//,"الرقم المرجعي الفريد" :"strReferenceNumber"
//ا " :"strReferenceNumberCheckDigit"
//," لرقم التحققي للرقم المرجعي الفريد
//,"المجموع التحققي للرقم المرجعي الفريد" :"strReferenceNumberChecksum"
//,"رقم الجسم" :"strRegCertBodyNumber"
//,"نوع الجسم" :"strRegCertBodyType"
//,"لون المركبة" :"strRegCertCarColor"
//,"ماركة المركبة" :"strRegCertCarMark"
//,"طراز المركبة" :"strRegCertCarModel"
//,"نوع المركبة" :"strRegCertCarType"
//,"أقصى وزن مسموح به" :"strRegCertMaxWeight"
//,"رقم التسجيل" :"strRegCertRegNumber"
//,"الرقم التحققي لرقم التسجيل" :"strRegCertRegNumberCheckDigit"
//,"المجموع التحققي لرقم التسجيل" :"strRegCertRegNumberChecksum"
//"strRegCertVIN": "رقم هوية المركبة (VIN)",
//"strRegCertVINCheckDigit": "الرقم التحققي لرقم هوية المركبة (VIN)",
//"strRegCertVINChecksum": "المجموع التحققي لرقم هوية المركبة (VIN)",
//,"رمز نظام النقل الذكي للمركبة" :"strRegCertVehicleITSCode"
//,"الوزن الفارغ" :"strRegCertWeight"
//,"العلاقة" :"strRelationship"
//,"الديانة" :"strReligion"
//,"الأشهر المتبقية حتى الانتهاء" :"strRemainderTerm"
//,"مقيم منذ" :"strResidentFrom"
//,"مقيم حتى" :"strResidentUntil"
//,"رقم التقاعد" :"strRetirementNumber"
//,"تاريخ التعديل" :"strRevisionDate"
//,"رقم الغرفة" :"strRoomNumber"
//"strSBHIntegrityOptions": "خيارات سلامة SBH",
//"strSBHSecurityOptions": "خيارات أمان SBH",
//,"رقم المقعد" :"strSeatNumber"
//,"اللقب الثاني" :"strSecondSurname"
//,"القسم" :"strSection"
//,"نص الأمان" :"strSecurityText"
//,"مؤشر الاختيار" :"strSelecteeIndicator"
//,"رقم التسلسل" :"strSequenceNumber"
//ال " :"strSerialNumber"
//," رقم التسلسلي
//,"الإعدادات" :"strSettings"
//,"الجنس" :"strSex"
//,"التوقيع" :"strSignature"
//,"لون البشرة" :"strSkinColor"
//,"رقم الضمان الاجتماعي" :"strSocialSecurityNumber"
//,"رمز خاص" :"strSpCode"
//,"ملاحظات خاصة" :"strSpecialNotes"
//,"الكفيل" :"strSponsor"
//,"رقم الضمان الاجتماعي للكفيل" :"strSponsorSSN"
//,"خدمة الكفيل" :"strSponsorService"
//,"حالة الكفيل" :"strSponsorStatus"
//,"ختم" :"strStamp"
//,"رقم الختم" :"strStampNumber"
//تاريخ انتهاء " :"strStatusDateofExpiry"
//," الحالة
//,"اللقب" :"strSurname"
//,"اللقب والأسماء الأولى" :"strSurnameAndGivenNames"
//,"الرقم التحققي للقب والأسماء الأولى" :"strSurnameAndGivenNamesCheckDigit"
//,"المجموع التحققي للقب والأسماء الأولى" :"strSurnameAndGivenNamesChecksum"
//,")اللقب والأسماء الأولى (الوطني" :"strSurnameAndGivenNamesRUS"
//,"اللقب عند الولادة" :"strSurnameAtBirth"
//,"لقب الزوج بعد التسجيل" :"strSurnameOfHusbandAfterRegistration"
//,"لقب الزوجة بعد التسجيل" :"strSurnameOfWifeAfterRegistration"
//,"لقب الزوج" :"strSurnameofSpose"
//,"ضريبة" :"strTax"
//,"الرقم الضريبي" :"strTaxNumber"
//,"رمز البرقية" :"strTelexCode"
//,"الصلاحية الإقليمية" :"strTerritorialValidity"
//,"رقم التذكرة" :"strTicketNumber"
//,"المسمى الوظيفي" :"strTitle"
//,"رمز المطار الواصل" :"strToAirportCode"
//,"المصباح غير متوفر" :"strTorchUnavailable"
//,"رقم التتبع" :"strTrackingNumber"
//,"خطاف المقطورة" :"strTrailerHitch"
//,"رقم العملية" :"strTransactionNumber"
//,"نوع النقل" :"strTransmissionType"
//,"نوع رقم الموافقة" :"strTypeApprovalNumber"
//"strURL": "رابط URL",
//,"خدمات الهجرة والجنسية الأمريكية" :"strUSCIS"
//,"أشعة فوق البنفسجية" :"strUV"
//,"ألياف أمان فوق البنفسجية" :"strUVFibers"
//," عة فوق البنفسجية فحص الورق الفاتح بالأش " :"strUVLuminescence"
//,"فشل تكوين الكاميرا" :"strUnableCaptureMedia"
//,"معرف العميل الفريد" :"strUniqueCustomerIdentifier"
//"strVRCDataObjectEntry": "بيانات المركبة من مجموعة البيانات DG1",
//,"فترة الصلاحية" :"strValidityPeriod"
//,"فئة المركبة" :"strVehicleCategory"
//,"محارب قديم" :"strVeteran"
//,"فئة التأشيرة" :"strVisaClass"
//,"رقم التأشيرة" :"strVisaID"
//,"الرقم التحققي لرقم التأشيرة" :"strVisaIDCheckDigit"
//,"المجموع التحققي لرقم التأشيرة" :"strVisaIDChecksum"
//,")رقم التأشيرة (الوطني" :"strVisaIDRUS"
//,"رقم التأشيرة" :"strVisaNumber"
//,"الرقم التحققي لرقم التأشيرة" :"strVisaNumberCheckDigit"
//,"المجموع التحققي لرقم التأشيرة" :"strVisaNumberChecksum"
//,"الفئة الفرعية للتأشيرة" :"strVisaSubClass"
//,"نوع التأشيرة" :"strVisaType"
//,"تاريخ بداية الصلاحية" :"strVisaValidFrom"
//,"تاريخ نهاية الصلاحية" :"strVisaValidUntil"
//,"الرقم التحققي لتاريخ انتهاء صلاحية التأشيرة" :"strVisaValidUntilCheckDigit"
//المجموع ا " :"strVisaValidUntilChecksum"
//," لتحققي لتاريخ انتهاء صلاحية التأشيرة
//,"ضوء مرئي" :"strVisibleLight"
//,"ناخب" :"strVoter"
//,"مفتاح الناخب" :"strVoterKey"
//,"رقم القسيمة" :"strVoucherNumber"
//,"الوزن" :"strWeight"
//,")الوزن (رطل" :"strWeightPound"
//,"السنة" :"strYear"
//,"سنوات منذ الإصدار" :"strYearsSinceIssue"
//,"مكان الميلاد: المدينة" :"streIDPlaceOfBirthCity"
//,"مكان الميلاد: البلد" :"streIDPlaceOfBirthCountry"
//,"مكان الميلاد: الولاية" :"streIDPlaceOfBirthState"
//مكان ا " :"streIDPlaceOfBirthStreet"
//," لميلاد: الشارع
//,"مكان الميلاد: الرمز البريدي" :"streIDPlaceOfBirthZipcode"
//تصريح الإقامة " :"streIDResidencePermit1"
//," 1
//تصريح الإقامة " :"streIDResidencePermit2"
//," 2
//,"الإصبع الأوسط الأيسر" :"strfppLeftIndexFinger"
//,"الإصبع الصغير الأيسر" :"strfppLeftLittleFinger"
//,الإصبع الوسط الأيسر" :"strfppLeftMiddleFinger"
//]
//}
//}
