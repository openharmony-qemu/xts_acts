'use static'
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

import {
  expect,
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  TestType,
  Size,
  Level
} from "../../../../hypium/index";
import { result1 } from './SymbolAndSyntaxDisambiguation1';
import { result2_1, result2_2 } from './SymbolAndSyntaxDisambiguation2';
import { result3_1, result3_2 } from './SymbolAndSyntaxDisambiguation3';
import { result4 } from './SymbolAndSyntaxDisambiguation4';
import { result5 } from './SymbolAndSyntaxDisambiguation5';
import { result6 } from './SymbolAndSyntaxDisambiguation6';
import { result7 } from './SymbolAndSyntaxDisambiguation7';
import { result8 } from './SymbolAndSyntaxDisambiguation8';
import { result9 } from './SymbolAndSyntaxDisambiguation9';
import { result10 } from './SymbolAndSyntaxDisambiguation10';
import { result11 } from './SymbolAndSyntaxDisambiguation11';
import { result12 } from './SymbolAndSyntaxDisambiguation12';
import { result13 } from './SymbolAndSyntaxDisambiguation13';
import { symbolAndSyntaxDisambiguation14 } from './SymbolAndSyntaxDisambiguation14';
import { result15_1, result15_2 } from './SymbolAndSyntaxDisambiguation15';
import { result16 } from './SymbolAndSyntaxDisambiguation16';
import { result17 } from './SymbolAndSyntaxDisambiguation17';
import { result18 } from './SymbolAndSyntaxDisambiguation18';
import { result19 } from './SymbolAndSyntaxDisambiguation19';
import { result20_1, result20_2, result20_3 } from './SymbolAndSyntaxDisambiguation20';
import { result21_1, result21_2 } from './SymbolAndSyntaxDisambiguation21';
import { symbolAndSyntaxDisambiguation22 } from './SymbolAndSyntaxDisambiguation22';

