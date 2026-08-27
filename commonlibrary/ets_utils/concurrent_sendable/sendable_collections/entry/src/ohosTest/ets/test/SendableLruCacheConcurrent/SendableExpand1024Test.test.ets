/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { collections, taskpool } from '@kit.ArkTS';
import Utils from '../Util';
import { SendableClassOver1024, SimpleSendable } from './SendableExpand1024Model';

const LEN_1025: number = 1025;
const LEN_256: number = 256;
const EMOJI: string = '😀🎉🔥';

const enum SendableEnumOver1024 {
  MemberZero = 0,
  MemberPositive = 123,
  MemberNegative = -456,
  MemberHex = 255,
  MemberOctal = 511,
  MemberBinary = 10,
  MemberMaxSafe = 9007199254740991,
  Member7 = 7,
  Member8 = 8,
  Member9 = 9,
  Member10 = 10,
  Member11 = 11,
  Member12 = 12,
  Member13 = 13,
  Member14 = 14,
  Member15 = 15,
  Member16 = 16,
  Member17 = 17,
  Member18 = 18,
  Member19 = 19,
  Member20 = 20,
  Member21 = 21,
  Member22 = 22,
  Member23 = 23,
  Member24 = 24,
  Member25 = 25,
  Member26 = 26,
  Member27 = 27,
  Member28 = 28,
  Member29 = 29,
  Member30 = 30,
  Member31 = 31,
  Member32 = 32,
  Member33 = 33,
  Member34 = 34,
  Member35 = 35,
  Member36 = 36,
  Member37 = 37,
  Member38 = 38,
  Member39 = 39,
  Member40 = 40,
  Member41 = 41,
  Member42 = 42,
  Member43 = 43,
  Member44 = 44,
  Member45 = 45,
  Member46 = 46,
  Member47 = 47,
  Member48 = 48,
  Member49 = 49,
  Member50 = 50,
  Member51 = 51,
  Member52 = 52,
  Member53 = 53,
  Member54 = 54,
  Member55 = 55,
  Member56 = 56,
  Member57 = 57,
  Member58 = 58,
  Member59 = 59,
  Member60 = 60,
  Member61 = 61,
  Member62 = 62,
  Member63 = 63,
  Member64 = 64,
  Member65 = 65,
  Member66 = 66,
  Member67 = 67,
  Member68 = 68,
  Member69 = 69,
  Member70 = 70,
  Member71 = 71,
  Member72 = 72,
  Member73 = 73,
  Member74 = 74,
  Member75 = 75,
  Member76 = 76,
  Member77 = 77,
  Member78 = 78,
  Member79 = 79,
  Member80 = 80,
  Member81 = 81,
  Member82 = 82,
  Member83 = 83,
  Member84 = 84,
  Member85 = 85,
  Member86 = 86,
  Member87 = 87,
  Member88 = 88,
  Member89 = 89,
  Member90 = 90,
  Member91 = 91,
  Member92 = 92,
  Member93 = 93,
  Member94 = 94,
  Member95 = 95,
  Member96 = 96,
  Member97 = 97,
  Member98 = 98,
  Member99 = 99,
  Member100 = 100,
  Member101 = 101,
  Member102 = 102,
  Member103 = 103,
  Member104 = 104,
  Member105 = 105,
  Member106 = 106,
  Member107 = 107,
  Member108 = 108,
  Member109 = 109,
  Member110 = 110,
  Member111 = 111,
  Member112 = 112,
  Member113 = 113,
  Member114 = 114,
  Member115 = 115,
  Member116 = 116,
  Member117 = 117,
  Member118 = 118,
  Member119 = 119,
  Member120 = 120,
  Member121 = 121,
  Member122 = 122,
  Member123 = 123,
  Member124 = 124,
  Member125 = 125,
  Member126 = 126,
  Member127 = 127,
  Member128 = 128,
  Member129 = 129,
  Member130 = 130,
  Member131 = 131,
  Member132 = 132,
  Member133 = 133,
  Member134 = 134,
  Member135 = 135,
  Member136 = 136,
  Member137 = 137,
  Member138 = 138,
  Member139 = 139,
  Member140 = 140,
  Member141 = 141,
  Member142 = 142,
  Member143 = 143,
  Member144 = 144,
  Member145 = 145,
  Member146 = 146,
  Member147 = 147,
  Member148 = 148,
  Member149 = 149,
  Member150 = 150,
  Member151 = 151,
  Member152 = 152,
  Member153 = 153,
  Member154 = 154,
  Member155 = 155,
  Member156 = 156,
  Member157 = 157,
  Member158 = 158,
  Member159 = 159,
  Member160 = 160,
  Member161 = 161,
  Member162 = 162,
  Member163 = 163,
  Member164 = 164,
  Member165 = 165,
  Member166 = 166,
  Member167 = 167,
  Member168 = 168,
  Member169 = 169,
  Member170 = 170,
  Member171 = 171,
  Member172 = 172,
  Member173 = 173,
  Member174 = 174,
  Member175 = 175,
  Member176 = 176,
  Member177 = 177,
  Member178 = 178,
  Member179 = 179,
  Member180 = 180,
  Member181 = 181,
  Member182 = 182,
  Member183 = 183,
  Member184 = 184,
  Member185 = 185,
  Member186 = 186,
  Member187 = 187,
  Member188 = 188,
  Member189 = 189,
  Member190 = 190,
  Member191 = 191,
  Member192 = 192,
  Member193 = 193,
  Member194 = 194,
  Member195 = 195,
  Member196 = 196,
  Member197 = 197,
  Member198 = 198,
  Member199 = 199,
  Member200 = 200,
  Member201 = 201,
  Member202 = 202,
  Member203 = 203,
  Member204 = 204,
  Member205 = 205,
  Member206 = 206,
  Member207 = 207,
  Member208 = 208,
  Member209 = 209,
  Member210 = 210,
  Member211 = 211,
  Member212 = 212,
  Member213 = 213,
  Member214 = 214,
  Member215 = 215,
  Member216 = 216,
  Member217 = 217,
  Member218 = 218,
  Member219 = 219,
  Member220 = 220,
  Member221 = 221,
  Member222 = 222,
  Member223 = 223,
  Member224 = 224,
  Member225 = 225,
  Member226 = 226,
  Member227 = 227,
  Member228 = 228,
  Member229 = 229,
  Member230 = 230,
  Member231 = 231,
  Member232 = 232,
  Member233 = 233,
  Member234 = 234,
  Member235 = 235,
  Member236 = 236,
  Member237 = 237,
  Member238 = 238,
  Member239 = 239,
  Member240 = 240,
  Member241 = 241,
  Member242 = 242,
  Member243 = 243,
  Member244 = 244,
  Member245 = 245,
  Member246 = 246,
  Member247 = 247,
  Member248 = 248,
  Member249 = 249,
  Member250 = 250,
  Member251 = 251,
  Member252 = 252,
  Member253 = 253,
  Member254 = 254,
  Member255 = 255,
  Member256 = 256,
  Member257 = 257,
  Member258 = 258,
  Member259 = 259,
  Member260 = 260,
  Member261 = 261,
  Member262 = 262,
  Member263 = 263,
  Member264 = 264,
  Member265 = 265,
  Member266 = 266,
  Member267 = 267,
  Member268 = 268,
  Member269 = 269,
  Member270 = 270,
  Member271 = 271,
  Member272 = 272,
  Member273 = 273,
  Member274 = 274,
  Member275 = 275,
  Member276 = 276,
  Member277 = 277,
  Member278 = 278,
  Member279 = 279,
  Member280 = 280,
  Member281 = 281,
  Member282 = 282,
  Member283 = 283,
  Member284 = 284,
  Member285 = 285,
  Member286 = 286,
  Member287 = 287,
  Member288 = 288,
  Member289 = 289,
  Member290 = 290,
  Member291 = 291,
  Member292 = 292,
  Member293 = 293,
  Member294 = 294,
  Member295 = 295,
  Member296 = 296,
  Member297 = 297,
  Member298 = 298,
  Member299 = 299,
  Member300 = 300,
  Member301 = 301,
  Member302 = 302,
  Member303 = 303,
  Member304 = 304,
  Member305 = 305,
  Member306 = 306,
  Member307 = 307,
  Member308 = 308,
  Member309 = 309,
  Member310 = 310,
  Member311 = 311,
  Member312 = 312,
  Member313 = 313,
  Member314 = 314,
  Member315 = 315,
  Member316 = 316,
  Member317 = 317,
  Member318 = 318,
  Member319 = 319,
  Member320 = 320,
  Member321 = 321,
  Member322 = 322,
  Member323 = 323,
  Member324 = 324,
  Member325 = 325,
  Member326 = 326,
  Member327 = 327,
  Member328 = 328,
  Member329 = 329,
  Member330 = 330,
  Member331 = 331,
  Member332 = 332,
  Member333 = 333,
  Member334 = 334,
  Member335 = 335,
  Member336 = 336,
  Member337 = 337,
  Member338 = 338,
  Member339 = 339,
  Member340 = 340,
  Member341 = 341,
  Member342 = 342,
  Member343 = 343,
  Member344 = 344,
  Member345 = 345,
  Member346 = 346,
  Member347 = 347,
  Member348 = 348,
  Member349 = 349,
  Member350 = 350,
  Member351 = 351,
  Member352 = 352,
  Member353 = 353,
  Member354 = 354,
  Member355 = 355,
  Member356 = 356,
  Member357 = 357,
  Member358 = 358,
  Member359 = 359,
  Member360 = 360,
  Member361 = 361,
  Member362 = 362,
  Member363 = 363,
  Member364 = 364,
  Member365 = 365,
  Member366 = 366,
  Member367 = 367,
  Member368 = 368,
  Member369 = 369,
  Member370 = 370,
  Member371 = 371,
  Member372 = 372,
  Member373 = 373,
  Member374 = 374,
  Member375 = 375,
  Member376 = 376,
  Member377 = 377,
  Member378 = 378,
  Member379 = 379,
  Member380 = 380,
  Member381 = 381,
  Member382 = 382,
  Member383 = 383,
  Member384 = 384,
  Member385 = 385,
  Member386 = 386,
  Member387 = 387,
  Member388 = 388,
  Member389 = 389,
  Member390 = 390,
  Member391 = 391,
  Member392 = 392,
  Member393 = 393,
  Member394 = 394,
  Member395 = 395,
  Member396 = 396,
  Member397 = 397,
  Member398 = 398,
  Member399 = 399,
  Member400 = 400,
  Member401 = 401,
  Member402 = 402,
  Member403 = 403,
  Member404 = 404,
  Member405 = 405,
  Member406 = 406,
  Member407 = 407,
  Member408 = 408,
  Member409 = 409,
  Member410 = 410,
  Member411 = 411,
  Member412 = 412,
  Member413 = 413,
  Member414 = 414,
  Member415 = 415,
  Member416 = 416,
  Member417 = 417,
  Member418 = 418,
  Member419 = 419,
  Member420 = 420,
  Member421 = 421,
  Member422 = 422,
  Member423 = 423,
  Member424 = 424,
  Member425 = 425,
  Member426 = 426,
  Member427 = 427,
  Member428 = 428,
  Member429 = 429,
  Member430 = 430,
  Member431 = 431,
  Member432 = 432,
  Member433 = 433,
  Member434 = 434,
  Member435 = 435,
  Member436 = 436,
  Member437 = 437,
  Member438 = 438,
  Member439 = 439,
  Member440 = 440,
  Member441 = 441,
  Member442 = 442,
  Member443 = 443,
  Member444 = 444,
  Member445 = 445,
  Member446 = 446,
  Member447 = 447,
  Member448 = 448,
  Member449 = 449,
  Member450 = 450,
  Member451 = 451,
  Member452 = 452,
  Member453 = 453,
  Member454 = 454,
  Member455 = 455,
  Member456 = 456,
  Member457 = 457,
  Member458 = 458,
  Member459 = 459,
  Member460 = 460,
  Member461 = 461,
  Member462 = 462,
  Member463 = 463,
  Member464 = 464,
  Member465 = 465,
  Member466 = 466,
  Member467 = 467,
  Member468 = 468,
  Member469 = 469,
  Member470 = 470,
  Member471 = 471,
  Member472 = 472,
  Member473 = 473,
  Member474 = 474,
  Member475 = 475,
  Member476 = 476,
  Member477 = 477,
  Member478 = 478,
  Member479 = 479,
  Member480 = 480,
  Member481 = 481,
  Member482 = 482,
  Member483 = 483,
  Member484 = 484,
  Member485 = 485,
  Member486 = 486,
  Member487 = 487,
  Member488 = 488,
  Member489 = 489,
  Member490 = 490,
  Member491 = 491,
  Member492 = 492,
  Member493 = 493,
  Member494 = 494,
  Member495 = 495,
  Member496 = 496,
  Member497 = 497,
  Member498 = 498,
  Member499 = 499,
  Member500 = 500,
  Member501 = 501,
  Member502 = 502,
  Member503 = 503,
  Member504 = 504,
  Member505 = 505,
  Member506 = 506,
  Member507 = 507,
  Member508 = 508,
  Member509 = 509,
  Member510 = 510,
  Member511 = 511,
  Member512 = 512,
  Member513 = 513,
  Member514 = 514,
  Member515 = 515,
  Member516 = 516,
  Member517 = 517,
  Member518 = 518,
  Member519 = 519,
  Member520 = 520,
  Member521 = 521,
  Member522 = 522,
  Member523 = 523,
  Member524 = 524,
  Member525 = 525,
  Member526 = 526,
  Member527 = 527,
  Member528 = 528,
  Member529 = 529,
  Member530 = 530,
  Member531 = 531,
  Member532 = 532,
  Member533 = 533,
  Member534 = 534,
  Member535 = 535,
  Member536 = 536,
  Member537 = 537,
  Member538 = 538,
  Member539 = 539,
  Member540 = 540,
  Member541 = 541,
  Member542 = 542,
  Member543 = 543,
  Member544 = 544,
  Member545 = 545,
  Member546 = 546,
  Member547 = 547,
  Member548 = 548,
  Member549 = 549,
  Member550 = 550,
  Member551 = 551,
  Member552 = 552,
  Member553 = 553,
  Member554 = 554,
  Member555 = 555,
  Member556 = 556,
  Member557 = 557,
  Member558 = 558,
  Member559 = 559,
  Member560 = 560,
  Member561 = 561,
  Member562 = 562,
  Member563 = 563,
  Member564 = 564,
  Member565 = 565,
  Member566 = 566,
  Member567 = 567,
  Member568 = 568,
  Member569 = 569,
  Member570 = 570,
  Member571 = 571,
  Member572 = 572,
  Member573 = 573,
  Member574 = 574,
  Member575 = 575,
  Member576 = 576,
  Member577 = 577,
  Member578 = 578,
  Member579 = 579,
  Member580 = 580,
  Member581 = 581,
  Member582 = 582,
  Member583 = 583,
  Member584 = 584,
  Member585 = 585,
  Member586 = 586,
  Member587 = 587,
  Member588 = 588,
  Member589 = 589,
  Member590 = 590,
  Member591 = 591,
  Member592 = 592,
  Member593 = 593,
  Member594 = 594,
  Member595 = 595,
  Member596 = 596,
  Member597 = 597,
  Member598 = 598,
  Member599 = 599,
  Member600 = 600,
  Member601 = 601,
  Member602 = 602,
  Member603 = 603,
  Member604 = 604,
  Member605 = 605,
  Member606 = 606,
  Member607 = 607,
  Member608 = 608,
  Member609 = 609,
  Member610 = 610,
  Member611 = 611,
  Member612 = 612,
  Member613 = 613,
  Member614 = 614,
  Member615 = 615,
  Member616 = 616,
  Member617 = 617,
  Member618 = 618,
  Member619 = 619,
  Member620 = 620,
  Member621 = 621,
  Member622 = 622,
  Member623 = 623,
  Member624 = 624,
  Member625 = 625,
  Member626 = 626,
  Member627 = 627,
  Member628 = 628,
  Member629 = 629,
  Member630 = 630,
  Member631 = 631,
  Member632 = 632,
  Member633 = 633,
  Member634 = 634,
  Member635 = 635,
  Member636 = 636,
  Member637 = 637,
  Member638 = 638,
  Member639 = 639,
  Member640 = 640,
  Member641 = 641,
  Member642 = 642,
  Member643 = 643,
  Member644 = 644,
  Member645 = 645,
  Member646 = 646,
  Member647 = 647,
  Member648 = 648,
  Member649 = 649,
  Member650 = 650,
  Member651 = 651,
  Member652 = 652,
  Member653 = 653,
  Member654 = 654,
  Member655 = 655,
  Member656 = 656,
  Member657 = 657,
  Member658 = 658,
  Member659 = 659,
  Member660 = 660,
  Member661 = 661,
  Member662 = 662,
  Member663 = 663,
  Member664 = 664,
  Member665 = 665,
  Member666 = 666,
  Member667 = 667,
  Member668 = 668,
  Member669 = 669,
  Member670 = 670,
  Member671 = 671,
  Member672 = 672,
  Member673 = 673,
  Member674 = 674,
  Member675 = 675,
  Member676 = 676,
  Member677 = 677,
  Member678 = 678,
  Member679 = 679,
  Member680 = 680,
  Member681 = 681,
  Member682 = 682,
  Member683 = 683,
  Member684 = 684,
  Member685 = 685,
  Member686 = 686,
  Member687 = 687,
  Member688 = 688,
  Member689 = 689,
  Member690 = 690,
  Member691 = 691,
  Member692 = 692,
  Member693 = 693,
  Member694 = 694,
  Member695 = 695,
  Member696 = 696,
  Member697 = 697,
  Member698 = 698,
  Member699 = 699,
  Member700 = 700,
  Member701 = 701,
  Member702 = 702,
  Member703 = 703,
  Member704 = 704,
  Member705 = 705,
  Member706 = 706,
  Member707 = 707,
  Member708 = 708,
  Member709 = 709,
  Member710 = 710,
  Member711 = 711,
  Member712 = 712,
  Member713 = 713,
  Member714 = 714,
  Member715 = 715,
  Member716 = 716,
  Member717 = 717,
  Member718 = 718,
  Member719 = 719,
  Member720 = 720,
  Member721 = 721,
  Member722 = 722,
  Member723 = 723,
  Member724 = 724,
  Member725 = 725,
  Member726 = 726,
  Member727 = 727,
  Member728 = 728,
  Member729 = 729,
  Member730 = 730,
  Member731 = 731,
  Member732 = 732,
  Member733 = 733,
  Member734 = 734,
  Member735 = 735,
  Member736 = 736,
  Member737 = 737,
  Member738 = 738,
  Member739 = 739,
  Member740 = 740,
  Member741 = 741,
  Member742 = 742,
  Member743 = 743,
  Member744 = 744,
  Member745 = 745,
  Member746 = 746,
  Member747 = 747,
  Member748 = 748,
  Member749 = 749,
  Member750 = 750,
  Member751 = 751,
  Member752 = 752,
  Member753 = 753,
  Member754 = 754,
  Member755 = 755,
  Member756 = 756,
  Member757 = 757,
  Member758 = 758,
  Member759 = 759,
  Member760 = 760,
  Member761 = 761,
  Member762 = 762,
  Member763 = 763,
  Member764 = 764,
  Member765 = 765,
  Member766 = 766,
  Member767 = 767,
  Member768 = 768,
  Member769 = 769,
  Member770 = 770,
  Member771 = 771,
  Member772 = 772,
  Member773 = 773,
  Member774 = 774,
  Member775 = 775,
  Member776 = 776,
  Member777 = 777,
  Member778 = 778,
  Member779 = 779,
  Member780 = 780,
  Member781 = 781,
  Member782 = 782,
  Member783 = 783,
  Member784 = 784,
  Member785 = 785,
  Member786 = 786,
  Member787 = 787,
  Member788 = 788,
  Member789 = 789,
  Member790 = 790,
  Member791 = 791,
  Member792 = 792,
  Member793 = 793,
  Member794 = 794,
  Member795 = 795,
  Member796 = 796,
  Member797 = 797,
  Member798 = 798,
  Member799 = 799,
  Member800 = 800,
  Member801 = 801,
  Member802 = 802,
  Member803 = 803,
  Member804 = 804,
  Member805 = 805,
  Member806 = 806,
  Member807 = 807,
  Member808 = 808,
  Member809 = 809,
  Member810 = 810,
  Member811 = 811,
  Member812 = 812,
  Member813 = 813,
  Member814 = 814,
  Member815 = 815,
  Member816 = 816,
  Member817 = 817,
  Member818 = 818,
  Member819 = 819,
  Member820 = 820,
  Member821 = 821,
  Member822 = 822,
  Member823 = 823,
  Member824 = 824,
  Member825 = 825,
  Member826 = 826,
  Member827 = 827,
  Member828 = 828,
  Member829 = 829,
  Member830 = 830,
  Member831 = 831,
  Member832 = 832,
  Member833 = 833,
  Member834 = 834,
  Member835 = 835,
  Member836 = 836,
  Member837 = 837,
  Member838 = 838,
  Member839 = 839,
  Member840 = 840,
  Member841 = 841,
  Member842 = 842,
  Member843 = 843,
  Member844 = 844,
  Member845 = 845,
  Member846 = 846,
  Member847 = 847,
  Member848 = 848,
  Member849 = 849,
  Member850 = 850,
  Member851 = 851,
  Member852 = 852,
  Member853 = 853,
  Member854 = 854,
  Member855 = 855,
  Member856 = 856,
  Member857 = 857,
  Member858 = 858,
  Member859 = 859,
  Member860 = 860,
  Member861 = 861,
  Member862 = 862,
  Member863 = 863,
  Member864 = 864,
  Member865 = 865,
  Member866 = 866,
  Member867 = 867,
  Member868 = 868,
  Member869 = 869,
  Member870 = 870,
  Member871 = 871,
  Member872 = 872,
  Member873 = 873,
  Member874 = 874,
  Member875 = 875,
  Member876 = 876,
  Member877 = 877,
  Member878 = 878,
  Member879 = 879,
  Member880 = 880,
  Member881 = 881,
  Member882 = 882,
  Member883 = 883,
  Member884 = 884,
  Member885 = 885,
  Member886 = 886,
  Member887 = 887,
  Member888 = 888,
  Member889 = 889,
  Member890 = 890,
  Member891 = 891,
  Member892 = 892,
  Member893 = 893,
  Member894 = 894,
  Member895 = 895,
  Member896 = 896,
  Member897 = 897,
  Member898 = 898,
  Member899 = 899,
  Member900 = 900,
  Member901 = 901,
  Member902 = 902,
  Member903 = 903,
  Member904 = 904,
  Member905 = 905,
  Member906 = 906,
  Member907 = 907,
  Member908 = 908,
  Member909 = 909,
  Member910 = 910,
  Member911 = 911,
  Member912 = 912,
  Member913 = 913,
  Member914 = 914,
  Member915 = 915,
  Member916 = 916,
  Member917 = 917,
  Member918 = 918,
  Member919 = 919,
  Member920 = 920,
  Member921 = 921,
  Member922 = 922,
  Member923 = 923,
  Member924 = 924,
  Member925 = 925,
  Member926 = 926,
  Member927 = 927,
  Member928 = 928,
  Member929 = 929,
  Member930 = 930,
  Member931 = 931,
  Member932 = 932,
  Member933 = 933,
  Member934 = 934,
  Member935 = 935,
  Member936 = 936,
  Member937 = 937,
  Member938 = 938,
  Member939 = 939,
  Member940 = 940,
  Member941 = 941,
  Member942 = 942,
  Member943 = 943,
  Member944 = 944,
  Member945 = 945,
  Member946 = 946,
  Member947 = 947,
  Member948 = 948,
  Member949 = 949,
  Member950 = 950,
  Member951 = 951,
  Member952 = 952,
  Member953 = 953,
  Member954 = 954,
  Member955 = 955,
  Member956 = 956,
  Member957 = 957,
  Member958 = 958,
  Member959 = 959,
  Member960 = 960,
  Member961 = 961,
  Member962 = 962,
  Member963 = 963,
  Member964 = 964,
  Member965 = 965,
  Member966 = 966,
  Member967 = 967,
  Member968 = 968,
  Member969 = 969,
  Member970 = 970,
  Member971 = 971,
  Member972 = 972,
  Member973 = 973,
  Member974 = 974,
  Member975 = 975,
  Member976 = 976,
  Member977 = 977,
  Member978 = 978,
  Member979 = 979,
  Member980 = 980,
  Member981 = 981,
  Member982 = 982,
  Member983 = 983,
  Member984 = 984,
  Member985 = 985,
  Member986 = 986,
  Member987 = 987,
  Member988 = 988,
  Member989 = 989,
  Member990 = 990,
  Member991 = 991,
  Member992 = 992,
  Member993 = 993,
  Member994 = 994,
  Member995 = 995,
  Member996 = 996,
  Member997 = 997,
  Member998 = 998,
  Member999 = 999,
  Member1000 = 1000,
  Member1001 = 1001,
  Member1002 = 1002,
  Member1003 = 1003,
  Member1004 = 1004,
  Member1005 = 1005,
  Member1006 = 1006,
  Member1007 = 1007,
  Member1008 = 1008,
  Member1009 = 1009,
  Member1010 = 1010,
  Member1011 = 1011,
  Member1012 = 1012,
  Member1013 = 1013,
  Member1014 = 1014,
  Member1015 = 1015,
  Member1016 = 1016,
  Member1017 = 1017,
  Member1018 = 1018,
  Member1019 = 1019,
  Member1020 = 1020,
  Member1021 = 1021,
  Member1022 = 1022,
  Member1023 = 1023,
  Member1024 = 1024,
}

