'use static';

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from "../../../../hypium/index";
import Utils from "../Util.test";

import {EmptyCls,MultiParamCtor,IntCtor,TwoParamCtor,ThreeParamCtor,StringCtor,BoolCtor,NumberCtor,} from "../Util.test";

export default function ConstructorCreateInstanceTest2Part1(): void {
  describe("ConstructorCreateInstanceTest2Part1", (): void => {
    beforeAll(() => {});
    beforeEach((): void=> {});
    afterEach(async (): Promise<void> => {
      await new Promise<void>((resolve) => {
        setTimeout(() => {
          resolve(undefined);
        }, 100);
      });
    });
    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_0100     
     * @tc.name testConstructorCreateInstance2P1Test001
     * @tc.desc Verify EmptyCls omit args parameter createInstance succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyCls>();
      let ctor = cls.getConstructors()[0];
      let obj = ctor.createInstance() as EmptyCls;
      expect(obj instanceof EmptyCls).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_0200     
     * @tc.name testConstructorCreateInstance2P1Test002
     * @tc.desc Verify EmptyCls extra parameter throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyCls>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance(['x']);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_0300     
     * @tc.name testConstructorCreateInstance2P1Test003
     * @tc.desc Verify IntCtor omit args throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_0400     
     * @tc.name testConstructorCreateInstance2P1Test004
     * @tc.desc Verify IntCtor empty array throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance([]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_0500     
     * @tc.name testConstructorCreateInstance2P1Test005
     * @tc.desc Verify IntCtor too many parameters throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance([1, 2]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_0600     
     * @tc.name testConstructorCreateInstance2P1Test006
     * @tc.desc Verify TwoParamCtor one parameter throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TwoParamCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance(['a']);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_0700     
     * @tc.name testConstructorCreateInstance2P1Test007
     * @tc.desc Verify TwoParamCtor empty array throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TwoParamCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance([]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_0800     
     * @tc.name testConstructorCreateInstance2P1Test008
     * @tc.desc Verify TwoParamCtor omit args throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TwoParamCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_0900     
     * @tc.name testConstructorCreateInstance2P1Test009
     * @tc.desc Verify TwoParamCtor three parameters throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TwoParamCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance(['a', 1, true]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_1000     
     * @tc.name testConstructorCreateInstance2P1Test010
     * @tc.desc Verify ThreeParamCtor two parameters throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ThreeParamCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance([1, 'a']);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_1100     
     * @tc.name testConstructorCreateInstance2P1Test011
     * @tc.desc Verify ThreeParamCtor one parameter throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ThreeParamCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance([1]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_1200     
     * @tc.name testConstructorCreateInstance2P1Test012
     * @tc.desc Verify ThreeParamCtor empty array throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ThreeParamCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance([]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_1300     
     * @tc.name testConstructorCreateInstance2P1Test013
     * @tc.desc Verify ThreeParamCtor omit args throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ThreeParamCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_1400     
     * @tc.name testConstructorCreateInstance2P1Test014
     * @tc.desc Verify ThreeParamCtor four parameters throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ThreeParamCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance([1, 'a', true, false]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_1500     
     * @tc.name testConstructorCreateInstance2P1Test015
     * @tc.desc Verify ThreeParamCtor five parameters throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ThreeParamCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance([1, 'a', true, 'x', 0]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_1600     
     * @tc.name testConstructorCreateInstance2P1Test016
     * @tc.desc Verify IntCtor undefined as args throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance(undefined);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_1700     
     * @tc.name testConstructorCreateInstance2P1Test017
     * @tc.desc Verify IntCtor undefined array element throws NullPointerError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance([undefined]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("NullPointerError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_1800     
     * @tc.name testConstructorCreateInstance2P1Test018
     * @tc.desc Verify IntCtor hex 0x7FFFFFFF boundary createInstance and getName unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntCtor>();
      let ctor = cls.getConstructors()[0];
      let obj = ctor.createInstance([0x7fffffff]) as IntCtor;
      expect(obj.v).assertEqual(0x7fffffff);
      expect(ctor.getName()).assertEqual("constructor");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_1900     
     * @tc.name testConstructorCreateInstance2P1Test019
     * @tc.desc Verify IntCtor Int.toDouble(Int.MIN_VALUE) createInstance throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        let obj = ctor.createInstance([Int.toDouble(Int.MIN_VALUE)]) as IntCtor;
        expect(obj.v).assertEqual(Int.MIN_VALUE);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_2000     
     * @tc.name testConstructorCreateInstance2P1Test020
     * @tc.desc Verify IntCtor float 1.9 throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        let obj = ctor.createInstance([1.9]) as IntCtor;
        expect(obj.v).assertEqual(1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_2100     
     * @tc.name testConstructorCreateInstance2P1Test021
     * @tc.desc Verify IntCtor float -1.9 throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        let obj = ctor.createInstance([-1.9]) as IntCtor;
        expect(obj.v).assertEqual(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_2200     
     * @tc.name testConstructorCreateInstance2P1Test022
     * @tc.desc Verify IntCtor string type throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance(["str"]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_2300     
     * @tc.name testConstructorCreateInstance2P1Test023
     * @tc.desc Verify IntCtor boolean true throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<IntCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance([true]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_2400     
     * @tc.name testConstructorCreateInstance2P1Test024
     * @tc.desc Verify StringCtor integer throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StringCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance([42]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_2500     
     * @tc.name testConstructorCreateInstance2P1Test025
     * @tc.desc Verify StringCtor boolean true throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<StringCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance([true]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_2600     
     * @tc.name testConstructorCreateInstance2P1Test026
     * @tc.desc Verify BoolCtor integer 0 throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BoolCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance([0]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_2700     
     * @tc.name testConstructorCreateInstance2P1Test027
     * @tc.desc Verify BoolCtor empty string throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BoolCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance(['']);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_2800     
     * @tc.name testConstructorCreateInstance2P1Test028
     * @tc.desc Verify BoolCtor integer 42 throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BoolCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance([42]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_2900     
     * @tc.name testConstructorCreateInstance2P1Test029
     * @tc.desc Verify BoolCtor string throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<BoolCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance(["str"]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_3000     
     * @tc.name testConstructorCreateInstance2P1Test030
     * @tc.desc Verify NumberCtor negative double createInstance succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumberCtor>();
      let ctor = cls.getConstructors()[0];
      let obj = ctor.createInstance([-2.71828]) as NumberCtor;
      expect(obj.v).assertEqual(-2.71828);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_3100     
     * @tc.name testConstructorCreateInstance2P1Test031
     * @tc.desc Verify NumberCtor string throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumberCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance(["str"]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_3200     
     * @tc.name testConstructorCreateInstance2P1Test032
     * @tc.desc Verify NumberCtor boolean true throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumberCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance([true]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_3300     
     * @tc.name testConstructorCreateInstance2P1Test033
     * @tc.desc Verify NumberCtor extra parameter throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumberCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance([0.0, 1.0]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_3400     
     * @tc.name testConstructorCreateInstance2P1Test034
     * @tc.desc Verify NumberCtor undefined as args throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumberCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance(undefined);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_3500     
     * @tc.name testConstructorCreateInstance2P1Test035
     * @tc.desc Verify NumberCtor undefined array element throws NullPointerError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<NumberCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance([undefined]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("NullPointerError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_3600     
     * @tc.name testConstructorCreateInstance2P1Test036
     * @tc.desc Verify TwoParamCtor empty string and negative int createInstance succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TwoParamCtor>();
      let ctor = cls.getConstructors()[0];
      let obj = ctor.createInstance(['', -1]) as TwoParamCtor;
      expect(obj.s).assertEqual('');
      expect(obj.n).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_3700     
     * @tc.name testConstructorCreateInstance2P1Test037
     * @tc.desc Verify TwoParamCtor type swapped throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TwoParamCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance([0, '']);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_3800     
     * @tc.name testConstructorCreateInstance2P1Test038
     * @tc.desc Verify TwoParamCtor second param string throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TwoParamCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance(['x', 'y']);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_3900     
     * @tc.name testConstructorCreateInstance2P1Test039
     * @tc.desc Verify TwoParamCtor both params int throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TwoParamCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance([1, 2]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_4000     
     * @tc.name testConstructorCreateInstance2P1Test040
     * @tc.desc Verify TwoParamCtor first param boolean throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TwoParamCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance([true, 0]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_4100     
     * @tc.name testConstructorCreateInstance2P1Test041
     * @tc.desc Verify TwoParamCtor second param boolean throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TwoParamCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance(['a', true]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_4200     
     * @tc.name testConstructorCreateInstance2P1Test042
     * @tc.desc Verify TwoParamCtor float second param throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TwoParamCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        let obj = ctor.createInstance(['a', 1.5]) as TwoParamCtor;
        expect(obj.s).assertEqual('a');
        expect(obj.n).assertEqual(1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_4300     
     * @tc.name testConstructorCreateInstance2P1Test043
     * @tc.desc Verify TwoParamCtor Double.POSITIVE_INFINITY second param throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TwoParamCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance(['', Double.POSITIVE_INFINITY]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_4400     
     * @tc.name testConstructorCreateInstance2P1Test044
     * @tc.desc Verify TwoParamCtor Double.NaN second param throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<TwoParamCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance(['', Double.NaN]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_4500     
     * @tc.name testConstructorCreateInstance2P1Test045
     * @tc.desc Verify ThreeParamCtor zero values createInstance succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ThreeParamCtor>();
      let ctor = cls.getConstructors()[0];
      let obj = ctor.createInstance([0, '', false]) as ThreeParamCtor;
      expect(obj.a).assertEqual(0);
      expect(obj.b).assertEqual('');
      expect(obj.c).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_4600     
     * @tc.name testConstructorCreateInstance2P1Test046
     * @tc.desc Verify ThreeParamCtor first param string throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ThreeParamCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance(['x', '', true]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_4700     
     * @tc.name testConstructorCreateInstance2P1Test047
     * @tc.desc Verify ThreeParamCtor second param int throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ThreeParamCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance([0, 123, true]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_4800     
     * @tc.name testConstructorCreateInstance2P1Test048
     * @tc.desc Verify ThreeParamCtor third param int throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ThreeParamCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance([0, '', 0]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_4900     
     * @tc.name testConstructorCreateInstance2P1Test049
     * @tc.desc Verify ThreeParamCtor first param boolean throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ThreeParamCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance([true, '', false]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_5000     
     * @tc.name testConstructorCreateInstance2P1Test050
     * @tc.desc Verify ThreeParamCtor third param string throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ThreeParamCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance([0, '', 'x']);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_5100     
     * @tc.name testConstructorCreateInstance2P1Test051
     * @tc.desc Verify ThreeParamCtor first param Double.POSITIVE_INFINITY throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ThreeParamCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance([Double.POSITIVE_INFINITY, '', true]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_5200     
     * @tc.name testConstructorCreateInstance2P1Test052
     * @tc.desc Verify ThreeParamCtor first param Double.NEGATIVE_INFINITY throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ThreeParamCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance([Double.NEGATIVE_INFINITY, '', true]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_5300     
     * @tc.name testConstructorCreateInstance2P1Test053
     * @tc.desc Verify ThreeParamCtor first param Double.NaN throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ThreeParamCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance([Double.NaN, '', true]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_5400     
     * @tc.name testConstructorCreateInstance2P1Test054
     * @tc.desc Verify ThreeParamCtor third param Double.NaN throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ThreeParamCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance([0, '', Double.NaN]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_5500     
     * @tc.name testConstructorCreateInstance2P1Test055
     * @tc.desc Verify ThreeParamCtor double first param throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ThreeParamCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        let obj = ctor.createInstance([0.5, '', true]) as ThreeParamCtor;
        expect(obj.a).assertEqual(0);
        expect(obj.b).assertEqual('');
        expect(obj.c).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_5600     
     * @tc.name testConstructorCreateInstance2P1Test056
     * @tc.desc Verify MultiParamCtor zero boundary values createInstance succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiParamCtor>();
      let ctor = cls.getConstructors()[0];
      let obj = ctor.createInstance([0, '', 0.0]) as MultiParamCtor;
      expect(obj.a).assertEqual(0);
      expect(obj.b).assertEqual('');
      expect(obj.c).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_5700     
     * @tc.name testConstructorCreateInstance2P1Test057
     * @tc.desc Verify MultiParamCtor first param string throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiParamCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance(['', '', 0.0]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_5800     
     * @tc.name testConstructorCreateInstance2P1Test058
     * @tc.desc Verify MultiParamCtor second param int throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiParamCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance([0, 0, 0.0]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_5900     
     * @tc.name testConstructorCreateInstance2P1Test059
     * @tc.desc Verify MultiParamCtor third param string throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiParamCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance([0, '', '']);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_CONSTRUCTOR_CREATEINSTANCE_ExtP1_6000     
     * @tc.name testConstructorCreateInstance2P1Test060
     * @tc.desc Verify MultiParamCtor extra parameter throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("testConstructorCreateInstance2P1Test060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MultiParamCtor>();
      let ctor = cls.getConstructors()[0];
      try {
        ctor.createInstance([0, '', 0.0, true]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    });
  });
}
