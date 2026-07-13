'use static'
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll
} from "@ohos/hypium-binary/src/main/indexStatic";
import Utils from '../../Util.test'

// ==================== Class Definitions ====================

class C14 {
  static v: number;
  static {
    C14.v = 8;
  }
}

class C15 {
  static v: number;
  static {
    C15.v = 2;
  }
}

class C18 {
  static v: number;
  static {
    C18.v = 2.1;
  }
}

class C19 {
  static v: number;
  static {
    C19.v = 3.1;
  }
}

class C20 {
  static v: string;
  static {
    C20.v = "some str";
  }
}

class C21 {
  static v: boolean;
  static {
    C21.v = true;
  }
}

let i_global22 = new Object();
class C22 {
  static v: Object;
  static {
    C22.v = i_global22;
  }
}

class C23 {
  static v: number | string | undefined;
  static {
    C23.v = "str";
  }
}

class C24 {
  static v: number | string | undefined;
  static {
    C24.v = undefined;
  }
}

enum numnum25 { RED, YELLOW, GREEN }
class C25 {
  static v: numnum25;
  static {
    C25.v = numnum25.GREEN;
  }
}

class C26 {
  static v: Array<string>;
  static {
    C26.v = new Array<string>("str #1", "str #2");
  }
}

type func27 = (i: number) => number;
class C27 {
  static v: func27;
  static {
    C27.v = (i) => { return i + 1; };
  }
}

class C28 {
  static f: number = 0;
  static {
    for(let i: number = 0; i < 10; i++) {
      C28.f += i;
    }
  }
}

class C29 {
  static s: number = 1;
  static f: Object | null;
  static {
    switch(C29.s) {
      case 1:
        C29.f = new Object();
        break;
      default:
        C29.f = null;
        break;
    }
  }
}

class C30 {
  static f: Object | null = null;
  static {
    C30.f = (): Object => { return new Object(); };
  }
}

class C31 {
  static c: I32;
  static {
    C31.c = { v: 3.2 };
  }
}

class C32 {
  static i: number;
  static {
    let f: number = 2;
    C32.i = f;
  }
}

class C33 {
  static i: number;
  static {
    {
      C33.i = 4;
    }
  }
}