@Concurrent
function receiveSendableObjectTask(obj: SendableClassOver1024): boolean {
  if (obj.num_pos_int !== 123) {
    return false;
  }
  if (!Number.isNaN(obj.num_nan)) {
    return false;
  }
  if (obj.num_infinity !== Infinity) {
    return false;
  }
  if (obj.str_emoji !== '😀🎉🔥') {
    return false;
  }
  if (obj.bool_true !== true) {
    return false;
  }
  return true;
}

@Concurrent
function receiveEnumValueTask(value: number): number {
  return value;
}

@Concurrent
function concurrentReadTask(obj: SendableClassOver1024): boolean {
  if (obj.num_pos_int !== 123) {
    return false;
  }
  if (obj.str_emoji !== '😀🎉🔥') {
    return false;
  }
  if (obj.bool_true !== true) {
    return false;
  }
  return true;
}

@Concurrent
function concurrentReadArrayTask(arr: collections.Array<SimpleSendable>, start: number, end: number): number {
  let sum: number = 0;
  for (let i = start; i < end; i++) {
    sum += arr[i].id;
  }
  return sum;
}

@Concurrent
function verifySendableArrayIdentity(arr: collections.Array<SimpleSendable>, count: number): number {
  const instances: SimpleSendable[] = [];
  for (let i = 0; i < count; i++) {
    const inst: SimpleSendable = new SimpleSendable(i);
    instances.push(inst);
    arr.push(inst);
  }
  if (arr.length !== count) {
    return 0;
  }
  for (let i = 0; i < count; i++) {
    if (arr[i] !== instances[i]) {
      return i + 1;
    }
    if (arr[i].id !== i) {
      return count + 1 + i;
    }
  }
  return -1;
}

