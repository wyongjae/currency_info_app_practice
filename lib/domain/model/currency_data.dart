class Currency {
  Currency({
    required this.result,
    required this.documentation,
    required this.termsOfUse,
    required this.timeLastUpdateUnix,
    required this.timeLastUpdateUtc,
    required this.timeNextUpdateUnix,
    required this.timeNextUpdateUtc,
    required this.baseCode,
    required this.conversionRates,
  });

  late final String result;
  late final String documentation;
  late final String termsOfUse;
  late final int timeLastUpdateUnix;
  late final String timeLastUpdateUtc;
  late final int timeNextUpdateUnix;
  late final String timeNextUpdateUtc;
  late final String baseCode;
  late final ConversionRates conversionRates;

  Currency.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    documentation = json['documentation'];
    termsOfUse = json['terms_of_use'];
    timeLastUpdateUnix = json['time_last_update_unix'];
    timeLastUpdateUtc = json['time_last_update_utc'];
    timeNextUpdateUnix = json['time_next_update_unix'];
    timeNextUpdateUtc = json['time_next_update_utc'];
    baseCode = json['base_code'];
    conversionRates = ConversionRates.fromJson(json['conversion_rates']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['result'] = result;
    _data['documentation'] = documentation;
    _data['terms_of_use'] = termsOfUse;
    _data['time_last_update_unix'] = timeLastUpdateUnix;
    _data['time_last_update_utc'] = timeLastUpdateUtc;
    _data['time_next_update_unix'] = timeNextUpdateUnix;
    _data['time_next_update_utc'] = timeNextUpdateUtc;
    _data['base_code'] = baseCode;
    _data['conversion_rates'] = conversionRates.toJson();
    return _data;
  }
}

class ConversionRates {
  ConversionRates({
    required this.KRW,
    required this.AED,
    required this.AFN,
    required this.ALL,
    required this.AMD,
    required this.ANG,
    required this.AOA,
    required this.ARS,
    required this.AUD,
    required this.AWG,
    required this.AZN,
    required this.BAM,
    required this.BBD,
    required this.BDT,
    required this.BGN,
    required this.BHD,
    required this.BIF,
    required this.BMD,
    required this.BND,
    required this.BOB,
    required this.BRL,
    required this.BSD,
    required this.BTN,
    required this.BWP,
    required this.BYN,
    required this.BZD,
    required this.CAD,
    required this.CDF,
    required this.CHF,
    required this.CLP,
    required this.CNY,
    required this.COP,
    required this.CRC,
    required this.CUP,
    required this.CVE,
    required this.CZK,
    required this.DJF,
    required this.DKK,
    required this.DOP,
    required this.DZD,
    required this.EGP,
    required this.ERN,
    required this.ETB,
    required this.EUR,
    required this.FJD,
    required this.FKP,
    required this.FOK,
    required this.GBP,
    required this.GEL,
    required this.GGP,
    required this.GHS,
    required this.GIP,
    required this.GMD,
    required this.GNF,
    required this.GTQ,
    required this.GYD,
    required this.HKD,
    required this.HNL,
    required this.HRK,
    required this.HTG,
    required this.HUF,
    required this.IDR,
    required this.ILS,
    required this.IMP,
    required this.INR,
    required this.IQD,
    required this.IRR,
    required this.ISK,
    required this.JEP,
    required this.JMD,
    required this.JOD,
    required this.JPY,
    required this.KES,
    required this.KGS,
    required this.KHR,
    required this.KID,
    required this.KMF,
    required this.KWD,
    required this.KYD,
    required this.KZT,
    required this.LAK,
    required this.LBP,
    required this.LKR,
    required this.LRD,
    required this.LSL,
    required this.LYD,
    required this.MAD,
    required this.MDL,
    required this.MGA,
    required this.MKD,
    required this.MMK,
    required this.MNT,
    required this.MOP,
    required this.MRU,
    required this.MUR,
    required this.MVR,
    required this.MWK,
    required this.MXN,
    required this.MYR,
    required this.MZN,
    required this.NAD,
    required this.NGN,
    required this.NIO,
    required this.NOK,
    required this.NPR,
    required this.NZD,
    required this.OMR,
    required this.PAB,
    required this.PEN,
    required this.PGK,
    required this.PHP,
    required this.PKR,
    required this.PLN,
    required this.PYG,
    required this.QAR,
    required this.RON,
    required this.RSD,
    required this.RUB,
    required this.RWF,
    required this.SAR,
    required this.SBD,
    required this.SCR,
    required this.SDG,
    required this.SEK,
    required this.SGD,
    required this.SHP,
    required this.SLE,
    required this.SLL,
    required this.SOS,
    required this.SRD,
    required this.SSP,
    required this.STN,
    required this.SYP,
    required this.SZL,
    required this.THB,
    required this.TJS,
    required this.TMT,
    required this.TND,
    required this.TOP,
    required this.TRY,
    required this.TTD,
    required this.TVD,
    required this.TWD,
    required this.TZS,
    required this.UAH,
    required this.UGX,
    required this.USD,
    required this.UYU,
    required this.UZS,
    required this.VES,
    required this.VND,
    required this.VUV,
    required this.WST,
    required this.XAF,
    required this.XCD,
    required this.XDR,
    required this.XOF,
    required this.XPF,
    required this.YER,
    required this.ZAR,
    required this.ZMW,
    required this.ZWL,
  });