class CMany {
  static var0: number = 0;
  static var1: number = 0;
  static var2: number = 0;
  static var3: number = 0;
  static var4: number = 0;
  static var5: number = 0;
  static var6: number = 0;
  static var7: number = 0;
  static var8: number = 0;
  static var9: number = 0;
  static var10: number = 0;
  static var11: number = 0;
  static var12: number = 0;
  static var13: number = 0;
  static var14: number = 0;
  static var15: number = 0;
  static var16: number = 0;
  static var17: number = 0;
  static var18: number = 0;
  static var19: number = 0;
  static var20: number = 0;
  static var21: number = 0;
  static var22: number = 0;
  static var23: number = 0;
  static var24: number = 0;
  static var25: number = 0;
  static var26: number = 0;
  static var27: number = 0;
  static var28: number = 0;
  static var29: number = 0;
  static var30: number = 0;
  static var31: number = 0;
  static var32: number = 0;
  static var33: number = 0;
  static var34: number = 0;
  static var35: number = 0;
  static var36: number = 0;
  static var37: number = 0;
  static var38: number = 0;
  static var39: number = 0;
  static var40: number = 0;
  static var41: number = 0;
  static var42: number = 0;
  static var43: number = 0;
  static var44: number = 0;
  static var45: number = 0;
  static var46: number = 0;
  static var47: number = 0;
  static var48: number = 0;
  static var49: number = 0;
  static var50: number = 0;
  static var51: number = 0;
  static var52: number = 0;
  static var53: number = 0;
  static var54: number = 0;
  static var55: number = 0;
  static var56: number = 0;
  static var57: number = 0;
  static var58: number = 0;
  static var59: number = 0;
  static var60: number = 0;
  static var61: number = 0;
  static var62: number = 0;
  static var63: number = 0;
  static var64: number = 0;
  static var65: number = 0;
  static var66: number = 0;
  static var67: number = 0;
  static var68: number = 0;
  static var69: number = 0;
  static var70: number = 0;
  static var71: number = 0;
  static var72: number = 0;
  static var73: number = 0;
  static var74: number = 0;
  static var75: number = 0;
  static var76: number = 0;
  static var77: number = 0;
  static var78: number = 0;
  static var79: number = 0;
  static var80: number = 0;
  static var81: number = 0;
  static var82: number = 0;
  static var83: number = 0;
  static var84: number = 0;
  static var85: number = 0;
  static var86: number = 0;
  static var87: number = 0;
  static var88: number = 0;
  static var89: number = 0;
  static var90: number = 0;
  static var91: number = 0;
  static var92: number = 0;
  static var93: number = 0;
  static var94: number = 0;
  static var95: number = 0;
  static var96: number = 0;
  static var97: number = 0;
  static var98: number = 0;
  static var99: number = 0;
  static {
    CMany.var0 = 0;
    CMany.var1 = 1;
    CMany.var2 = 2;
    CMany.var3 = 3;
    CMany.var4 = 4;
    CMany.var5 = 5;
    CMany.var6 = 6;
    CMany.var7 = 7;
    CMany.var8 = 8;
    CMany.var9 = 9;
    CMany.var10 = 10;
    CMany.var11 = 11;
    CMany.var12 = 12;
    CMany.var13 = 13;
    CMany.var14 = 14;
    CMany.var15 = 15;
    CMany.var16 = 16;
    CMany.var17 = 17;
    CMany.var18 = 18;
    CMany.var19 = 19;
    CMany.var20 = 20;
    CMany.var21 = 21;
    CMany.var22 = 22;
    CMany.var23 = 23;
    CMany.var24 = 24;
    CMany.var25 = 25;
    CMany.var26 = 26;
    CMany.var27 = 27;
    CMany.var28 = 28;
    CMany.var29 = 29;
    CMany.var30 = 30;
    CMany.var31 = 31;
    CMany.var32 = 32;
    CMany.var33 = 33;
    CMany.var34 = 34;
    CMany.var35 = 35;
    CMany.var36 = 36;
    CMany.var37 = 37;
    CMany.var38 = 38;
    CMany.var39 = 39;
    CMany.var40 = 40;
    CMany.var41 = 41;
    CMany.var42 = 42;
    CMany.var43 = 43;
    CMany.var44 = 44;
    CMany.var45 = 45;
    CMany.var46 = 46;
    CMany.var47 = 47;
    CMany.var48 = 48;
    CMany.var49 = 49;
    CMany.var50 = 50;
    CMany.var51 = 51;
    CMany.var52 = 52;
    CMany.var53 = 53;
    CMany.var54 = 54;
    CMany.var55 = 55;
    CMany.var56 = 56;
    CMany.var57 = 57;
    CMany.var58 = 58;
    CMany.var59 = 59;
    CMany.var60 = 60;
    CMany.var61 = 61;
    CMany.var62 = 62;
    CMany.var63 = 63;
    CMany.var64 = 64;
    CMany.var65 = 65;
    CMany.var66 = 66;
    CMany.var67 = 67;
    CMany.var68 = 68;
    CMany.var69 = 69;
    CMany.var70 = 70;
    CMany.var71 = 71;
    CMany.var72 = 72;
    CMany.var73 = 73;
    CMany.var74 = 74;
    CMany.var75 = 75;
    CMany.var76 = 76;
    CMany.var77 = 77;
    CMany.var78 = 78;
    CMany.var79 = 79;
    CMany.var80 = 80;
    CMany.var81 = 81;
    CMany.var82 = 82;
    CMany.var83 = 83;
    CMany.var84 = 84;
    CMany.var85 = 85;
    CMany.var86 = 86;
    CMany.var87 = 87;
    CMany.var88 = 88;
    CMany.var89 = 89;
    CMany.var90 = 90;
    CMany.var91 = 91;
    CMany.var92 = 92;
    CMany.var93 = 93;
    CMany.var94 = 94;
    CMany.var95 = 95;
    CMany.var96 = 96;
    CMany.var97 = 97;
    CMany.var98 = 98;
    CMany.var99 = 99;
  }
}

interface I32 { v: number }

// ==================== Test Cases ====================