@Concurrent
function verifySendableAllPropsAfterTransfer(obj: SendableClassOver1024, enumVal: number): boolean {
  if (obj.num_pos_int !== 123) {
    return false;
  }
  if (obj.num_neg_int !== -456) {
    return false;
  }
  if (obj.num_zero !== 0) {
    return false;
  }
  if (obj.num_neg_zero !== -0) {
    return false;
  }
  if (obj.num_float !== 3.14) {
    return false;
  }
  if (obj.num_sci_pos !== 1e10) {
    return false;
  }
  if (obj.num_sci_neg !== 1e-10) {
    return false;
  }
  if (obj.num_max_val !== Number.MAX_VALUE) {
    return false;
  }
  if (obj.num_min_val !== Number.MIN_VALUE) {
    return false;
  }
  if (obj.num_max_safe !== Number.MAX_SAFE_INTEGER) {
    return false;
  }
  if (obj.num_min_safe !== Number.MIN_SAFE_INTEGER) {
    return false;
  }
  if (obj.num_epsilon !== Number.EPSILON) {
    return false;
  }
  if (!Number.isNaN(obj.num_nan)) {
    return false;
  }
  if (obj.num_infinity !== Infinity) {
    return false;
  }
  if (obj.num_neg_infinity !== -Infinity) {
    return false;
  }
  if (obj.num_hex !== 255) {
    return false;
  }
  if (obj.num_octal !== 511) {
    return false;
  }
  if (obj.num_binary !== 10) {
    return false;
  }
  if (obj.num_pos_int.toFixed(2) !== '123.00') {
    return false;
  }
  if (obj.num_nan.toString() !== 'NaN') {
    return false;
  }
  if (obj.str_empty !== '') {
    return false;
  }
  if (obj.str_single !== 'a') {
    return false;
  }
  if (obj.str_multi !== 'hello world') {
    return false;
  }
  if (obj.str_spaces !== '   ') {
    return false;
  }
  if (obj.str_tab !== '\t\t') {
    return false;
  }
  if (obj.str_newline !== '\n\r\n') {
    return false;
  }
  if (obj.str_unicode !== '你好世界') {
    return false;
  }
  if (obj.str_emoji !== '😀🎉🔥') {
    return false;
  }
  if (obj.str_escape !== '\\\n\t') {
    return false;
  }
  if (obj.str_long.length !== 10000) {
    return false;
  }
  if (obj.str_multibyte !== '𠮷𠮷𠮷') {
    return false;
  }
  if (obj.str_combining !== 'é') {
    return false;
  }
  if (obj.str_zerowidth !== 'a\u200Bb') {
    return false;
  }
  if (obj.str_bom !== '\uFEFF') {
    return false;
  }
  if (obj.str_private !== '\uE000\uE001') {
    return false;
  }
  if (obj.str_multi.includes('world') !== true) {
    return false;
  }
  if (obj.str_multi.charAt(0) !== 'h') {
    return false;
  }
  if (obj.str_emoji.split('🎉').length !== 2) {
    return false;
  }
  if (obj.bool_true !== true) {
    return false;
  }
  if (obj.bool_false !== false) {
    return false;
  }
  if (obj.bool_true.toString() !== 'true') {
    return false;
  }
  if (obj.col_array.length !== 3) {
    return false;
  }
  if (enumVal !== 1024) {
    return false;
  }
  obj.num_pos_int = 9999;
  if (obj.num_pos_int !== 9999) {
    return false;
  }
  obj.str_empty = 'updated';
  if (obj.str_empty !== 'updated') {
    return false;
  }
  obj.bool_true = false;
  if (obj.bool_true !== false) {
    return false;
  }
  obj.bool_true = true;
  return true;
}