  late final double AED;
  late final double KRW;
  late final double AFN;
  late final double ALL;
  late final double AMD;
  late final double ANG;
  late final double AOA;
  late final double ARS;
  late final double AUD;
  late final double AWG;
  late final double AZN;
  late final double BAM;
  late final double BBD;
  late final double BDT;
  late final double BGN;
  late final double BHD;
  late final double BIF;
  late final double BMD;
  late final double BND;
  late final double BOB;
  late final double BRL;
  late final double BSD;
  late final double BTN;
  late final double BWP;
  late final double BYN;
  late final double BZD;
  late final double CAD;
  late final double CDF;
  late final double CHF;
  late final double CLP;
  late final double CNY;
  late final double COP;
  late final double CRC;
  late final double CUP;
  late final double CVE;
  late final double CZK;
  late final double DJF;
  late final double DKK;
  late final double DOP;
  late final double DZD;
  late final double EGP;
  late final double ERN;
  late final double ETB;
  late final double EUR;
  late final double FJD;
  late final double FKP;
  late final double FOK;
  late final double GBP;
  late final double GEL;
  late final double GGP;
  late final double GHS;
  late final double GIP;
  late final double GMD;
  late final double GNF;
  late final double GTQ;
  late final double GYD;
  late final double HKD;
  late final double HNL;
  late final double HRK;
  late final double HTG;
  late final double HUF;
  late final double IDR;
  late final double ILS;
  late final double IMP;
  late final double INR;
  late final double IQD;
  late final double IRR;
  late final double ISK;
  late final double JEP;
  late final double JMD;
  late final double JOD;
  late final double JPY;
  late final double KES;
  late final double KGS;
  late final double KHR;
  late final double KID;
  late final double KMF;
  late final double KWD;
  late final double KYD;
  late final double KZT;
  late final double LAK;
  late final double LBP;
  late final double LKR;
  late final double LRD;
  late final double LSL;
  late final double LYD;
  late final double MAD;
  late final double MDL;
  late final double MGA;
  late final double MKD;
  late final double MMK;
  late final double MNT;
  late final double MOP;
  late final double MRU;
  late final double MUR;
  late final double MVR;
  late final double MWK;
  late final double MXN;
  late final double MYR;
  late final double MZN;
  late final double NAD;
  late final double NGN;
  late final double NIO;
  late final double NOK;
  late final double NPR;
  late final double NZD;
  late final double OMR;
  late final double PAB;
  late final double PEN;
  late final double PGK;
  late final double PHP;
  late final double PKR;
  late final double PLN;
  late final double PYG;
  late final double QAR;
  late final double RON;
  late final double RSD;
  late final double RUB;
  late final double RWF;
  late final double SAR;
  late final double SBD;
  late final double SCR;
  late final double SDG;
  late final double SEK;
  late final double SGD;
  late final double SHP;
  late final double SLE;
  late final double SLL;
  late final double SOS;
  late final double SRD;
  late final double SSP;
  late final double STN;
  late final double SYP;
  late final double SZL;
  late final double THB;
  late final double TJS;
  late final double TMT;
  late final double TND;
  late final double TOP;
  late final double TRY;
  late final double TTD;
  late final double TVD;
  late final double TWD;
  late final double TZS;
  late final double UAH;
  late final double UGX;
  late final double USD;
  late final double UYU;
  late final double UZS;
  late final double VES;
  late final double VND;
  late final double VUV;
  late final double WST;
  late final double XAF;
  late final double XCD;
  late final double XDR;
  late final double XOF;
  late final double XPF;
  late final double YER;
  late final double ZAR;
  late final double ZMW;
  late final double ZWL;

