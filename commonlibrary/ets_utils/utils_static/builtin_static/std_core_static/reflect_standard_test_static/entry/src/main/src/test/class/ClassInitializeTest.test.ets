'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';
import { looseReflect } from './VoidFn.test';

class MyClass001 {}

class MyClass002 {}

class MyClass004 {}

class MyClass005 {}

class MyClass006 {}

class MyClass007 {
  public static value: int = 0;
}

class MyClass008 {
  public static initialized: boolean = false;
  static {
    MyClass008.initialized = true;
  }
}

class MyClass011 {
  public static value: int = 0;
}

class InitGuard012 {
  static depth: int = 0;
}

class InitCycleB012 {
  public static marker: int = InitCycleB012.bootstrap();
  static bootstrap(): int {
    InitGuard012.depth++;
    if (InitGuard012.depth > 1) {
      throw new Error('Circular static initialization');
    }
    let _ = InitCycleA012.marker;
    InitGuard012.depth--;
    return 1;
  }
}

class InitCycleA012 {
  public static marker: int = InitCycleA012.bootstrap();
  static bootstrap(): int {
    InitGuard012.depth++;
    if (InitGuard012.depth > 1) {
      throw new Error('Circular static initialization');
    }
    let _ = InitCycleB012.marker;
    InitGuard012.depth--;
    return 1;
  }
}

class MyClass013 {
  public static largeArray: Array<int> = Array.create<int>(1024, 0);
}

class MyClass014 {
  public name: string = "test";
}

abstract class AbstractClass015 {
  public static value: int = 100;
}

class GenericClass016<T> {
  public static value: int = 200;
}

final class FinalClass017 {
  public static value: int = 300;
}

interface MyInterface018 {
  name: string;
}

class ParentClass020 {
  public static order: Array<string> = [];
  static {
    ParentClass020.order.push("parent");
  }
}

class ChildClass020 extends ParentClass020 {
  static {
    ParentClass020.order.push("child");
  }
}

class GrandParent021 {
  public static order: Array<string> = [];
  static {
    GrandParent021.order.push("grandparent");
  }
}

class Parent021 extends GrandParent021 {
  static {
    GrandParent021.order.push("parent");
  }
}

class Child021 extends Parent021 {
  static {
    GrandParent021.order.push("child");
  }
}

class MyClass022 {
  public static initCount: int = 0;
  static {
    MyClass022.initCount++;
  }
}

class MyClass023 {
  public static initCount: int = 0;
  static {
    MyClass023.initCount++;
  }
}

class MyClass024 {
  public static initialized: boolean = false;
  static {
    MyClass024.initialized = true;
  }
}

class MyClass025 {
  public static initialized: boolean = false;
  static {
    MyClass025.initialized = true;
  }
}

class EmptyClass026 {}

class ComplexClass027 {
  public static data: Map<string, int>;
  static {
    ComplexClass027.data = new Map<string, int>();
    ComplexClass027.data.set("one", 1);
    ComplexClass027.data.set("two", 2);
  }
}

class MyClass028 {
  public static ready: boolean = false;
  public value: int = 0;
  static {
    MyClass028.ready = true;
  }
}

class MyClass029 {
  public static ready: boolean = false;
  static {
    MyClass029.ready = true;
  }
}

