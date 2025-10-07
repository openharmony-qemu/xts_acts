/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  Fn07_testFreezeDefineProperty,
  Fn09_testFreezeIsFrozenCheck,
  Fn103_testFreezeDataViewModify,
  Fn106_testFreezeReflectDeleteProto,
  Fn107_testFreezeBigUint64ArrayModify,
  Fn10_testUnfreezeIsFrozenCheck,
  Fn111_testFreezeWeakMapModify,
  Fn115_testFreezeWeakSetModify,
  Fn118_testFreezeIsExtensible,
  Fn119_testFreezeIsSealed,
  Fn11_testFreezeNestedArray,
  Fn120_testFreezeEmptyObjGetNames,
  Fn127_testFreezeFloat32ArrayModify,
  Fn12_testFreezeDeleteProtoProperty,
  Fn131_testFreezeFloat64ArrayModify,
  Fn133_testFreezeArrayFlatInfinity,
  Fn135_testFreezeInt16ArrayModify,
  Fn139_testFreezeInt32ArrayModify,
  Fn143_testFreezeUint32ArrayModify,
  Fn147_testFreezeBigInt64ArrayModify,
  Fn14_testFreezeFunctionExecution,
  Fn153_testFreezeReflectSetSymbol,
  Fn154_testFreezeUint8ClampedArrayModify,
  Fn156_testFreezeArrayFindModify,
  Fn157_testFreezeGetSymbolDescriptor,
  Fn15_testFreezeDateProperty,
  Fn160_testFreezeReflectDefineNewProp,
  Fn161_testFreezeNestedWeakMapModify,
  Fn163_testFreezeArrayFlatMapNested,
  Fn165_testFreezeUint16ArrayModify,
  Fn169_testFreezeNestedWeakSetModify,
  Fn173_testFreezeArrayWithBigUint64,
  Fn177_testFreezeArrayWithDataView,
  Fn181_testFreezeSharedArrayBufferModify,
  Fn184_testFreezeReflectSetNested,
  Fn185_testFreezeArrayWithUint32,
  Fn187_testFreezeIsFrozenChild,
  Fn189_testFreezeArrayWithInt32,
  Fn191_testFreezeReflectDeleteChild,
  Fn192_testFreezeArraySomeChild,
  Fn193_testFreezeArrayWithFloat64,
  Fn195_testFreezeObjectKeysChild,
  Fn196_testFreezeArrayEveryChild,
  Fn197_testFreezeArrayWithBigInt64,
  Fn199_testFreezeReflectGetChild,
  Fn19_testFreezeArraySplice,
  Fn200_testFreezeArrayFlatChild,
  Fn20_testFreezeArrayPop,
  Fn21_testFreezeArrayShift,
  Fn22_testFreezePropertyDescriptor,
  Fn27_testFreezeEmptyArray,
  Fn28_testFreezeArrayWithNestedObj,
  Fn32_testFreezeDefineProperties,
  Fn33_testFreezeArrayUnshift,
  Fn34_testFreezeArrayFill,
  Fn35_testFreezeSetProperty,
  Fn37_testFreezeMapProperty,
  Fn39_testFreezeReflectSet,
  Fn40_testFreezeReflectDelete,
  Fn41_testFreezeTwoLevelNestedObj,
  Fn43_testFreezeArrayReverse,
  Fn44_testFreezeArraySort,
  Fn46_testFreezePropertyEnumerable,
  Fn47_testFreezePropertyConfigurable,
  Fn48_testFreezeClassInstance,
  Fn52_testFreezeArraySpliceDelete,
  Fn55_testFreezeWeakSetProperty,
  Fn56_testFreezeWeakMapProperty,
  Fn57_testFreezeArrayCopyWithin,
  Fn59_testFreezePromiseProperty,
  Fn64_testFreezeArrayBuffer,
  Fn68_testFreezeTypedArray,
  Fn77_testFreezeErrorModify,
  Fn78_testFreezeReflectDefineProperty,
  Fn80_testFreezeArrayWithDate,
  Fn84_testFreezeArrayWithSet,
  Fn88_testFreezeArrayWithMap,
  Fn90_testFreezeObjectReference,
  Fn94_testFreezeReflectSetPrototype,
  Fn95_testFreezeImageDataModify,
  Fn99_testFreezeInt8ArrayModify
} from './Object7';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function Object7Test() {
  describe('Object7Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
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
     * @tc.number SUB_BUILTINS_Object7_TEST_0700
     * @tc.name Object7Test007
     * @tc.desc test freeze define property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn07_testFreezeDefineProperty();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_0900
     * @tc.name Object7Test009
     * @tc.desc test freeze is frozen check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn09_testFreezeIsFrozenCheck();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_1000
     * @tc.name Object7Test010
     * @tc.desc test unfreeze is frozen check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn10_testUnfreezeIsFrozenCheck();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_1100
     * @tc.name Object7Test011
     * @tc.desc test freeze nested array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn11_testFreezeNestedArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_1200
     * @tc.name Object7Test012
     * @tc.desc test freeze delete proto property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn12_testFreezeDeleteProtoProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_1400
     * @tc.name Object7Test014
     * @tc.desc test freeze function execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn14_testFreezeFunctionExecution();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_1500
     * @tc.name Object7Test015
     * @tc.desc test freeze date property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn15_testFreezeDateProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_1900
     * @tc.name Object7Test019
     * @tc.desc test freeze array splice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn19_testFreezeArraySplice();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_2000
     * @tc.name Object7Test020
     * @tc.desc test freeze array pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn20_testFreezeArrayPop();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_2100
     * @tc.name Object7Test021
     * @tc.desc test freeze array shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn21_testFreezeArrayShift();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_2200
     * @tc.name Object7Test022
     * @tc.desc test freeze property descriptor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn22_testFreezePropertyDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_2700
     * @tc.name Object7Test027
     * @tc.desc test freeze empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn27_testFreezeEmptyArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_2800
     * @tc.name Object7Test028
     * @tc.desc test freeze array with nested obj
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn28_testFreezeArrayWithNestedObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_3200
     * @tc.name Object7Test032
     * @tc.desc test freeze define properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn32_testFreezeDefineProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_3300
     * @tc.name Object7Test033
     * @tc.desc test freeze array unshift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn33_testFreezeArrayUnshift();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_3400
     * @tc.name Object7Test034
     * @tc.desc test freeze array fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn34_testFreezeArrayFill();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_3500
     * @tc.name Object7Test035
     * @tc.desc test freeze set property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn35_testFreezeSetProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_3700
     * @tc.name Object7Test037
     * @tc.desc test freeze map property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn37_testFreezeMapProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_3900
     * @tc.name Object7Test039
     * @tc.desc test freeze reflect set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn39_testFreezeReflectSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_4000
     * @tc.name Object7Test040
     * @tc.desc test freeze reflect delete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn40_testFreezeReflectDelete();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_4100
     * @tc.name Object7Test041
     * @tc.desc test freeze two level nested obj
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn41_testFreezeTwoLevelNestedObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_4300
     * @tc.name Object7Test043
     * @tc.desc test freeze array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn43_testFreezeArrayReverse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_4400
     * @tc.name Object7Test044
     * @tc.desc test freeze array sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn44_testFreezeArraySort();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_4600
     * @tc.name Object7Test046
     * @tc.desc test freeze property enumerable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn46_testFreezePropertyEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_4700
     * @tc.name Object7Test047
     * @tc.desc test freeze property configurable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn47_testFreezePropertyConfigurable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_4800
     * @tc.name Object7Test048
     * @tc.desc test freeze class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn48_testFreezeClassInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_5200
     * @tc.name Object7Test052
     * @tc.desc test freeze array splice delete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn52_testFreezeArraySpliceDelete();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_5500
     * @tc.name Object7Test055
     * @tc.desc test freeze weak set property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn55_testFreezeWeakSetProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_5600
     * @tc.name Object7Test056
     * @tc.desc test freeze weak map property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn56_testFreezeWeakMapProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_5700
     * @tc.name Object7Test057
     * @tc.desc test freeze array copy within
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn57_testFreezeArrayCopyWithin();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_5900
     * @tc.name Object7Test059
     * @tc.desc test freeze promise property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn59_testFreezePromiseProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_6400
     * @tc.name Object7Test064
     * @tc.desc test freeze array buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn64_testFreezeArrayBuffer();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_6800
     * @tc.name Object7Test068
     * @tc.desc test freeze typed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn68_testFreezeTypedArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_7700
     * @tc.name Object7Test077
     * @tc.desc test freeze error modify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn77_testFreezeErrorModify();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_7800
     * @tc.name Object7Test078
     * @tc.desc test freeze reflect define property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn78_testFreezeReflectDefineProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_8000
     * @tc.name Object7Test080
     * @tc.desc test freeze array with date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn80_testFreezeArrayWithDate();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_8400
     * @tc.name Object7Test084
     * @tc.desc test freeze array with set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn84_testFreezeArrayWithSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_8800
     * @tc.name Object7Test088
     * @tc.desc test freeze array with map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn88_testFreezeArrayWithMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_9000
     * @tc.name Object7Test090
     * @tc.desc test freeze object reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn90_testFreezeObjectReference();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_9400
     * @tc.name Object7Test094
     * @tc.desc test freeze reflect set prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn94_testFreezeReflectSetPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_9500
     * @tc.name Object7Test095
     * @tc.desc test freeze image data modify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn95_testFreezeImageDataModify();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_9900
     * @tc.name Object7Test099
     * @tc.desc test freeze int8 array modify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn99_testFreezeInt8ArrayModify();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_10300
     * @tc.name Object7Test103
     * @tc.desc test freeze data view modify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn103_testFreezeDataViewModify();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_10600
     * @tc.name Object7Test106
     * @tc.desc test freeze reflect delete proto
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn106_testFreezeReflectDeleteProto();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_10700
     * @tc.name Object7Test107
     * @tc.desc test freeze big uint64 array modify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn107_testFreezeBigUint64ArrayModify();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_11100
     * @tc.name Object7Test111
     * @tc.desc test freeze weak map modify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn111_testFreezeWeakMapModify();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_11500
     * @tc.name Object7Test115
     * @tc.desc test freeze weak set modify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn115_testFreezeWeakSetModify();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_11800
     * @tc.name Object7Test118
     * @tc.desc test freeze is extensible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn118_testFreezeIsExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_11900
     * @tc.name Object7Test119
     * @tc.desc test freeze is sealed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn119_testFreezeIsSealed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_12000
     * @tc.name Object7Test120
     * @tc.desc test freeze empty obj get names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn120_testFreezeEmptyObjGetNames();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_12700
     * @tc.name Object7Test127
     * @tc.desc test freeze float32 array modify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn127_testFreezeFloat32ArrayModify();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_13100
     * @tc.name Object7Test131
     * @tc.desc test freeze float64 array modify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn131_testFreezeFloat64ArrayModify();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_13300
     * @tc.name Object7Test133
     * @tc.desc test freeze array flat infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn133_testFreezeArrayFlatInfinity();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_13500
     * @tc.name Object7Test135
     * @tc.desc test freeze int16 array modify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn135_testFreezeInt16ArrayModify();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_13900
     * @tc.name Object7Test139
     * @tc.desc test freeze int32 array modify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn139_testFreezeInt32ArrayModify();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_14300
     * @tc.name Object7Test143
     * @tc.desc test freeze uint32 array modify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn143_testFreezeUint32ArrayModify();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_14700
     * @tc.name Object7Test147
     * @tc.desc test freeze big int64 array modify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn147_testFreezeBigInt64ArrayModify();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_15300
     * @tc.name Object7Test153
     * @tc.desc test freeze reflect set symbol
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn153_testFreezeReflectSetSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_15400
     * @tc.name Object7Test154
     * @tc.desc test freeze uint8 clamped array modify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn154_testFreezeUint8ClampedArrayModify();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_15600
     * @tc.name Object7Test156
     * @tc.desc test freeze array find modify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn156_testFreezeArrayFindModify();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_15700
     * @tc.name Object7Test157
     * @tc.desc test freeze get symbol descriptor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn157_testFreezeGetSymbolDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_16000
     * @tc.name Object7Test160
     * @tc.desc test freeze reflect define new prop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn160_testFreezeReflectDefineNewProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_16100
     * @tc.name Object7Test161
     * @tc.desc test freeze nested weak map modify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn161_testFreezeNestedWeakMapModify();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_16300
     * @tc.name Object7Test163
     * @tc.desc test freeze array flat map nested
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn163_testFreezeArrayFlatMapNested();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_16500
     * @tc.name Object7Test165
     * @tc.desc test freeze uint16 array modify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn165_testFreezeUint16ArrayModify();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_16900
     * @tc.name Object7Test169
     * @tc.desc test freeze nested weak set modify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn169_testFreezeNestedWeakSetModify();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_17300
     * @tc.name Object7Test173
     * @tc.desc test freeze array with big uint64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn173_testFreezeArrayWithBigUint64();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_17700
     * @tc.name Object7Test177
     * @tc.desc test freeze array with data view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn177_testFreezeArrayWithDataView();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_18100
     * @tc.name Object7Test181
     * @tc.desc test freeze shared array buffer modify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn181_testFreezeSharedArrayBufferModify();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_18400
     * @tc.name Object7Test184
     * @tc.desc test freeze reflect set nested
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn184_testFreezeReflectSetNested();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_18500
     * @tc.name Object7Test185
     * @tc.desc test freeze array with uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn185_testFreezeArrayWithUint32();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_18700
     * @tc.name Object7Test187
     * @tc.desc test freeze is frozen child
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn187_testFreezeIsFrozenChild();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_18900
     * @tc.name Object7Test189
     * @tc.desc test freeze array with int32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn189_testFreezeArrayWithInt32();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_19100
     * @tc.name Object7Test191
     * @tc.desc test freeze reflect delete child
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn191_testFreezeReflectDeleteChild();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_19200
     * @tc.name Object7Test192
     * @tc.desc test freeze array some child
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn192_testFreezeArraySomeChild();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_19300
     * @tc.name Object7Test193
     * @tc.desc test freeze array with float64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn193_testFreezeArrayWithFloat64();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_19500
     * @tc.name Object7Test195
     * @tc.desc test freeze object keys child
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn195_testFreezeObjectKeysChild();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_19600
     * @tc.name Object7Test196
     * @tc.desc test freeze array every child
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn196_testFreezeArrayEveryChild();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_19700
     * @tc.name Object7Test197
     * @tc.desc test freeze array with big int64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn197_testFreezeArrayWithBigInt64();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_19900
     * @tc.name Object7Test199
     * @tc.desc test freeze reflect get child
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn199_testFreezeReflectGetChild();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_Object7_TEST_20000
     * @tc.name Object7Test200
     * @tc.desc test freeze array flat child
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('Object7Test200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn200_testFreezeArrayFlatChild();
      expect(result).assertEqual(true);
    });
  })
}