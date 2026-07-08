'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium-binary/src/main/indexStatic";
import { Foo } from '../ets/Index';
let loadOk = true;
let loadMessage = '';
export default function TcFixedArrayTest(): void {
  describe("TcFixedArrayTest", (): void => {
    try {
      loadLibrary("entry");
    } catch (e) {
      loadOk = false;
      loadMessage = e.message;
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number SUB_TC_FIXEDARRAY_TEST_0200
     * @tc.name testTcFixedArray0002
     * @tc.desc Verify that different FixedArray element types can be created and accessed with matching APIs.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcFixedArray0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_FixedArrayDifferentTypes()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_FIXEDARRAY_TEST_0300
     * @tc.name testTcFixedArray0003
     * @tc.desc Verify behavior when FixedArray<int> is forcibly passed to an API expecting FixedArray<double>.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcFixedArray0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_FixedArrayTypeMismatch()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_FIXEDARRAY_TEST_0400
     * @tc.name testTcFixedArray0004
     * @tc.desc Verify that FixedArray<string> can be created and accessed with reference APIs.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcFixedArray0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let array = cls.test_FixedArrayRefString();
      expect(cls.test_CheckFixedArrayRefString(array)).assertTrue();
    });

    /**
     * @tc.number SUB_TC_FIXEDARRAY_TEST_0500
     * @tc.name testTcFixedArray0005
     * @tc.desc Verify that FixedArray_GetRegion can read a partial region correctly.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcFixedArray0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_FixedArrayGetPartialRegion()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_FIXEDARRAY_TEST_0600
     * @tc.name testTcFixedArray0006
     * @tc.desc Verify that FixedArray_SetRegion writes a partial region without modifying other regions.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcFixedArray0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_FixedArraySetPartialRegion()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_FIXEDARRAY_TEST_0700
     * @tc.name testTcFixedArray0007
     * @tc.desc Verify that FixedArray region APIs return an error when offset plus length is out of range.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcFixedArray0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_FixedArrayRegionOutOfRange()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_FIXEDARRAY_TEST_0900
     * @tc.name testTcFixedArray0009
     * @tc.desc Verify that FixedArray_GetLength returns the correct fixed size.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcFixedArray0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_FixedArrayGetSize()).assertEqual(7);
    });

    /**
     * @tc.number SUB_TC_FIXEDARRAY_TEST_1000
     * @tc.name testTcFixedArray0010
     * @tc.desc Verify element-level FixedArray access simulated by one-element regions.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcFixedArray0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_FixedArrayElementAccess()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_FIXEDARRAY_TEST_1300
     * @tc.name testTcFixedArray0013
     * @tc.desc Verify that FixedArray<object> can store different reference objects.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcFixedArray0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let array = cls.test_FixedArrayObjectRefs();
      expect(cls.test_CheckFixedArrayObjectRefs(array)).assertTrue();
    });

    /**
     * @tc.number SUB_TC_FIXEDARRAY_TEST_1400
     * @tc.name testTcFixedArray0014
     * @tc.desc Verify large FixedArray creation and partial verification.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcFixedArray0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_FixedArrayLargeArray(1000000)).assertTrue();
    });

    /**
     * @tc.number SUB_TC_FIXEDARRAY_TEST_1600
     * @tc.name testTcFixedArray0016
     * @tc.desc Verify that FixedArray_GetRegion returns an error when native buffer is null.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcFixedArray0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_FixedArrayGetRegionNullBuffer()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_FIXEDARRAY_TEST_1700
     * @tc.name testTcFixedArray0017
     * @tc.desc Verify that FixedArray_SetRegion returns an error when source buffer is null.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcFixedArray0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_FixedArraySetRegionNullBuffer()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_FIXEDARRAY_TEST_1800
     * @tc.name testTcFixedArray0018
     * @tc.desc Verify behavior when a mismatched FixedArray region API is used intentionally.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcFixedArray0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_FixedArrayWrongRegionApi()).assertTrue();
    });

    /**
     * @tc.number SUB_TC_FIXEDARRAY_TEST_2000
     * @tc.name testTcFixedArray0020
     * @tc.desc Verify FixedArray local reference invalid lifetime and global reference persistent lifetime.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcFixedArray0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_FixedArraySaveLocalRef()).assertTrue();
      cls.test_FixedArrayUseSavedLocalRef();
      expect(cls.test_FixedArraySaveGlobalRef()).assertTrue();
      expect(cls.test_FixedArrayUseGlobalRef()).assertTrue();
      expect(cls.test_FixedArrayDeleteGlobalRef()).assertTrue();
    });
  });
}