export default function symbolAndSyntaxDisambiguationTest(): void {
  describe('symbolAndSyntaxDisambiguationTest', () => {
    beforeAll((): void => {
    })
    beforeEach((): void => {
    })
    afterEach((): void => {
    })
    afterAll((): void => {
    })

    /**
     * @tc.number SUB_STATIC_SPEC_SYMBOLANDSYNTAXDISAMBIGUATION_0100
     * @tc.name SymbolAndSyntaxDisambiguationTest001
     * @tc.desc When a class member method and an extension function have the same name, the member method takes precedence.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('SymbolAndSyntaxDisambiguationTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result1).assertEqual("A.bar");
    })

    /**
     * @tc.number SUB_STATIC_SPEC_SYMBOLANDSYNTAXDISAMBIGUATION_0200
     * @tc.name SymbolAndSyntaxDisambiguationTest002
     * @tc.desc When a generic extension function and a member method have the same name.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('SymbolAndSyntaxDisambiguationTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result2_1).assertEqual(5);
      expect(result2_2).assertEqual("hello");
    })

    /**
     * @tc.number SUB_STATIC_SPEC_SYMBOLANDSYNTAXDISAMBIGUATION_0300
     * @tc.name SymbolAndSyntaxDisambiguationTest003
     * @tc.desc When an overloaded member method and an extension function have the same name.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('SymbolAndSyntaxDisambiguationTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result3_1).assertEqual(10);
      expect(result3_2).assertEqual("test doubled");
    })

    /**
     * @tc.number SUB_STATIC_SPEC_SYMBOLANDSYNTAXDISAMBIGUATION_0400
     * @tc.name SymbolAndSyntaxDisambiguationTest004
     * @tc.desc When a member method and an extension function have the same name in an inherited class.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('SymbolAndSyntaxDisambiguationTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result4).assertEqual("child");
    })

    /**
     * @tc.number SUB_STATIC_SPEC_SYMBOLANDSYNTAXDISAMBIGUATION_0500
     * @tc.name SymbolAndSyntaxDisambiguationTest005
     * @tc.desc When a class has no member method with the same name, the extension function takes effect.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('SymbolAndSyntaxDisambiguationTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result5).assertEqual("extension.extraMethod");
    })

    /**
     * @tc.number SUB_STATIC_SPEC_SYMBOLANDSYNTAXDISAMBIGUATION_0600
     * @tc.name SymbolAndSyntaxDisambiguationTest006
     * @tc.desc When a static method and an extension function have the same name.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('SymbolAndSyntaxDisambiguationTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result6).assertEqual("class.staticMethod");
    })

    /**
     * @tc.number SUB_STATIC_SPEC_SYMBOLANDSYNTAXDISAMBIGUATION_0700
     * @tc.name SymbolAndSyntaxDisambiguationTest007
     * @tc.desc When a private member method and an extension function have the same name.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('SymbolAndSyntaxDisambiguationTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result7).assertEqual("private");
    })

    /**
     * @tc.number SUB_STATIC_SPEC_SYMBOLANDSYNTAXDISAMBIGUATION_0800
     * @tc.name SymbolAndSyntaxDisambiguationTest008
     * @tc.desc When multiple extension functions with the same name and a member method share the same name.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('SymbolAndSyntaxDisambiguationTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result8).assertEqual("class.multiMethod");
    })

    /**
     * @tc.number SUB_STATIC_SPEC_SYMBOLANDSYNTAXDISAMBIGUATION_0900
     * @tc.name SymbolAndSyntaxDisambiguationTest009
     * @tc.desc When a member method and an extension function have the same name in an interface implementation class.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('SymbolAndSyntaxDisambiguationTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result9).assertEqual("class.interfaceMethod");
    })

    /**
     * @tc.number SUB_STATIC_SPEC_SYMBOLANDSYNTAXDISAMBIGUATION_1000
     * @tc.name SymbolAndSyntaxDisambiguationTest010
     * @tc.desc When an accessor and an extension function have the same name.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('SymbolAndSyntaxDisambiguationTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result10).assertEqual("new value");
    })

    /**
     * @tc.number SUB_STATIC_SPEC_SYMBOLANDSYNTAXDISAMBIGUATION_1100
     * @tc.name SymbolAndSyntaxDisambiguationTest011
     * @tc.desc When an inherited class has no member method, and the parent class and an extension function share the same name.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('SymbolAndSyntaxDisambiguationTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result11).assertEqual("parent");
    })

    /**
     * @tc.number SUB_STATIC_SPEC_SYMBOLANDSYNTAXDISAMBIGUATION_1200
     * @tc.name SymbolAndSyntaxDisambiguationTest012
     * @tc.desc Extension functions on enum types with no member method of the same name.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('SymbolAndSyntaxDisambiguationTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result12).assertEqual("extension.labeled");
    })

    /**
     * @tc.number SUB_STATIC_SPEC_SYMBOLANDSYNTAXDISAMBIGUATION_1300
     * @tc.name SymbolAndSyntaxDisambiguationTest013
     * @tc.desc In multi-level inheritance, when an extension function and a member method share the same name.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('SymbolAndSyntaxDisambiguationTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result13).assertEqual("Parent");
    })

    /**
     * @tc.number SUB_STATIC_SPEC_SYMBOLANDSYNTAXDISAMBIGUATION_1400
     * @tc.name SymbolAndSyntaxDisambiguationTest014
     * @tc.desc A member method is async, while the extension function with the same name is non-async.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('SymbolAndSyntaxDisambiguationTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result14 = await symbolAndSyntaxDisambiguation14();
      expect(result14).assertEqual("member.data");
    })

    /**
     * @tc.number SUB_STATIC_SPEC_SYMBOLANDSYNTAXDISAMBIGUATION_1500
     * @tc.name SymbolAndSyntaxDisambiguationTest015
     * @tc.desc Different classes share the same extension function with no member method of the same name.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('SymbolAndSyntaxDisambiguationTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result15_1).assertEqual("extension.Dog");
      expect(result15_2).assertEqual("extension.Cat");
    })

    /**
     * @tc.number SUB_STATIC_SPEC_SYMBOLANDSYNTAXDISAMBIGUATION_1600
     * @tc.name SymbolAndSyntaxDisambiguationTest016
     * @tc.desc A basic type calls an extension function with no member method of the same name.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('SymbolAndSyntaxDisambiguationTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result16).assertTrue();
    })

    /**
     * @tc.number SUB_STATIC_SPEC_SYMBOLANDSYNTAXDISAMBIGUATION_1700
     * @tc.name SymbolAndSyntaxDisambiguationTest017
     * @tc.desc A member method is private, and an extension function shares the same name.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('SymbolAndSyntaxDisambiguationTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result17).assertEqual("extension.secret");
    })

    /**
     * @tc.number SUB_STATIC_SPEC_SYMBOLANDSYNTAXDISAMBIGUATION_1800
     * @tc.name SymbolAndSyntaxDisambiguationTest018
     * @tc.desc A member method is protected, and an extension function shares the same name.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('SymbolAndSyntaxDisambiguationTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result18).assertEqual("extension.bar");
    })

    /**
     * @tc.number SUB_STATIC_SPEC_SYMBOLANDSYNTAXDISAMBIGUATION_1900
     * @tc.name SymbolAndSyntaxDisambiguationTest019
     * @tc.desc A member method returns a nullish type, and an extension function shares the same name.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('SymbolAndSyntaxDisambiguationTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result19).assertEqual("found");
    })

    /**
     * @tc.number SUB_STATIC_SPEC_SYMBOLANDSYNTAXDISAMBIGUATION_2000
     * @tc.name SymbolAndSyntaxDisambiguationTest020
     * @tc.desc When a class has a member method, the member method takes precedence over the extension function; when the parent class has a public method, it shadows the extension function; when the parent class method is private, the extension function is called instead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('SymbolAndSyntaxDisambiguationTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result20_1).assertEqual("A.bar");
      expect(result20_2).assertEqual("Base.inheritedBar");
      expect(result20_3).assertEqual("extension.hidden");
    })

    /**
     * @tc.number SUB_STATIC_SPEC_SYMBOLANDSYNTAXDISAMBIGUATION_2100
     * @tc.name SymbolAndSyntaxDisambiguationTest021
     * @tc.desc When a class has a private member method and an extension function with the same name, the extension function is called externally, while the private member method is called internally via this.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('SymbolAndSyntaxDisambiguationTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(result21_1).assertEqual(2);
      expect(result21_2).assertEqual(1);
    })

    /**
     * @tc.number SUB_STATIC_SPEC_SYMBOLANDSYNTAXDISAMBIGUATION_2200
     * @tc.name SymbolAndSyntaxDisambiguationTest022
     * @tc.desc A generic higher-order function wraps a callback and returns it; invoking the wrapped function executes the original callback, verifying that generic function type inference and function invocation work correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('SymbolAndSyntaxDisambiguationTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result22 = symbolAndSyntaxDisambiguation22();
      expect(result22).assertTrue();
    })
  })
}