export default function SendableExpand1024Test() {
  describe('SendableExpand1024Test', () => {
    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_SENDABLE_EXPAND_1024_0100
     * @tc.name   sendableExpand1024Test0001
     * @tc.desc   Verify all 1025 attributes are readable and writable with correct representative values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sendableExpand1024Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info("-----------------sendableExpand1024Test0001 begin-----------------");
      let obj: SendableClassOver1024 = new SendableClassOver1024();
      expect(obj.num_pos_int).assertEqual(123);
      expect(Number.isNaN(obj.num_nan)).assertTrue();
      expect(obj.num_infinity).assertEqual(Infinity);
      expect(1 / obj.num_neg_zero).assertEqual(-Infinity);
      expect(obj.num_max_safe).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(obj.str_multi).assertEqual('hello world');
      expect(obj.str_empty).assertEqual('');
      expect(obj.str_emoji).assertEqual(EMOJI);
      expect(obj.str_zerowidth.charCodeAt(1)).assertEqual(0x200B);
      expect(obj.str_escape.length).assertEqual(3);
      expect(obj.bool_true).assertTrue();
      expect(obj.bool_false).assertFalse();
      expect(obj.prop0).assertEqual(0);
      expect(obj.prop988).assertEqual(0);
      obj.num_pos_int = 9999;
      expect(obj.num_pos_int).assertEqual(9999);
      console.info("-----------------sendableExpand1024Test0001 end-----------------");
    });

    /**
     * @tc.number SUB_SENDABLE_EXPAND_1024_0200
     * @tc.name   sendableExpand1024Test0002
     * @tc.desc   Verify modifications to front-half and beyond-boundary attributes are visible and independent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sendableExpand1024Test0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info("-----------------sendableExpand1024Test0002 begin-----------------");
      let obj: SendableClassOver1024 = new SendableClassOver1024();
      obj.num_pos_int = 11111;
      obj.prop988 = 777;
      expect(obj.num_pos_int).assertEqual(11111);
      expect(obj.prop988).assertEqual(777);
      expect(obj.bool_true).assertTrue();
      expect(obj.num_neg_int).assertEqual(-456);
      for (let i = 0; i < 10; i++) {
        expect(obj.num_pos_int).assertEqual(11111);
        expect(obj.prop988).assertEqual(777);
      }
      console.info("-----------------sendableExpand1024Test0002 end-----------------");
    });

    /**
     * @tc.number SUB_SENDABLE_EXPAND_1024_0300
     * @tc.name   sendableExpand1024Test0003
     * @tc.desc   Verify a 1025-attribute sendable object is passed cross-thread with all attributes visible.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sendableExpand1024Test0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.info("-----------------sendableExpand1024Test0003 begin-----------------");
      let obj: SendableClassOver1024 = new SendableClassOver1024();
      let result: Object = await taskpool.execute(receiveSendableObjectTask, obj);
      expect(result).assertEqual(true);
      console.info("-----------------sendableExpand1024Test0003 end-----------------");
    });

    /**
     * @tc.number SUB_SENDABLE_EXPAND_1024_0400
     * @tc.name   sendableExpand1024Test0004
     * @tc.desc   Verify all 1025 const enum members are accessible with boundary Member1024.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sendableExpand1024Test0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info("-----------------sendableExpand1024Test0004 begin-----------------");
      expect(SendableEnumOver1024.MemberZero).assertEqual(0);
      expect(SendableEnumOver1024.MemberPositive).assertEqual(123);
      expect(SendableEnumOver1024.MemberNegative).assertEqual(-456);
      expect(SendableEnumOver1024.MemberHex).assertEqual(255);
      expect(SendableEnumOver1024.MemberOctal).assertEqual(511);
      expect(SendableEnumOver1024.MemberBinary).assertEqual(10);
      expect(SendableEnumOver1024.MemberMaxSafe).assertEqual(9007199254740991);
      expect(SendableEnumOver1024.Member1023).assertEqual(1023);
      expect(SendableEnumOver1024.Member1024).assertEqual(1024);
      for (let i = 0; i < 10; i++) {
        expect(SendableEnumOver1024.Member1024).assertEqual(1024);
      }
      console.info("-----------------sendableExpand1024Test0004 end-----------------");
    });

    /**
     * @tc.number SUB_SENDABLE_EXPAND_1024_0500
     * @tc.name   sendableExpand1024Test0005
     * @tc.desc   Verify const enum boundary member values pass through TaskPool with values intact.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sendableExpand1024Test0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.info("-----------------sendableExpand1024Test0005 begin-----------------");
      let result1023: Object = await taskpool.execute(receiveEnumValueTask, SendableEnumOver1024.Member1023);
      let result1024: Object = await taskpool.execute(receiveEnumValueTask, SendableEnumOver1024.Member1024);
      expect(result1023).assertEqual(1023);
      expect(result1024).assertEqual(1024);
      console.info("-----------------sendableExpand1024Test0005 end-----------------");
    });

    /**
     * @tc.number SUB_SENDABLE_EXPAND_1024_0600
     * @tc.name   sendableExpand1024Test0006
     * @tc.desc   Verify collections.Array holds 1025 sendable instances with correct reference identity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sendableExpand1024Test0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.info("-----------------sendableExpand1024Test0006 begin-----------------");
      const arr: collections.Array<SimpleSendable> = new collections.Array<SimpleSendable>();
      const result: Object = await taskpool.execute(verifySendableArrayIdentity, arr, LEN_1025);
      expect(result).assertEqual(-1);
      console.info("-----------------sendableExpand1024Test0006 end-----------------");
    });

    /**
     * @tc.number SUB_SENDABLE_EXPAND_1024_0700
     * @tc.name   sendableExpand1024Test0007
     * @tc.desc   Verify collections.Map holds 256 sendable instances as values with correct reference identity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sendableExpand1024Test0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info("-----------------sendableExpand1024Test0007 begin-----------------");
      let map: collections.Map<number, SimpleSendable> = new collections.Map<number, SimpleSendable>();
      let instances: SimpleSendable[] = [];
      for (let i = 0; i < LEN_256; i++) {
        let inst: SimpleSendable = new SimpleSendable(i);
        instances.push(inst);
        map.set(i, inst);
      }
      expect(map.size).assertEqual(LEN_256);
      for (let i = 0; i < LEN_256; i++) {
        expect(map.get(i) === instances[i]).assertTrue();
        expect(map.get(i)!.id).assertEqual(i);
      }
      console.info("-----------------sendableExpand1024Test0007 end-----------------");
    });

    /**
     * @tc.number SUB_SENDABLE_EXPAND_1024_0800
     * @tc.name   sendableExpand1024Test0008
     * @tc.desc   Verify collections.Set holds 256 sendable instances deduplicated by reference identity.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sendableExpand1024Test0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info("-----------------sendableExpand1024Test0008 begin-----------------");
      let set: collections.Set<SimpleSendable> = new collections.Set<SimpleSendable>();
      let instances: SimpleSendable[] = [];
      for (let i = 0; i < LEN_256; i++) {
        let inst: SimpleSendable = new SimpleSendable(i);
        instances.push(inst);
        set.add(inst);
      }
      expect(set.size).assertEqual(LEN_256);
      for (let i = 0; i < LEN_256; i++) {
        expect(set.has(instances[i])).assertTrue();
      }
      let dupInst: SimpleSendable = new SimpleSendable(0);
      expect(set.has(dupInst)).assertFalse();
      console.info("-----------------sendableExpand1024Test0008 end-----------------");
    });

    /**
     * @tc.number SUB_SENDABLE_EXPAND_1024_0900
     * @tc.name   sendableExpand1024Test0009
     * @tc.desc   Verify 3 concurrent tasks read a 1025-attribute sendable object with correct checklist values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sendableExpand1024Test0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.info("-----------------sendableExpand1024Test0009 begin-----------------");
      let obj: SendableClassOver1024 = new SendableClassOver1024();
      let p1: Promise<Object> = taskpool.execute(concurrentReadTask, obj);
      let p2: Promise<Object> = taskpool.execute(concurrentReadTask, obj);
      let p3: Promise<Object> = taskpool.execute(concurrentReadTask, obj);
      let result1: Object = await p1;
      let result2: Object = await p2;
      let result3: Object = await p3;
      expect(result1).assertEqual(true);
      expect(result2).assertEqual(true);
      expect(result3).assertEqual(true);
      console.info("-----------------sendableExpand1024Test0009 end-----------------");
    });

    /**
     * @tc.number SUB_SENDABLE_EXPAND_1024_1000
     * @tc.name   sendableExpand1024Test0010
     * @tc.desc   Verify 3 concurrent TaskPool reads over disjoint ranges of 1025 instances sum correctly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sendableExpand1024Test0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.info("-----------------sendableExpand1024Test0010 begin-----------------");
      let arr: collections.Array<SimpleSendable> = new collections.Array<SimpleSendable>();
      for (let i = 0; i < LEN_1025; i++) {
        arr.push(new SimpleSendable(i));
      }
      let p1: Promise<Object> = taskpool.execute(concurrentReadArrayTask, arr, 0, 342);
      let p2: Promise<Object> = taskpool.execute(concurrentReadArrayTask, arr, 342, 684);
      let p3: Promise<Object> = taskpool.execute(concurrentReadArrayTask, arr, 684, 1025);
      let result1: Object = await p1;
      let result2: Object = await p2;
      let result3: Object = await p3;
      expect(result1).assertEqual(58311);
      expect(result2).assertEqual(175275);
      expect(result3).assertEqual(291214);
      console.info("-----------------sendableExpand1024Test0010 end-----------------");
    });

    /**
     * @tc.number SUB_SENDABLE_EXPAND_1024_1100
     * @tc.name   sendableExpand1024Test0011
     * @tc.desc   Verify all checklist attributes and enum boundary value remain usable after cross-thread transfer.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sendableExpand1024Test0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      console.info("-----------------sendableExpand1024Test0011 begin-----------------");
      let obj: SendableClassOver1024 = new SendableClassOver1024();
      let enumVal: number = SendableEnumOver1024.Member1024;
      let result: Object = await taskpool.execute(verifySendableAllPropsAfterTransfer, obj, enumVal);
      expect(result).assertEqual(true);
      console.info("-----------------sendableExpand1024Test0011 end-----------------");
    });

    /**
     * @tc.number SUB_SENDABLE_EXPAND_1024_1200
     * @tc.name   sendableExpand1024Test0012
     * @tc.desc   Verify Set keeps all same-value distinct refs while Map dedupes by key across 256 instances.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('sendableExpand1024Test0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      console.info("-----------------sendableExpand1024Test0012 begin-----------------");
      let instances: SimpleSendable[] = [];
      for (let i = 0; i < LEN_256; i++) {
        instances.push(new SimpleSendable(0));
      }
      let set: collections.Set<SimpleSendable> = new collections.Set<SimpleSendable>();
      for (let i = 0; i < LEN_256; i++) {
        set.add(instances[i]);
      }
      expect(set.size).assertEqual(LEN_256);
      for (let i = 0; i < LEN_256; i++) {
        expect(set.has(instances[i])).assertTrue();
      }
      set.add(instances[0]);
      expect(set.size).assertEqual(LEN_256);
      let dupInst: SimpleSendable = new SimpleSendable(0);
      expect(set.has(dupInst)).assertFalse();
      let map: collections.Map<number, SimpleSendable> = new collections.Map<number, SimpleSendable>();
      for (let i = 0; i < LEN_256; i++) {
        map.set(0, instances[i]);
      }
      expect(map.size).assertEqual(1);
      expect(map.get(0) === instances[255]).assertTrue();
      for (let i = 0; i < LEN_256; i++) {
        map.set(i, instances[i]);
      }
      expect(map.size).assertEqual(LEN_256);
      for (let i = 0; i < LEN_256; i++) {
        expect(map.get(i) === instances[i]).assertTrue();
        expect(map.get(i)!.id).assertEqual(0);
      }
      console.info("-----------------sendableExpand1024Test0012 end-----------------");
    });
  });
}