class LargeClass030 {
  public field1: int = 1;
  public field2: int = 2;
  public field3: int = 3;
  public field4: int = 4;
  public field5: int = 5;
  public field6: int = 6;
  public field7: int = 7;
  public field8: int = 8;
  public field9: int = 9;
  public field10: int = 10;
  public field11: int = 11;
  public field12: int = 12;
  public field13: int = 13;
  public field14: int = 14;
  public field15: int = 15;
  public field16: int = 16;
  public field17: int = 17;
  public field18: int = 18;
  public field19: int = 19;
  public field20: int = 20;
  public field21: int = 21;
  public field22: int = 22;
  public field23: int = 23;
  public field24: int = 24;
  public field25: int = 25;
  public field26: int = 26;
  public field27: int = 27;
  public field28: int = 28;
  public field29: int = 29;
  public field30: int = 30;
  public field31: int = 31;
  public field32: int = 32;
  public field33: int = 33;
  public field34: int = 34;
  public field35: int = 35;
  public field36: int = 36;
  public field37: int = 37;
  public field38: int = 38;
  public field39: int = 39;
  public field40: int = 40;
  public field41: int = 41;
  public field42: int = 42;
  public field43: int = 43;
  public field44: int = 44;
  public field45: int = 45;
  public field46: int = 46;
  public field47: int = 47;
  public field48: int = 48;
  public field49: int = 49;
  public field50: int = 50;
  public field51: int = 51;
  public field52: int = 52;
  public field53: int = 53;
  public field54: int = 54;
  public field55: int = 55;
  public field56: int = 56;
  public field57: int = 57;
  public field58: int = 58;
  public field59: int = 59;
  public field60: int = 60;
  public field61: int = 61;
  public field62: int = 62;
  public field63: int = 63;
  public field64: int = 64;
  public field65: int = 65;
  public field66: int = 66;
  public field67: int = 67;
  public field68: int = 68;
  public field69: int = 69;
  public field70: int = 70;
  public field71: int = 71;
  public field72: int = 72;
  public field73: int = 73;
  public field74: int = 74;
  public field75: int = 75;
  public field76: int = 76;
  public field77: int = 77;
  public field78: int = 78;
  public field79: int = 79;
  public field80: int = 80;
  public field81: int = 81;
  public field82: int = 82;
  public field83: int = 83;
  public field84: int = 84;
  public field85: int = 85;
  public field86: int = 86;
  public field87: int = 87;
  public field88: int = 88;
  public field89: int = 89;
  public field90: int = 90;
  public field91: int = 91;
  public field92: int = 92;
  public field93: int = 93;
  public field94: int = 94;
  public field95: int = 95;
  public field96: int = 96;
  public field97: int = 97;
  public field98: int = 98;
  public field99: int = 99;
  public field100: int = 100;
  public field101: int = 101;
  public field102: int = 102;
  public field103: int = 103;
  public field104: int = 104;
  public field105: int = 105;
  public field106: int = 106;
  public field107: int = 107;
  public field108: int = 108;
  public field109: int = 109;
  public field110: int = 110;
  public field111: int = 111;
  public field112: int = 112;
  public field113: int = 113;
  public field114: int = 114;
  public field115: int = 115;
  public field116: int = 116;
  public field117: int = 117;
  public field118: int = 118;
  public field119: int = 119;
  public field120: int = 120;
  public field121: int = 121;
  public field122: int = 122;
  public field123: int = 123;
  public field124: int = 124;
  public field125: int = 125;
  public field126: int = 126;
  public field127: int = 127;
  public field128: int = 128;
  public field129: int = 129;
  public field130: int = 130;
  public field131: int = 131;
  public field132: int = 132;
  public field133: int = 133;
  public field134: int = 134;
  public field135: int = 135;
  public field136: int = 136;
  public field137: int = 137;
  public field138: int = 138;
  public field139: int = 139;
  public field140: int = 140;
  public field141: int = 141;
  public field142: int = 142;
  public field143: int = 143;
  public field144: int = 144;
  public field145: int = 145;
  public field146: int = 146;
  public field147: int = 147;
  public field148: int = 148;
  public field149: int = 149;
  public field150: int = 150;
  public field151: int = 151;
  public field152: int = 152;
  public field153: int = 153;
  public field154: int = 154;
  public field155: int = 155;
  public field156: int = 156;
  public field157: int = 157;
  public field158: int = 158;
  public field159: int = 159;
  public field160: int = 160;
  public field161: int = 161;
  public field162: int = 162;
  public field163: int = 163;
  public field164: int = 164;
  public field165: int = 165;
  public field166: int = 166;
  public field167: int = 167;
  public field168: int = 168;
  public field169: int = 169;
  public field170: int = 170;
  public field171: int = 171;
  public field172: int = 172;
  public field173: int = 173;
  public field174: int = 174;
  public field175: int = 175;
  public field176: int = 176;
  public field177: int = 177;
  public field178: int = 178;
  public field179: int = 179;
  public field180: int = 180;
  public field181: int = 181;
  public field182: int = 182;
  public field183: int = 183;
  public field184: int = 184;
  public field185: int = 185;
  public field186: int = 186;
  public field187: int = 187;
  public field188: int = 188;
  public field189: int = 189;
  public field190: int = 190;
  public field191: int = 191;
  public field192: int = 192;
  public field193: int = 193;
  public field194: int = 194;
  public field195: int = 195;
  public field196: int = 196;
  public field197: int = 197;
  public field198: int = 198;
  public field199: int = 199;
  public field200: int = 200;
  public field201: int = 201;
  public field202: int = 202;
  public field203: int = 203;
  public field204: int = 204;
  public field205: int = 205;
  public field206: int = 206;
  public field207: int = 207;
  public field208: int = 208;
  public field209: int = 209;
  public field210: int = 210;
  public field211: int = 211;
  public field212: int = 212;
  public field213: int = 213;
  public field214: int = 214;
  public field215: int = 215;
  public field216: int = 216;
  public field217: int = 217;
  public field218: int = 218;
  public field219: int = 219;
  public field220: int = 220;
  public field221: int = 221;
  public field222: int = 222;
  public field223: int = 223;
  public field224: int = 224;
  public field225: int = 225;
  public field226: int = 226;
  public field227: int = 227;
  public field228: int = 228;
  public field229: int = 229;
  public field230: int = 230;
  public field231: int = 231;
  public field232: int = 232;
  public field233: int = 233;
  public field234: int = 234;
  public field235: int = 235;
  public field236: int = 236;
  public field237: int = 237;
  public field238: int = 238;
  public field239: int = 239;
  public field240: int = 240;
  public field241: int = 241;
  public field242: int = 242;
  public field243: int = 243;
  public field244: int = 244;
  public field245: int = 245;
  public field246: int = 246;
  public field247: int = 247;
  public field248: int = 248;
  public field249: int = 249;
  public field250: int = 250;
  public field251: int = 251;
  public field252: int = 252;
  public field253: int = 253;
  public field254: int = 254;
  public field255: int = 255;
  public field256: int = 256;
  public field257: int = 257;
  public field258: int = 258;
  public field259: int = 259;
  public field260: int = 260;
  public field261: int = 261;
  public field262: int = 262;
  public field263: int = 263;
  public field264: int = 264;
  public field265: int = 265;
  public field266: int = 266;
  public field267: int = 267;
  public field268: int = 268;
  public field269: int = 269;
  public field270: int = 270;
  public field271: int = 271;
  public field272: int = 272;
  public field273: int = 273;
  public field274: int = 274;
  public field275: int = 275;
  public field276: int = 276;
  public field277: int = 277;
  public field278: int = 278;
  public field279: int = 279;
  public field280: int = 280;
  public field281: int = 281;
  public field282: int = 282;
  public field283: int = 283;
  public field284: int = 284;
  public field285: int = 285;
  public field286: int = 286;
  public field287: int = 287;
  public field288: int = 288;
  public field289: int = 289;
  public field290: int = 290;
  public field291: int = 291;
  public field292: int = 292;
  public field293: int = 293;
  public field294: int = 294;
  public field295: int = 295;
  public field296: int = 296;
  public field297: int = 297;
  public field298: int = 298;
  public field299: int = 299;
  public field300: int = 300;
  public field301: int = 301;
  public field302: int = 302;
  public field303: int = 303;
  public field304: int = 304;
  public field305: int = 305;
  public field306: int = 306;
  public field307: int = 307;
  public field308: int = 308;
  public field309: int = 309;
  public field310: int = 310;
  public field311: int = 311;
  public field312: int = 312;
  public field313: int = 313;
  public field314: int = 314;
  public field315: int = 315;
  public field316: int = 316;
  public field317: int = 317;
  public field318: int = 318;
  public field319: int = 319;
  public field320: int = 320;
  public field321: int = 321;
  public field322: int = 322;
  public field323: int = 323;
  public field324: int = 324;
  public field325: int = 325;
  public field326: int = 326;
  public field327: int = 327;
  public field328: int = 328;
  public field329: int = 329;
  public field330: int = 330;
  public field331: int = 331;
  public field332: int = 332;
  public field333: int = 333;
  public field334: int = 334;
  public field335: int = 335;
  public field336: int = 336;
  public field337: int = 337;
  public field338: int = 338;
  public field339: int = 339;
  public field340: int = 340;
  public field341: int = 341;
  public field342: int = 342;
  public field343: int = 343;
  public field344: int = 344;
  public field345: int = 345;
  public field346: int = 346;
  public field347: int = 347;
  public field348: int = 348;
  public field349: int = 349;
  public field350: int = 350;
  public field351: int = 351;
  public field352: int = 352;
  public field353: int = 353;
  public field354: int = 354;
  public field355: int = 355;
  public field356: int = 356;
  public field357: int = 357;
  public field358: int = 358;
  public field359: int = 359;
  public field360: int = 360;
  public field361: int = 361;
  public field362: int = 362;
  public field363: int = 363;
  public field364: int = 364;
  public field365: int = 365;
  public field366: int = 366;
  public field367: int = 367;
  public field368: int = 368;
  public field369: int = 369;
  public field370: int = 370;
  public field371: int = 371;
  public field372: int = 372;
  public field373: int = 373;
  public field374: int = 374;
  public field375: int = 375;
  public field376: int = 376;
  public field377: int = 377;
  public field378: int = 378;
  public field379: int = 379;
  public field380: int = 380;
  public field381: int = 381;
  public field382: int = 382;
  public field383: int = 383;
  public field384: int = 384;
  public field385: int = 385;
  public field386: int = 386;
  public field387: int = 387;
  public field388: int = 388;
  public field389: int = 389;
  public field390: int = 390;
  public field391: int = 391;
  public field392: int = 392;
  public field393: int = 393;
  public field394: int = 394;
  public field395: int = 395;
  public field396: int = 396;
  public field397: int = 397;
  public field398: int = 398;
  public field399: int = 399;
  public field400: int = 400;
  public field401: int = 401;
  public field402: int = 402;
  public field403: int = 403;
  public field404: int = 404;
  public field405: int = 405;
  public field406: int = 406;
  public field407: int = 407;
  public field408: int = 408;
  public field409: int = 409;
  public field410: int = 410;
  public field411: int = 411;
  public field412: int = 412;
  public field413: int = 413;
  public field414: int = 414;
  public field415: int = 415;
  public field416: int = 416;
  public field417: int = 417;
  public field418: int = 418;
  public field419: int = 419;
  public field420: int = 420;
  public field421: int = 421;
  public field422: int = 422;
  public field423: int = 423;
  public field424: int = 424;
  public field425: int = 425;
  public field426: int = 426;
  public field427: int = 427;
  public field428: int = 428;
  public field429: int = 429;
  public field430: int = 430;
  public field431: int = 431;
  public field432: int = 432;
  public field433: int = 433;
  public field434: int = 434;
  public field435: int = 435;
  public field436: int = 436;
  public field437: int = 437;
  public field438: int = 438;
  public field439: int = 439;
  public field440: int = 440;
  public field441: int = 441;
  public field442: int = 442;
  public field443: int = 443;
  public field444: int = 444;
  public field445: int = 445;
  public field446: int = 446;
  public field447: int = 447;
  public field448: int = 448;
  public field449: int = 449;
  public field450: int = 450;
  public field451: int = 451;
  public field452: int = 452;
  public field453: int = 453;
  public field454: int = 454;
  public field455: int = 455;
  public field456: int = 456;
  public field457: int = 457;
  public field458: int = 458;
  public field459: int = 459;
  public field460: int = 460;
  public field461: int = 461;
  public field462: int = 462;
  public field463: int = 463;
  public field464: int = 464;
  public field465: int = 465;
  public field466: int = 466;
  public field467: int = 467;
  public field468: int = 468;
  public field469: int = 469;
  public field470: int = 470;
  public field471: int = 471;
  public field472: int = 472;
  public field473: int = 473;
  public field474: int = 474;
  public field475: int = 475;
  public field476: int = 476;
  public field477: int = 477;
  public field478: int = 478;
  public field479: int = 479;
  public field480: int = 480;
  public field481: int = 481;
  public field482: int = 482;
  public field483: int = 483;
  public field484: int = 484;
  public field485: int = 485;
  public field486: int = 486;
  public field487: int = 487;
  public field488: int = 488;
  public field489: int = 489;
  public field490: int = 490;
  public field491: int = 491;
  public field492: int = 492;
  public field493: int = 493;
  public field494: int = 494;
  public field495: int = 495;
  public field496: int = 496;
  public field497: int = 497;
  public field498: int = 498;
  public field499: int = 499;
  public field500: int = 500;
  public field501: int = 501;
  public field502: int = 502;
  public field503: int = 503;
  public field504: int = 504;
  public field505: int = 505;
  public field506: int = 506;
  public field507: int = 507;
  public field508: int = 508;
  public field509: int = 509;
  public field510: int = 510;
  public field511: int = 511;
  public field512: int = 512;
  public field513: int = 513;
  public field514: int = 514;
  public field515: int = 515;
  public field516: int = 516;
  public field517: int = 517;
  public field518: int = 518;
  public field519: int = 519;
  public field520: int = 520;
  public field521: int = 521;
  public field522: int = 522;
  public field523: int = 523;
  public field524: int = 524;
  public field525: int = 525;
  public field526: int = 526;
  public field527: int = 527;
  public field528: int = 528;
  public field529: int = 529;
  public field530: int = 530;
  public field531: int = 531;
  public field532: int = 532;
  public field533: int = 533;
  public field534: int = 534;
  public field535: int = 535;
  public field536: int = 536;
  public field537: int = 537;
  public field538: int = 538;
  public field539: int = 539;
  public field540: int = 540;
  public field541: int = 541;
  public field542: int = 542;
  public field543: int = 543;
  public field544: int = 544;
  public field545: int = 545;
  public field546: int = 546;
  public field547: int = 547;
  public field548: int = 548;
  public field549: int = 549;
  public field550: int = 550;
  public field551: int = 551;
  public field552: int = 552;
  public field553: int = 553;
  public field554: int = 554;
  public field555: int = 555;
  public field556: int = 556;
  public field557: int = 557;
  public field558: int = 558;
  public field559: int = 559;
  public field560: int = 560;
  public field561: int = 561;
  public field562: int = 562;
  public field563: int = 563;
  public field564: int = 564;
  public field565: int = 565;
  public field566: int = 566;
  public field567: int = 567;
  public field568: int = 568;
  public field569: int = 569;
  public field570: int = 570;
  public field571: int = 571;
  public field572: int = 572;
  public field573: int = 573;
  public field574: int = 574;
  public field575: int = 575;
  public field576: int = 576;
  public field577: int = 577;
  public field578: int = 578;
  public field579: int = 579;
  public field580: int = 580;
  public field581: int = 581;
  public field582: int = 582;
  public field583: int = 583;
  public field584: int = 584;
  public field585: int = 585;
  public field586: int = 586;
  public field587: int = 587;
  public field588: int = 588;
  public field589: int = 589;
  public field590: int = 590;
  public field591: int = 591;
  public field592: int = 592;
  public field593: int = 593;
  public field594: int = 594;
  public field595: int = 595;
  public field596: int = 596;
  public field597: int = 597;
  public field598: int = 598;
  public field599: int = 599;
  public field600: int = 600;
  public field601: int = 601;
  public field602: int = 602;
  public field603: int = 603;
  public field604: int = 604;
  public field605: int = 605;
  public field606: int = 606;
  public field607: int = 607;
  public field608: int = 608;
  public field609: int = 609;
  public field610: int = 610;
  public field611: int = 611;
  public field612: int = 612;
  public field613: int = 613;
  public field614: int = 614;
  public field615: int = 615;
  public field616: int = 616;
  public field617: int = 617;
  public field618: int = 618;
  public field619: int = 619;
  public field620: int = 620;
  public field621: int = 621;
  public field622: int = 622;
  public field623: int = 623;
  public field624: int = 624;
  public field625: int = 625;
  public field626: int = 626;
  public field627: int = 627;
  public field628: int = 628;
  public field629: int = 629;
  public field630: int = 630;
  public field631: int = 631;
  public field632: int = 632;
  public field633: int = 633;
  public field634: int = 634;
  public field635: int = 635;
  public field636: int = 636;
  public field637: int = 637;
  public field638: int = 638;
  public field639: int = 639;
  public field640: int = 640;
  public field641: int = 641;
  public field642: int = 642;
  public field643: int = 643;
  public field644: int = 644;
  public field645: int = 645;
  public field646: int = 646;
  public field647: int = 647;
  public field648: int = 648;
  public field649: int = 649;
  public field650: int = 650;
  public field651: int = 651;
  public field652: int = 652;
  public field653: int = 653;
  public field654: int = 654;
  public field655: int = 655;
  public field656: int = 656;
  public field657: int = 657;
  public field658: int = 658;
  public field659: int = 659;
  public field660: int = 660;
  public field661: int = 661;
  public field662: int = 662;
  public field663: int = 663;
  public field664: int = 664;
  public field665: int = 665;
  public field666: int = 666;
  public field667: int = 667;
  public field668: int = 668;
  public field669: int = 669;
  public field670: int = 670;
  public field671: int = 671;
  public field672: int = 672;
  public field673: int = 673;
  public field674: int = 674;
  public field675: int = 675;
  public field676: int = 676;
  public field677: int = 677;
  public field678: int = 678;
  public field679: int = 679;
  public field680: int = 680;
  public field681: int = 681;
  public field682: int = 682;
  public field683: int = 683;
  public field684: int = 684;
  public field685: int = 685;
  public field686: int = 686;
  public field687: int = 687;
  public field688: int = 688;
  public field689: int = 689;
  public field690: int = 690;
  public field691: int = 691;
  public field692: int = 692;
  public field693: int = 693;
  public field694: int = 694;
  public field695: int = 695;
  public field696: int = 696;
  public field697: int = 697;
  public field698: int = 698;
  public field699: int = 699;
  public field700: int = 700;
  public field701: int = 701;
  public field702: int = 702;
  public field703: int = 703;
  public field704: int = 704;
  public field705: int = 705;
  public field706: int = 706;
  public field707: int = 707;
  public field708: int = 708;
  public field709: int = 709;
  public field710: int = 710;
  public field711: int = 711;
  public field712: int = 712;
  public field713: int = 713;
  public field714: int = 714;
  public field715: int = 715;
  public field716: int = 716;
  public field717: int = 717;
  public field718: int = 718;
  public field719: int = 719;
  public field720: int = 720;
  public field721: int = 721;
  public field722: int = 722;
  public field723: int = 723;
  public field724: int = 724;
  public field725: int = 725;
  public field726: int = 726;
  public field727: int = 727;
  public field728: int = 728;
  public field729: int = 729;
  public field730: int = 730;
  public field731: int = 731;
  public field732: int = 732;
  public field733: int = 733;
  public field734: int = 734;
  public field735: int = 735;
  public field736: int = 736;
  public field737: int = 737;
  public field738: int = 738;
  public field739: int = 739;
  public field740: int = 740;
  public field741: int = 741;
  public field742: int = 742;
  public field743: int = 743;
  public field744: int = 744;
  public field745: int = 745;
  public field746: int = 746;
  public field747: int = 747;
  public field748: int = 748;
  public field749: int = 749;
  public field750: int = 750;
  public field751: int = 751;
  public field752: int = 752;
  public field753: int = 753;
  public field754: int = 754;
  public field755: int = 755;
  public field756: int = 756;
  public field757: int = 757;
  public field758: int = 758;
  public field759: int = 759;
  public field760: int = 760;
  public field761: int = 761;
  public field762: int = 762;
  public field763: int = 763;
  public field764: int = 764;
  public field765: int = 765;
  public field766: int = 766;
  public field767: int = 767;
  public field768: int = 768;
  public field769: int = 769;
  public field770: int = 770;
  public field771: int = 771;
  public field772: int = 772;
  public field773: int = 773;
  public field774: int = 774;
  public field775: int = 775;
  public field776: int = 776;
  public field777: int = 777;
  public field778: int = 778;
  public field779: int = 779;
  public field780: int = 780;
  public field781: int = 781;
  public field782: int = 782;
  public field783: int = 783;
  public field784: int = 784;
  public field785: int = 785;
  public field786: int = 786;
  public field787: int = 787;
  public field788: int = 788;
  public field789: int = 789;
  public field790: int = 790;
  public field791: int = 791;
  public field792: int = 792;
  public field793: int = 793;
  public field794: int = 794;
  public field795: int = 795;
  public field796: int = 796;
  public field797: int = 797;
  public field798: int = 798;
  public field799: int = 799;
  public field800: int = 800;
  public field801: int = 801;
  public field802: int = 802;
  public field803: int = 803;
  public field804: int = 804;
  public field805: int = 805;
  public field806: int = 806;
  public field807: int = 807;
  public field808: int = 808;
  public field809: int = 809;
  public field810: int = 810;
  public field811: int = 811;
  public field812: int = 812;
  public field813: int = 813;
  public field814: int = 814;
  public field815: int = 815;
  public field816: int = 816;
  public field817: int = 817;
  public field818: int = 818;
  public field819: int = 819;
  public field820: int = 820;
  public field821: int = 821;
  public field822: int = 822;
  public field823: int = 823;
  public field824: int = 824;
  public field825: int = 825;
  public field826: int = 826;
  public field827: int = 827;
  public field828: int = 828;
  public field829: int = 829;
  public field830: int = 830;
  public field831: int = 831;
  public field832: int = 832;
  public field833: int = 833;
  public field834: int = 834;
  public field835: int = 835;
  public field836: int = 836;
  public field837: int = 837;
  public field838: int = 838;
  public field839: int = 839;
  public field840: int = 840;
  public field841: int = 841;
  public field842: int = 842;
  public field843: int = 843;
  public field844: int = 844;
  public field845: int = 845;
  public field846: int = 846;
  public field847: int = 847;
  public field848: int = 848;
  public field849: int = 849;
  public field850: int = 850;
  public field851: int = 851;
  public field852: int = 852;
  public field853: int = 853;
  public field854: int = 854;
  public field855: int = 855;
  public field856: int = 856;
  public field857: int = 857;
  public field858: int = 858;
  public field859: int = 859;
  public field860: int = 860;
  public field861: int = 861;
  public field862: int = 862;
  public field863: int = 863;
  public field864: int = 864;
  public field865: int = 865;
  public field866: int = 866;
  public field867: int = 867;
  public field868: int = 868;
  public field869: int = 869;
  public field870: int = 870;
  public field871: int = 871;
  public field872: int = 872;
  public field873: int = 873;
  public field874: int = 874;
  public field875: int = 875;
  public field876: int = 876;
  public field877: int = 877;
  public field878: int = 878;
  public field879: int = 879;
  public field880: int = 880;
  public field881: int = 881;
  public field882: int = 882;
  public field883: int = 883;
  public field884: int = 884;
  public field885: int = 885;
  public field886: int = 886;
  public field887: int = 887;
  public field888: int = 888;
  public field889: int = 889;
  public field890: int = 890;
  public field891: int = 891;
  public field892: int = 892;
  public field893: int = 893;
  public field894: int = 894;
  public field895: int = 895;
  public field896: int = 896;
  public field897: int = 897;
  public field898: int = 898;
  public field899: int = 899;
  public field900: int = 900;
  public field901: int = 901;
  public field902: int = 902;
  public field903: int = 903;
  public field904: int = 904;
  public field905: int = 905;
  public field906: int = 906;
  public field907: int = 907;
  public field908: int = 908;
  public field909: int = 909;
  public field910: int = 910;
  public field911: int = 911;
  public field912: int = 912;
  public field913: int = 913;
  public field914: int = 914;
  public field915: int = 915;
  public field916: int = 916;
  public field917: int = 917;
  public field918: int = 918;
  public field919: int = 919;
  public field920: int = 920;
  public field921: int = 921;
  public field922: int = 922;
  public field923: int = 923;
  public field924: int = 924;
  public field925: int = 925;
  public field926: int = 926;
  public field927: int = 927;
  public field928: int = 928;
  public field929: int = 929;
  public field930: int = 930;
  public field931: int = 931;
  public field932: int = 932;
  public field933: int = 933;
  public field934: int = 934;
  public field935: int = 935;
  public field936: int = 936;
  public field937: int = 937;
  public field938: int = 938;
  public field939: int = 939;
  public field940: int = 940;
  public field941: int = 941;
  public field942: int = 942;
  public field943: int = 943;
  public field944: int = 944;
  public field945: int = 945;
  public field946: int = 946;
  public field947: int = 947;
  public field948: int = 948;
  public field949: int = 949;
  public field950: int = 950;
  public field951: int = 951;
  public field952: int = 952;
  public field953: int = 953;
  public field954: int = 954;
  public field955: int = 955;
  public field956: int = 956;
  public field957: int = 957;
  public field958: int = 958;
  public field959: int = 959;
  public field960: int = 960;
  public field961: int = 961;
  public field962: int = 962;
  public field963: int = 963;
  public field964: int = 964;
  public field965: int = 965;
  public field966: int = 966;
  public field967: int = 967;
  public field968: int = 968;
  public field969: int = 969;
  public field970: int = 970;
  public field971: int = 971;
  public field972: int = 972;
  public field973: int = 973;
  public field974: int = 974;
  public field975: int = 975;
  public field976: int = 976;
  public field977: int = 977;
  public field978: int = 978;
  public field979: int = 979;
  public field980: int = 980;
  public field981: int = 981;
  public field982: int = 982;
  public field983: int = 983;
  public field984: int = 984;
  public field985: int = 985;
  public field986: int = 986;
  public field987: int = 987;
  public field988: int = 988;
  public field989: int = 989;
  public field990: int = 990;
  public field991: int = 991;
  public field992: int = 992;
  public field993: int = 993;
  public field994: int = 994;
  public field995: int = 995;
  public field996: int = 996;
  public field997: int = 997;
  public field998: int = 998;
  public field999: int = 999;
  public field1000: int = 1000;
}

