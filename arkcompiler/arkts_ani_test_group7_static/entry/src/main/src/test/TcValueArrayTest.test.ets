'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import { Foo } from '../ets/Index';
let loadOk = true;
let loadMessage = '';
export default function TcValueArrayTest(): void {
  describe("TcValueArrayTest", (): void => {
    try {
      loadLibrary("entry");
    } catch (e) {
      loadOk = false;
      loadMessage = e.message;
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number SUB_TC_VALUEARRAY_TEST_0200
     * @tc.name testTcValueArray0002
     * @tc.desc Verify that different primitive ValueArray types can be created and accessed with matching APIs.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcValueArray0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_ValueArrayDifferentTypes()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_VALUEARRAY_TEST_0300
     * @tc.name testTcValueArray0003
     * @tc.desc Verify behavior when ValueArray<int> is forcibly passed to an API expecting ValueArray<double>.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcValueArray0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_ValueArrayTypeMismatch()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_VALUEARRAY_TEST_0500
     * @tc.name testTcValueArray0005
     * @tc.desc Verify that ValueArray_GetRegion can read a partial region correctly.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcValueArray0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_ValueArrayGetPartialRegion()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_VALUEARRAY_TEST_0600
     * @tc.name testTcValueArray0006
     * @tc.desc Verify that ValueArray_SetRegion writes a partial region without modifying other regions.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcValueArray0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_ValueArraySetPartialRegion()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_VALUEARRAY_TEST_0700
     * @tc.name testTcValueArray0007
     * @tc.desc Verify that ValueArray region APIs return an error when offset plus length is out of range.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcValueArray0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_ValueArrayRegionOutOfRange()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_VALUEARRAY_TEST_0900
     * @tc.name testTcValueArray0009
     * @tc.desc Verify that ValueArray_GetLength returns the correct fixed size.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcValueArray0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_ValueArrayGetSize()).assertEqual(7);
    });

    /**
     * @tc.number SUB_TC_VALUEARRAY_TEST_1000
     * @tc.name testTcValueArray0010
     * @tc.desc Verify element-level ValueArray access simulated by one-element regions.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcValueArray0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_ValueArrayElementAccess()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_VALUEARRAY_TEST_1400
     * @tc.name testTcValueArray0014
     * @tc.desc Verify large ValueArray creation and partial verification.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcValueArray0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_ValueArrayLargeArray(1000000)).assertTrue();
    });

    /**
     * @tc.number SUB_TC_VALUEARRAY_TEST_1600
     * @tc.name testTcValueArray0016
     * @tc.desc Verify that ValueArray_GetRegion returns an error when native buffer is null.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcValueArray0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_ValueArrayGetRegionNullBuffer()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_VALUEARRAY_TEST_1700
     * @tc.name testTcValueArray0017
     * @tc.desc Verify that ValueArray_SetRegion returns an error when source buffer is null.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcValueArray0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_ValueArraySetRegionNullBuffer()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_VALUEARRAY_TEST_1800
     * @tc.name testTcValueArray0018
     * @tc.desc Verify behavior when a mismatched ValueArray region API is used intentionally.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcValueArray0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_ValueArrayWrongRegionApi()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_VALUEARRAY_TEST_2000
     * @tc.name testTcValueArray0020
     * @tc.desc Verify ValueArray local reference invalid lifetime and global reference persistent lifetime.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcValueArray0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_ValueArraySaveLocalRef()).assertTrue();
      cls.test_ValueArrayUseSavedLocalRef();
      expect(cls.test_ValueArraySaveGlobalRef()).assertTrue();
      expect(cls.test_ValueArrayUseGlobalRef()).assertTrue();
      expect(cls.test_ValueArrayDeleteGlobalRef()).assertTrue();
    });
  });
}