  ConversionRates.fromJson(Map<String, dynamic> json) {
    KRW = json['KRW'];
    AED = json['AED'];
    AFN = json['AFN'];
    ALL = json['ALL'];
    AMD = json['AMD'];
    ANG = json['ANG'];
    AOA = json['AOA'];
    ARS = json['ARS'];
    AUD = json['AUD'];
    AWG = json['AWG'];
    AZN = json['AZN'];
    BAM = json['BAM'];
    BBD = json['BBD'];
    BDT = json['BDT'];
    BGN = json['BGN'];
    BHD = json['BHD'];
    BIF = json['BIF'];
    BMD = json['BMD'];
    BND = json['BND'];
    BOB = json['BOB'];
    BRL = json['BRL'];
    BSD = json['BSD'];
    BTN = json['BTN'];
    BWP = json['BWP'];
    BYN = json['BYN'];
    BZD = json['BZD'];
    CAD = json['CAD'];
    CDF = json['CDF'];
    CHF = json['CHF'];
    CLP = json['CLP'];
    CNY = json['CNY'];
    COP = json['COP'];
    CRC = json['CRC'];
    CUP = json['CUP'];
    CVE = json['CVE'];
    CZK = json['CZK'];
    DJF = json['DJF'];
    DKK = json['DKK'];
    DOP = json['DOP'];
    DZD = json['DZD'];
    EGP = json['EGP'];
    ERN = json['ERN'];
    ETB = json['ETB'];
    EUR = json['EUR'];
    FJD = json['FJD'];
    FKP = json['FKP'];
    FOK = json['FOK'];
    GBP = json['GBP'];
    GEL = json['GEL'];
    GGP = json['GGP'];
    GHS = json['GHS'];
    GIP = json['GIP'];
    GMD = json['GMD'];
    GNF = json['GNF'];
    GTQ = json['GTQ'];
    GYD = json['GYD'];
    HKD = json['HKD'];
    HNL = json['HNL'];
    HRK = json['HRK'];
    HTG = json['HTG'];
    HUF = json['HUF'];
    IDR = json['IDR'];
    ILS = json['ILS'];
    IMP = json['IMP'];
    INR = json['INR'];
    IQD = json['IQD'];
    IRR = json['IRR'];
    ISK = json['ISK'];
    JEP = json['JEP'];
    JMD = json['JMD'];
    JOD = json['JOD'];
    JPY = json['JPY'];
    KES = json['KES'];
    KGS = json['KGS'];
    KHR = json['KHR'];
    KID = json['KID'];
    KMF = json['KMF'];
    KWD = json['KWD'];
    KYD = json['KYD'];
    KZT = json['KZT'];
    LAK = json['LAK'];
    LBP = json['LBP'];
    LKR = json['LKR'];
    LRD = json['LRD'];
    LSL = json['LSL'];
    LYD = json['LYD'];
    MAD = json['MAD'];
    MDL = json['MDL'];
    MGA = json['MGA'];
    MKD = json['MKD'];
    MMK = json['MMK'];
    MNT = json['MNT'];
    MOP = json['MOP'];
    MRU = json['MRU'];
    MUR = json['MUR'];
    MVR = json['MVR'];
    MWK = json['MWK'];
    MXN = json['MXN'];
    MYR = json['MYR'];
    MZN = json['MZN'];
    NAD = json['NAD'];
    NGN = json['NGN'];
    NIO = json['NIO'];
    NOK = json['NOK'];
    NPR = json['NPR'];
    NZD = json['NZD'];
    OMR = json['OMR'];
    PAB = json['PAB'];
    PEN = json['PEN'];
    PGK = json['PGK'];
    PHP = json['PHP'];
    PKR = json['PKR'];
    PLN = json['PLN'];
    PYG = json['PYG'];
    QAR = json['QAR'];
    RON = json['RON'];
    RSD = json['RSD'];
    RUB = json['RUB'];
    RWF = json['RWF'];
    SAR = json['SAR'];
    SBD = json['SBD'];
    SCR = json['SCR'];
    SDG = json['SDG'];
    SEK = json['SEK'];
    SGD = json['SGD'];
    SHP = json['SHP'];
    SLE = json['SLE'];
    SLL = json['SLL'];
    SOS = json['SOS'];
    SRD = json['SRD'];
    SSP = json['SSP'];
    STN = json['STN'];
    SYP = json['SYP'];
    SZL = json['SZL'];
    THB = json['THB'];
    TJS = json['TJS'];
    TMT = json['TMT'];
    TND = json['TND'];
    TOP = json['TOP'];
    TRY = json['TRY'];
    TTD = json['TTD'];
    TVD = json['TVD'];
    TWD = json['TWD'];
    TZS = json['TZS'];
    UAH = json['UAH'];
    UGX = json['UGX'];
    USD = json['USD'];
    UYU = json['UYU'];
    UZS = json['UZS'];
    VES = json['VES'];
    VND = json['VND'];
    VUV = json['VUV'];
    WST = json['WST'];
    XAF = json['XAF'];
    XCD = json['XCD'];
    XDR = json['XDR'];
    XOF = json['XOF'];
    XPF = json['XPF'];
    YER = json['YER'];
    ZAR = json['ZAR'];
    ZMW = json['ZMW'];
    ZWL = json['ZWL'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['KRW'] = KRW;
    _data['AED'] = AED;
    _data['AFN'] = AFN;
    _data['ALL'] = ALL;
    _data['AMD'] = AMD;
    _data['ANG'] = ANG;
    _data['AOA'] = AOA;
    _data['ARS'] = ARS;
    _data['AUD'] = AUD;
    _data['AWG'] = AWG;
    _data['AZN'] = AZN;
    _data['BAM'] = BAM;
    _data['BBD'] = BBD;
    _data['BDT'] = BDT;
    _data['BGN'] = BGN;
    _data['BHD'] = BHD;
    _data['BIF'] = BIF;
    _data['BMD'] = BMD;
    _data['BND'] = BND;
    _data['BOB'] = BOB;
    _data['BRL'] = BRL;
    _data['BSD'] = BSD;
    _data['BTN'] = BTN;
    _data['BWP'] = BWP;
    _data['BYN'] = BYN;
    _data['BZD'] = BZD;
    _data['CAD'] = CAD;
    _data['CDF'] = CDF;
    _data['CHF'] = CHF;
    _data['CLP'] = CLP;
    _data['CNY'] = CNY;
    _data['COP'] = COP;
    _data['CRC'] = CRC;
    _data['CUP'] = CUP;
    _data['CVE'] = CVE;
    _data['CZK'] = CZK;
    _data['DJF'] = DJF;
    _data['DKK'] = DKK;
    _data['DOP'] = DOP;
    _data['DZD'] = DZD;
    _data['EGP'] = EGP;
    _data['ERN'] = ERN;
    _data['ETB'] = ETB;
    _data['EUR'] = EUR;
    _data['FJD'] = FJD;
    _data['FKP'] = FKP;
    _data['FOK'] = FOK;
    _data['GBP'] = GBP;
    _data['GEL'] = GEL;
    _data['GGP'] = GGP;
    _data['GHS'] = GHS;
    _data['GIP'] = GIP;
    _data['GMD'] = GMD;
    _data['GNF'] = GNF;
    _data['GTQ'] = GTQ;
    _data['GYD'] = GYD;
    _data['HKD'] = HKD;
    _data['HNL'] = HNL;
    _data['HRK'] = HRK;
    _data['HTG'] = HTG;
    _data['HUF'] = HUF;
    _data['IDR'] = IDR;
    _data['ILS'] = ILS;
    _data['IMP'] = IMP;
    _data['INR'] = INR;
    _data['IQD'] = IQD;
    _data['IRR'] = IRR;
    _data['ISK'] = ISK;
    _data['JEP'] = JEP;
    _data['JMD'] = JMD;
    _data['JOD'] = JOD;
    _data['JPY'] = JPY;
    _data['KES'] = KES;
    _data['KGS'] = KGS;
    _data['KHR'] = KHR;
    _data['KID'] = KID;
    _data['KMF'] = KMF;
    _data['KWD'] = KWD;
    _data['KYD'] = KYD;
    _data['KZT'] = KZT;
    _data['LAK'] = LAK;
    _data['LBP'] = LBP;
    _data['LKR'] = LKR;
    _data['LRD'] = LRD;
    _data['LSL'] = LSL;
    _data['LYD'] = LYD;
    _data['MAD'] = MAD;
    _data['MDL'] = MDL;
    _data['MGA'] = MGA;
    _data['MKD'] = MKD;
    _data['MMK'] = MMK;
    _data['MNT'] = MNT;
    _data['MOP'] = MOP;
    _data['MRU'] = MRU;
    _data['MUR'] = MUR;
    _data['MVR'] = MVR;
    _data['MWK'] = MWK;
    _data['MXN'] = MXN;
    _data['MYR'] = MYR;
    _data['MZN'] = MZN;
    _data['NAD'] = NAD;
    _data['NGN'] = NGN;
    _data['NIO'] = NIO;
    _data['NOK'] = NOK;
    _data['NPR'] = NPR;
    _data['NZD'] = NZD;
    _data['OMR'] = OMR;
    _data['PAB'] = PAB;
    _data['PEN'] = PEN;
    _data['PGK'] = PGK;
    _data['PHP'] = PHP;
    _data['PKR'] = PKR;
    _data['PLN'] = PLN;
    _data['PYG'] = PYG;
    _data['QAR'] = QAR;
    _data['RON'] = RON;
    _data['RSD'] = RSD;
    _data['RUB'] = RUB;
    _data['RWF'] = RWF;
    _data['SAR'] = SAR;
    _data['SBD'] = SBD;
    _data['SCR'] = SCR;
    _data['SDG'] = SDG;
    _data['SEK'] = SEK;
    _data['SGD'] = SGD;
    _data['SHP'] = SHP;
    _data['SLE'] = SLE;
    _data['SLL'] = SLL;
    _data['SOS'] = SOS;
    _data['SRD'] = SRD;
    _data['SSP'] = SSP;
    _data['STN'] = STN;
    _data['SYP'] = SYP;
    _data['SZL'] = SZL;
    _data['THB'] = THB;
    _data['TJS'] = TJS;
    _data['TMT'] = TMT;
    _data['TND'] = TND;
    _data['TOP'] = TOP;
    _data['TRY'] = TRY;
    _data['TTD'] = TTD;
    _data['TVD'] = TVD;
    _data['TWD'] = TWD;
    _data['TZS'] = TZS;
    _data['UAH'] = UAH;
    _data['UGX'] = UGX;
    _data['USD'] = USD;
    _data['UYU'] = UYU;
    _data['UZS'] = UZS;
    _data['VES'] = VES;
    _data['VND'] = VND;
    _data['VUV'] = VUV;
    _data['WST'] = WST;
    _data['XAF'] = XAF;
    _data['XCD'] = XCD;
    _data['XDR'] = XDR;
    _data['XOF'] = XOF;
    _data['XPF'] = XPF;
    _data['YER'] = YER;
    _data['ZAR'] = ZAR;
    _data['ZMW'] = ZMW;
    _data['ZWL'] = ZWL;
    return _data;
  }
}