class MyClass031 {}

export default function runClassInitializeTest(): void {
  describe('ClassInitializeTest', (): void => {
    beforeAll(() => {
    });
    beforeEach(async () => {
      await Utils.msSleep(30);
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_0100
     * @tc.name testClassInitialize001
     * @tc.desc Verify ClassInitialize case 001: Class.from<MyClass001>(), getName returns expected qualified name, initialize() behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassInitialize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      cls.initialize();
      expect(cls.getName()).assertEqual("entry.src.main.src.test.class.ClassInitializeTest.test.MyClass001");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_0200
     * @tc.name testClassInitialize002
     * @tc.desc Verify ClassInitialize case 002: invalid input throws ClassCastError, Class.from<MyClass002>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassInitialize002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass002>();
      try {
        looseReflect(cls as Object).initialize("invalid" as string);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_0300
     * @tc.name testClassInitialize003
     * @tc.desc Verify ClassInitialize case 003: Class.from<MyClass004>(), initialize() behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassInitialize003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass004>();
      let result: void = cls.initialize();
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_0400
     * @tc.name testClassInitialize004
     * @tc.desc Verify ClassInitialize case 004: Class.from<MyClass004>(), initialize() behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassInitialize004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass004>();
      let result: void = cls.initialize();
      expect(typeof result).assertEqual("undefined");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_0500
     * @tc.name testClassInitialize005
     * @tc.desc Verify ClassInitialize case 005: Class.from<MyClass005>(), getName returns expected qualified name, initialize() behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassInitialize005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass005>();
      cls.initialize();
      expect(cls.getName()).assertEqual("entry.src.main.src.test.class.ClassInitializeTest.test.MyClass005");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_0600
     * @tc.name testClassInitialize006
     * @tc.desc Verify ClassInitialize case 006: Class.from<MyClass006>(), getName returns expected qualified name, initialize() behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassInitialize006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass006>();
      cls.initialize();
      cls.initialize();
      expect(cls.getName()).assertEqual("entry.src.main.src.test.class.ClassInitializeTest.test.MyClass006");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_0700
     * @tc.name testClassInitialize007
     * @tc.desc Verify ClassInitialize case 007: Class.from<MyClass007>(), initialize() behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassInitialize007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass007>();
      cls.initialize();
      expect(MyClass007.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_0800
     * @tc.name testClassInitialize008
     * @tc.desc Verify ClassInitialize case 008: Class.from<MyClass008>(), initialize() behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassInitialize008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass008>();
      cls.initialize();
      expect(MyClass008.initialized).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_0900
     * @tc.name testClassInitialize009
     * @tc.desc Verify ClassInitialize case 009: invalid call throws Error, initialize() behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassInitialize009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class | null = null;
      try {
        cls!.initialize();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('NullPointerError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_1000
     * @tc.name testClassInitialize010
     * @tc.desc Verify ClassInitialize case 010: invalid call throws Error, initialize() behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassInitialize010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls: Class | undefined = undefined;
      try {
        cls!.initialize();
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('NullPointerError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_1100
     * @tc.name testClassInitialize011
     * @tc.desc Verify ClassInitialize case 011: Class.from<MyClass011>(), initialize() behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassInitialize011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass011>();
      cls.initialize();
      expect(MyClass011.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_1200
     * @tc.name testClassInitialize012
     * @tc.desc Verify ClassInitialize case 012: invalid call throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassInitialize012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      InitGuard012.depth = 0;
      try {
        let _ = InitCycleA012.marker;
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
        expect(error.message.indexOf('Circular static initialization') >= 0).assertEqual(true);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_1300
     * @tc.name testClassInitialize013
     * @tc.desc Verify ClassInitialize case 013: Class.from<MyClass013>(), initialize() behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassInitialize013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass013>();
      try {
        cls.initialize();
      } catch (error) {
        expect(error.name).assertEqual('Error');
        return;
      }
      expect(MyClass013.largeArray.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_1400
     * @tc.name testClassInitialize014
     * @tc.desc Verify ClassInitialize case 014: Class.from<MyClass014>(), createInstance succeeds, initialize() behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassInitialize014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass014>();
      cls.initialize();
      let obj = cls.createInstance() as MyClass014;
      expect(obj.name).assertEqual("test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_1500
     * @tc.name testClassInitialize015
     * @tc.desc Verify ClassInitialize case 015: Class.from<AbstractClass015>(), initialize() behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassInitialize015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass015>();
      cls.initialize();
      expect(AbstractClass015.value).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_1600
     * @tc.name testClassInitialize016
     * @tc.desc Verify ClassInitialize case 016: Class.from<GenericClass016<int>>(), initialize() behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassInitialize016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GenericClass016<int>>();
      cls.initialize();
      expect(GenericClass016.value).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_1700
     * @tc.name testClassInitialize017
     * @tc.desc Verify ClassInitialize case 017: Class.from<FinalClass017>(), initialize() behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassInitialize017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<FinalClass017>();
      cls.initialize();
      expect(FinalClass017.value).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_1800
     * @tc.name testClassInitialize018
     * @tc.desc Verify ClassInitialize case 018: Class.from<MyInterface018>(), isInterface returns true, initialize() behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassInitialize018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyInterface018>();
      cls.initialize();
      expect(cls.isInterface()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_1900
     * @tc.name testClassInitialize019
     * @tc.desc Verify ClassInitialize case 019: isPrimitive returns true, initialize() behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassInitialize019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.PRIMITIVE_INT;
      cls.initialize();
      expect(cls.isPrimitive()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_2000
     * @tc.name testClassInitialize020
     * @tc.desc Verify ClassInitialize case 020: Class.from<ChildClass020>(), initialize() behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassInitialize020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ChildClass020>();
      childCls.initialize();
      expect(ParentClass020.order[0]).assertEqual("parent");
      expect(ParentClass020.order[1]).assertEqual("child");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_2100
     * @tc.name testClassInitialize021
     * @tc.desc Verify ClassInitialize case 021: Class.from<Child021>(), initialize() behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassInitialize021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<Child021>();
      childCls.initialize();
      expect(GrandParent021.order[0]).assertEqual("grandparent");
      expect(GrandParent021.order[1]).assertEqual("parent");
      expect(GrandParent021.order[2]).assertEqual("child");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_2200
     * @tc.name testClassInitialize022
     * @tc.desc Verify ClassInitialize case 022: Class.from<MyClass022>(), initialize() behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassInitialize022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass022>();
      let task1: () => void = (): void => { cls.initialize(); };
      let task2: () => void = (): void => { cls.initialize(); };
      task1();
      task2();
      expect(MyClass022.initCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_2300
     * @tc.name testClassInitialize023
     * @tc.desc Verify ClassInitialize case 023: Class.from<MyClass023>(), initialize() behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassInitialize023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass023>();
      cls.initialize();
      let count1 = MyClass023.initCount;
      cls.initialize();
      let count2 = MyClass023.initCount;
      expect(count1).assertEqual(count2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_2400
     * @tc.name testClassInitialize024
     * @tc.desc Verify ClassInitialize case 024: Class.from<MyClass024>(), createInstance succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassInitialize024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass024>();
      let obj = cls.createInstance();
      expect(obj !== null).assertTrue();
      expect(MyClass024.initialized).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_2500
     * @tc.name testClassInitialize025
     * @tc.desc Verify ClassInitialize case 025: Class.from<MyClass025>()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassInitialize025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass025>();
      MyClass025.initialized = false;
      expect(MyClass025.initialized).assertEqual(false);
      let name = cls.getName();
      expect(name).assertEqual('entry.src.main.src.test.class.ClassInitializeTest.test.MyClass025');
      expect(MyClass025.initialized).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_2600
     * @tc.name testClassInitialize026
     * @tc.desc Verify ClassInitialize case 026: Class.from<EmptyClass026>(), initialize() behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassInitialize026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyClass026>();
      cls.initialize();
      expect(cls.getName()).assertEqual('entry.src.main.src.test.class.ClassInitializeTest.test.EmptyClass026');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_2700
     * @tc.name testClassInitialize027
     * @tc.desc Verify ClassInitialize case 027: Class.from<ComplexClass027>(), initialize() behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassInitialize027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ComplexClass027>();
      cls.initialize();
      expect(ComplexClass027.data.get("one")).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_2800
     * @tc.name testClassInitialize028
     * @tc.desc Verify ClassInitialize case 028: Class.from<MyClass028>(), createInstance succeeds, initialize() behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassInitialize028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass028>();
      cls.initialize();
      expect(MyClass028.ready).assertEqual(true);
      let obj = cls.createInstance() as MyClass028;
      expect(obj.value).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_2900
     * @tc.name testClassInitialize029
     * @tc.desc Verify ClassInitialize case 029: Class.from<MyClass029>(), createInstance succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassInitialize029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass029>();
      let obj = cls.createInstance() as MyClass029;
      expect(MyClass029.ready).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_3000
     * @tc.name testClassInitialize030
     * @tc.desc Verify ClassInitialize case 030: Class.from<LargeClass030>(), initialize() behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassInitialize030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<LargeClass030>();
      cls.initialize();
      expect(cls.getName()).assertEqual('entry.src.main.src.test.class.ClassInitializeTest.test.LargeClass030');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CLASS_INITIALIZE_3100
     * @tc.name testClassInitialize031
     * @tc.desc Verify ClassInitialize case 031: Class.from<MyClass031>(), initialize() behavior verified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testClassInitialize031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass031>();
      cls.initialize();
      expect(cls.getName()).assertEqual('entry.src.main.src.test.class.ClassInitializeTest.test.MyClass031');
    });

  });
}