export default function StaticInitializationTest():void {
  describe('StaticInitializationTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await Utils.msSleep(30);
    })

    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    SUB_ABC_STATIC_INITIALIZATION_0100
     * @tc.name      testStaticInitializersTypes0001
     * @tc.desc      Static initialization works with numerous types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticInitializersTypes0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(C14.v).assertEqual(8);
    });

    /**
     * @tc.number    SUB_ABC_STATIC_INITIALIZATION_0200
     * @tc.name      testStaticInitializersTypes0002
     * @tc.desc      Static initialization works with numerous types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticInitializersTypes0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(C15.v).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ABC_STATIC_INITIALIZATION_0500
     * @tc.name      testStaticInitializersTypes0005
     * @tc.desc      Static initialization works with numerous types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticInitializersTypes0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(C18.v).assertEqual(2.1);
    });

    /**
     * @tc.number    SUB_ABC_STATIC_INITIALIZATION_0600
     * @tc.name      testStaticInitializersTypes0006
     * @tc.desc      Static initialization works with numerous types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticInitializersTypes0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(C19.v).assertEqual(3.1);
    });

    /**
     * @tc.number    SUB_ABC_STATIC_INITIALIZATION_0700
     * @tc.name      testStaticInitializersTypes0007
     * @tc.desc      Static initialization works with numerous types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticInitializersTypes0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(C20.v).assertEqual("some str");
    });

    /**
     * @tc.number    SUB_ABC_STATIC_INITIALIZATION_0800
     * @tc.name      testStaticInitializersTypes0008
     * @tc.desc      Static initialization works with numerous types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticInitializersTypes0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(C21.v).assertEqual(true);
    });

    /**
     * @tc.number    SUB_ABC_STATIC_INITIALIZATION_0900
     * @tc.name      testStaticInitializersTypes0009
     * @tc.desc      Static initialization works with numerous types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticInitializersTypes0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(C22.v === i_global22).assertTrue();
    });

    /**
     * @tc.number    SUB_ABC_STATIC_INITIALIZATION_1000
     * @tc.name      testStaticInitializersTypes0010
     * @tc.desc      Static initialization works with numerous types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticInitializersTypes0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(C23.v).assertEqual("str");
    });

    /**
     * @tc.number    SUB_ABC_STATIC_INITIALIZATION_1100
     * @tc.name      testStaticInitializersTypes0011
     * @tc.desc      Static initialization works with numerous types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticInitializersTypes0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(C24.v).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_ABC_STATIC_INITIALIZATION_1200
     * @tc.name      testStaticInitializersTypes0012
     * @tc.desc      Static initialization works with numerous types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticInitializersTypes0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(C25.v).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ABC_STATIC_INITIALIZATION_1300
     * @tc.name      testStaticInitializersTypes0013
     * @tc.desc      Static initialization works with numerous types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticInitializersTypes0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(C26.v.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ABC_STATIC_INITIALIZATION_1400
     * @tc.name      testStaticInitializersTypes0014
     * @tc.desc      Static initialization works with numerous types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticInitializersTypes0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(C27.v(3)).assertEqual(4);
    });

    /**
     * @tc.number    SUB_ABC_STATIC_INITIALIZATION_1500
     * @tc.name      testInitializerExecution0015
     * @tc.desc      Static initialization execution involves execution of initializers, top-level statements, and static blocks
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializerExecution0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(C28.f).assertEqual(45);
    });

    /**
     * @tc.number    SUB_ABC_STATIC_INITIALIZATION_1600
     * @tc.name      testInitializerExecution0016
     * @tc.desc      Static initialization execution involves execution of initializers, top-level statements, and static blocks
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializerExecution0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(C29.f !== null).assertTrue();
    });

    /**
     * @tc.number    SUB_ABC_STATIC_INITIALIZATION_1700
     * @tc.name      testInitializerExecution0017
     * @tc.desc      Static initialization execution involves execution of initializers, top-level statements, and static blocks
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializerExecution0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(C30.f !== null).assertTrue();
    });

    /**
     * @tc.number    SUB_ABC_STATIC_INITIALIZATION_1800
     * @tc.name      testInitializerExecution0018
     * @tc.desc      Static initialization execution involves execution of initializers, top-level statements, and static blocks
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializerExecution0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(C31.c.v).assertEqual(3.2);
    });

    /**
     * @tc.number    SUB_ABC_STATIC_INITIALIZATION_1900
     * @tc.name      testInitializerExecution0019
     * @tc.desc      Static initialization execution involves execution of initializers, top-level statements, and static blocks
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializerExecution0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(C32.i).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ABC_STATIC_INITIALIZATION_2000
     * @tc.name      testInitializerExecution0020
     * @tc.desc      Static initialization execution involves execution of initializers, top-level statements, and static blocks
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testInitializerExecution0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(C33.i).assertEqual(4);
    });

    /**
     * @tc.number    SUB_ABC_STATIC_INITIALIZATION_2100
     * @tc.name      testStaticInitializersManyFields0021
     * @tc.desc      Static initialization may initialize multiple fields in one go
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStaticInitializersManyFields0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(CMany.var0).assertEqual(0);
      expect(CMany.var1).assertEqual(1);
      expect(CMany.var2).assertEqual(2);
      expect(CMany.var3).assertEqual(3);
      expect(CMany.var4).assertEqual(4);
      expect(CMany.var5).assertEqual(5);
      expect(CMany.var6).assertEqual(6);
      expect(CMany.var7).assertEqual(7);
      expect(CMany.var8).assertEqual(8);
      expect(CMany.var9).assertEqual(9);
      expect(CMany.var10).assertEqual(10);
      expect(CMany.var11).assertEqual(11);
      expect(CMany.var12).assertEqual(12);
      expect(CMany.var13).assertEqual(13);
      expect(CMany.var14).assertEqual(14);
      expect(CMany.var15).assertEqual(15);
      expect(CMany.var16).assertEqual(16);
      expect(CMany.var17).assertEqual(17);
      expect(CMany.var18).assertEqual(18);
      expect(CMany.var19).assertEqual(19);
      expect(CMany.var20).assertEqual(20);
      expect(CMany.var21).assertEqual(21);
      expect(CMany.var22).assertEqual(22);
      expect(CMany.var23).assertEqual(23);
      expect(CMany.var24).assertEqual(24);
      expect(CMany.var25).assertEqual(25);
      expect(CMany.var26).assertEqual(26);
      expect(CMany.var27).assertEqual(27);
      expect(CMany.var28).assertEqual(28);
      expect(CMany.var29).assertEqual(29);
      expect(CMany.var30).assertEqual(30);
      expect(CMany.var31).assertEqual(31);
      expect(CMany.var32).assertEqual(32);
      expect(CMany.var33).assertEqual(33);
      expect(CMany.var34).assertEqual(34);
      expect(CMany.var35).assertEqual(35);
      expect(CMany.var36).assertEqual(36);
      expect(CMany.var37).assertEqual(37);
      expect(CMany.var38).assertEqual(38);
      expect(CMany.var39).assertEqual(39);
      expect(CMany.var40).assertEqual(40);
      expect(CMany.var41).assertEqual(41);
      expect(CMany.var42).assertEqual(42);
      expect(CMany.var43).assertEqual(43);
      expect(CMany.var44).assertEqual(44);
      expect(CMany.var45).assertEqual(45);
      expect(CMany.var46).assertEqual(46);
      expect(CMany.var47).assertEqual(47);
      expect(CMany.var48).assertEqual(48);
      expect(CMany.var49).assertEqual(49);
      expect(CMany.var50).assertEqual(50);
      expect(CMany.var51).assertEqual(51);
      expect(CMany.var52).assertEqual(52);
      expect(CMany.var53).assertEqual(53);
      expect(CMany.var54).assertEqual(54);
      expect(CMany.var55).assertEqual(55);
      expect(CMany.var56).assertEqual(56);
      expect(CMany.var57).assertEqual(57);
      expect(CMany.var58).assertEqual(58);
      expect(CMany.var59).assertEqual(59);
      expect(CMany.var60).assertEqual(60);
      expect(CMany.var61).assertEqual(61);
      expect(CMany.var62).assertEqual(62);
      expect(CMany.var63).assertEqual(63);
      expect(CMany.var64).assertEqual(64);
      expect(CMany.var65).assertEqual(65);
      expect(CMany.var66).assertEqual(66);
      expect(CMany.var67).assertEqual(67);
      expect(CMany.var68).assertEqual(68);
      expect(CMany.var69).assertEqual(69);
      expect(CMany.var70).assertEqual(70);
      expect(CMany.var71).assertEqual(71);
      expect(CMany.var72).assertEqual(72);
      expect(CMany.var73).assertEqual(73);
      expect(CMany.var74).assertEqual(74);
      expect(CMany.var75).assertEqual(75);
      expect(CMany.var76).assertEqual(76);
      expect(CMany.var77).assertEqual(77);
      expect(CMany.var78).assertEqual(78);
      expect(CMany.var79).assertEqual(79);
      expect(CMany.var80).assertEqual(80);
      expect(CMany.var81).assertEqual(81);
      expect(CMany.var82).assertEqual(82);
      expect(CMany.var83).assertEqual(83);
      expect(CMany.var84).assertEqual(84);
      expect(CMany.var85).assertEqual(85);
      expect(CMany.var86).assertEqual(86);
      expect(CMany.var87).assertEqual(87);
      expect(CMany.var88).assertEqual(88);
      expect(CMany.var89).assertEqual(89);
      expect(CMany.var90).assertEqual(90);
      expect(CMany.var91).assertEqual(91);
      expect(CMany.var92).assertEqual(92);
      expect(CMany.var93).assertEqual(93);
      expect(CMany.var94).assertEqual(94);
      expect(CMany.var95).assertEqual(95);
      expect(CMany.var96).assertEqual(96);
      expect(CMany.var97).assertEqual(97);
      expect(CMany.var98).assertEqual(98);
      expect(CMany.var99).assertEqual(99);
    });
  })
}
