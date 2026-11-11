'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium-static/src/main/indexStatic";
import { Foo } from '../ets/Index'

export default function tupleOperationsTest(): void {

  describe("ActsTupleOperationsTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    // ==================== NORM (21) ====================
    /**
     * @tc.name test_Tuple_Norm_0001
     * @tc.number SUB_ANI_TUPLE_NORM_0100
     * @tc.desc   Verify TupleValue_GetNumberOfItems returns correct size
     */
    it("test_Tuple_Norm_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Norm_0001()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Norm_0002
     * @tc.number SUB_ANI_TUPLE_NORM_0200
     * @tc.desc   Verify TupleValue_GetItem_Boolean returns correct value
     */
    it("test_Tuple_Norm_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Norm_0002()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Norm_0003
     * @tc.number SUB_ANI_TUPLE_NORM_0300
     * @tc.desc   Verify TupleValue_GetItem_Int returns correct value
     */
    it("test_Tuple_Norm_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Norm_0003()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Norm_0004
     * @tc.number SUB_ANI_TUPLE_NORM_0400
     * @tc.desc   Verify TupleValue_GetItem_Double returns correct value
     */
    it("test_Tuple_Norm_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Norm_0004()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Norm_0005
     * @tc.number SUB_ANI_TUPLE_NORM_0500
     * @tc.desc   Verify TupleValue_GetItem_Ref returns correct reference
     */
    it("test_Tuple_Norm_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Norm_0005()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Norm_0006
     * @tc.number SUB_ANI_TUPLE_NORM_0600
     * @tc.desc   Verify TupleValue_GetItem_Byte returns correct value
     */
    it("test_Tuple_Norm_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Norm_0006()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Norm_0007
     * @tc.number SUB_ANI_TUPLE_NORM_0700
     * @tc.desc   Verify TupleValue_GetItem_Short returns correct value
     */
    it("test_Tuple_Norm_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Norm_0007()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Norm_0008
     * @tc.number SUB_ANI_TUPLE_NORM_0800
     * @tc.desc   Verify TupleValue_GetItem_Long returns correct value
     */
    it("test_Tuple_Norm_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Norm_0008()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Norm_0009
     * @tc.number SUB_ANI_TUPLE_NORM_0900
     * @tc.desc   Verify TupleValue_GetItem_Float returns correct value
     */
    it("test_Tuple_Norm_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Norm_0009()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Norm_0010
     * @tc.number SUB_ANI_TUPLE_NORM_1000
     * @tc.desc   Verify TupleValue_GetItem_Char type mismatch returns error
     */
    it("test_Tuple_Norm_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Norm_0010()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Norm_0011
     * @tc.number SUB_ANI_TUPLE_NORM_1100
     * @tc.desc   Verify TupleValue_SetItem_Boolean and GetItem_Boolean roundtrip
     */
    it("test_Tuple_Norm_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Norm_0011()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Norm_0012
     * @tc.number SUB_ANI_TUPLE_NORM_1200
     * @tc.desc   Verify TupleValue_SetItem_Int and GetItem_Int roundtrip
     */
    it("test_Tuple_Norm_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Norm_0012()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Norm_0013
     * @tc.number SUB_ANI_TUPLE_NORM_1300
     * @tc.desc   Verify TupleValue_SetItem_Double and GetItem_Double roundtrip
     */
    it("test_Tuple_Norm_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Norm_0013()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Norm_0014
     * @tc.number SUB_ANI_TUPLE_NORM_1400
     * @tc.desc   Verify TupleValue_SetItem_Ref and GetItem_Ref roundtrip
     */
    it("test_Tuple_Norm_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Norm_0014()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Norm_0015
     * @tc.number SUB_ANI_TUPLE_NORM_1500
     * @tc.desc   Verify TupleValue_SetItem_Byte and GetItem_Byte roundtrip
     */
    it("test_Tuple_Norm_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Norm_0015()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Norm_0016
     * @tc.number SUB_ANI_TUPLE_NORM_1600
     * @tc.desc   Verify TupleValue_SetItem_Short and GetItem_Short roundtrip
     */
    it("test_Tuple_Norm_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Norm_0016()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Norm_0017
     * @tc.number SUB_ANI_TUPLE_NORM_1700
     * @tc.desc   Verify TupleValue_SetItem_Long and GetItem_Long roundtrip
     */
    it("test_Tuple_Norm_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Norm_0017()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Norm_0018
     * @tc.number SUB_ANI_TUPLE_NORM_1800
     * @tc.desc   Verify TupleValue_SetItem_Float and GetItem_Float roundtrip
     */
    it("test_Tuple_Norm_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Norm_0018()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Norm_0019
     * @tc.number SUB_ANI_TUPLE_NORM_1900
     * @tc.desc   Verify TupleValue_SetItem_Char type mismatch returns error
     */
    it("test_Tuple_Norm_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Norm_0019()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Norm_0020
     * @tc.number SUB_ANI_TUPLE_NORM_2000
     * @tc.desc   Verify multiple GetItem_Int calls return consistent values
     */
    it("test_Tuple_Norm_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Norm_0020()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Norm_0021
     * @tc.number SUB_ANI_TUPLE_NORM_2100
     * @tc.desc   Verify c_api TupleValue_GetNumberOfItems returns correct size
     */
    it("test_Tuple_Norm_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Norm_0021()).assertTrue(); done();
    })

    // ==================== ABNM (12) ====================
    /**
     * @tc.name test_Tuple_Abnm_0001
     * @tc.number SUB_ANI_TUPLE_ABNM_0100
     * @tc.desc   Verify GetNumberOfItems with nullptr tuple returns invalid args
     */
    it("test_Tuple_Abnm_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Abnm_0001()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Abnm_0002
     * @tc.number SUB_ANI_TUPLE_ABNM_0200
     * @tc.desc   Verify GetNumberOfItems with nullptr result returns invalid args
     */
    it("test_Tuple_Abnm_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Abnm_0002()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Abnm_0003
     * @tc.number SUB_ANI_TUPLE_ABNM_0300
     * @tc.desc   Verify c_api GetNumberOfItems with nullptr env returns invalid args
     */
    it("test_Tuple_Abnm_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Abnm_0003()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Abnm_0004
     * @tc.number SUB_ANI_TUPLE_ABNM_0400
     * @tc.desc   Verify GetItem_Int with out of bounds index returns error
     */
    it("test_Tuple_Abnm_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Abnm_0004()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Abnm_0005
     * @tc.number SUB_ANI_TUPLE_ABNM_0500
     * @tc.desc   Verify GetItem_Int with nullptr result returns invalid args
     */
    it("test_Tuple_Abnm_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Abnm_0005()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Abnm_0006
     * @tc.number SUB_ANI_TUPLE_ABNM_0600
     * @tc.desc   Verify GetItem_Ref with nullptr tuple returns invalid args
     */
    it("test_Tuple_Abnm_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Abnm_0006()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Abnm_0007
     * @tc.number SUB_ANI_TUPLE_ABNM_0700
     * @tc.desc   Verify SetItem_Int with out of bounds index returns error
     */
    it("test_Tuple_Abnm_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Abnm_0007()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Abnm_0008
     * @tc.number SUB_ANI_TUPLE_ABNM_0800
     * @tc.desc   Verify SetItem_Ref with nullptr tuple returns invalid args
     */
    it("test_Tuple_Abnm_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Abnm_0008()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Abnm_0009
     * @tc.number SUB_ANI_TUPLE_ABNM_0900
     * @tc.desc   Verify GetItem_Boolean on int tuple returns type mismatch
     */
    it("test_Tuple_Abnm_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Abnm_0009()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Abnm_0010
     * @tc.number SUB_ANI_TUPLE_ABNM_1000
     * @tc.desc   Verify GetItem_Int on boolean tuple returns type mismatch
     */
    it("test_Tuple_Abnm_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Abnm_0010()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Abnm_0011
     * @tc.number SUB_ANI_TUPLE_ABNM_1100
     * @tc.desc   Verify SetItem_Boolean on int tuple returns type mismatch
     */
    it("test_Tuple_Abnm_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Abnm_0011()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Abnm_0012
     * @tc.number SUB_ANI_TUPLE_ABNM_1200
     * @tc.desc   Verify c_api GetNumberOfItems with all nullptr returns invalid args
     */
    it("test_Tuple_Abnm_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Abnm_0012()).assertTrue(); done();
    })

    // ==================== FUNC (8) ====================
    /**
     * @tc.name test_Tuple_Func_0001
     * @tc.number SUB_ANI_TUPLE_FUNC_0100
     * @tc.desc   Verify GetNumberOfItems returns correct size for mixed tuple
     */
    it("test_Tuple_Func_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Func_0001()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Func_0002
     * @tc.number SUB_ANI_TUPLE_FUNC_0200
     * @tc.desc   Verify GetItem_Int returns correct value at index 0
     */
    it("test_Tuple_Func_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Func_0002()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Func_0003
     * @tc.number SUB_ANI_TUPLE_FUNC_0300
     * @tc.desc   Verify SetItem_Int and GetItem_Int roundtrip on settable tuple
     */
    it("test_Tuple_Func_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Func_0003()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Func_0004
     * @tc.number SUB_ANI_TUPLE_FUNC_0400
     * @tc.desc   Verify GetItem_Ref returns correct string reference
     */
    it("test_Tuple_Func_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Func_0004()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Func_0005
     * @tc.number SUB_ANI_TUPLE_FUNC_0500
     * @tc.desc   Verify SetItem_Ref and GetItem_Ref roundtrip with new string
     */
    it("test_Tuple_Func_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Func_0005()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Func_0006
     * @tc.number SUB_ANI_TUPLE_FUNC_0600
     * @tc.desc   Verify all primitive type SetItem and GetItem operations
     */
    it("test_Tuple_Func_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Func_0006()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Func_0007
     * @tc.number SUB_ANI_TUPLE_FUNC_0700
     * @tc.desc   Verify multiple GetItem_Int calls return consistent values
     */
    it("test_Tuple_Func_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Func_0007()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Func_0008
     * @tc.number SUB_ANI_TUPLE_FUNC_0800
     * @tc.desc   Verify c_api and env GetNumberOfItems return consistent results
     */
    it("test_Tuple_Func_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Func_0008()).assertTrue(); done();
    })

    // ==================== RETV (4) ====================
    /**
     * @tc.name test_Tuple_Retv_0001
     * @tc.number SUB_ANI_TUPLE_RETV_0100
     * @tc.desc   Verify GetNumberOfItems returns ANI_OK and nonzero size
     */
    it("test_Tuple_Retv_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Retv_0001()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Retv_0002
     * @tc.number SUB_ANI_TUPLE_RETV_0200
     * @tc.desc   Verify GetItem for multiple types returns ANI_OK
     */
    it("test_Tuple_Retv_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Retv_0002()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Retv_0003
     * @tc.number SUB_ANI_TUPLE_RETV_0300
     * @tc.desc   Verify GetItem_Ref returns ANI_OK and non-null reference
     */
    it("test_Tuple_Retv_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Retv_0003()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Retv_0004
     * @tc.number SUB_ANI_TUPLE_RETV_0400
     * @tc.desc   Verify GetNumberOfItems with nullptr tuple returns invalid args
     */
    it("test_Tuple_Retv_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Retv_0004()).assertTrue(); done();
    })

    // ==================== ERCD (5) ====================
    /**
     * @tc.name test_Tuple_Ercd_0001
     * @tc.number SUB_ANI_TUPLE_ERCD_0100
     * @tc.desc   Verify GetNumberOfItems error codes for nullptr parameters
     */
    it("test_Tuple_Ercd_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Ercd_0001()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Ercd_0002
     * @tc.number SUB_ANI_TUPLE_ERCD_0200
     * @tc.desc   Verify GetItem_Int and SetItem_Int error codes for out of bounds
     */
    it("test_Tuple_Ercd_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Ercd_0002()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Ercd_0003
     * @tc.number SUB_ANI_TUPLE_ERCD_0300
     * @tc.desc   Verify type mismatch error codes for Get and Set operations
     */
    it("test_Tuple_Ercd_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Ercd_0003()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Ercd_0004
     * @tc.number SUB_ANI_TUPLE_ERCD_0400
     * @tc.desc   Verify c_api GetNumberOfItems with nullptr returns invalid args
     */
    it("test_Tuple_Ercd_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Ercd_0004()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Ercd_0005
     * @tc.number SUB_ANI_TUPLE_ERCD_0500
     * @tc.desc   Verify combined error scenarios for Get and type mismatch
     */
    it("test_Tuple_Ercd_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Ercd_0005()).assertTrue(); done();
    })

    // ==================== COMB (5) ====================
    /**
     * @tc.name test_Tuple_Comb_0001
     * @tc.number SUB_ANI_TUPLE_COMB_0100
     * @tc.desc   Verify combination of GetNumberOfItems and multiple GetItem types
     */
    it("test_Tuple_Comb_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Comb_0001()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Comb_0002
     * @tc.number SUB_ANI_TUPLE_COMB_0200
     * @tc.desc   Verify combination of multiple SetItem and GetItem_Int operations
     */
    it("test_Tuple_Comb_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Comb_0002()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Comb_0003
     * @tc.number SUB_ANI_TUPLE_COMB_0300
     * @tc.desc   Verify set-get-restore-get sequence preserves original value
     */
    it("test_Tuple_Comb_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Comb_0003()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Comb_0004
     * @tc.number SUB_ANI_TUPLE_COMB_0400
     * @tc.desc   Verify combination of GetNumberOfItems and GetItem_Int
     */
    it("test_Tuple_Comb_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Comb_0004()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Comb_0005
     * @tc.number SUB_ANI_TUPLE_COMB_0500
     * @tc.desc   Verify cross-tuple GetItem operations on different tuple types
     */
    it("test_Tuple_Comb_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Comb_0005()).assertTrue(); done();
    })

    // ==================== STAB (3) ====================
    /**
     * @tc.name test_Tuple_Stab_0001
     * @tc.number SUB_ANI_TUPLE_STAB_0100
     * @tc.desc   Verify GetNumberOfItems stability over 1000 iterations
     */
    it("test_Tuple_Stab_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Stab_0001()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Stab_0002
     * @tc.number SUB_ANI_TUPLE_STAB_0200
     * @tc.desc   Verify SetItem and GetItem stability over 1000 iterations
     */
    it("test_Tuple_Stab_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Stab_0002()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Stab_0003
     * @tc.number SUB_ANI_TUPLE_STAB_0300
     * @tc.desc   Verify multiple GetItem stability over 1000 iterations
     */
    it("test_Tuple_Stab_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Stab_0003()).assertTrue(); done();
    })

    // ==================== THRD (3) ====================
    /**
     * @tc.name test_Tuple_Thrd_0001
     * @tc.number SUB_ANI_TUPLE_THRD_0100
     * @tc.desc   Verify GetNumberOfItems in single attached thread
     */
    it("test_Tuple_Thrd_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Thrd_0001()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Thrd_0002
     * @tc.number SUB_ANI_TUPLE_THRD_0200
     * @tc.desc   Verify concurrent GetItem_Int in multiple threads
     */
    it("test_Tuple_Thrd_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Thrd_0002()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Thrd_0003
     * @tc.number SUB_ANI_TUPLE_THRD_0300
     * @tc.desc   Verify concurrent SetItem_Int in multiple threads
     */
    it("test_Tuple_Thrd_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Thrd_0003()).assertTrue(); done();
    })

    // ==================== MEML (3) ====================
    /**
     * @tc.name test_Tuple_Meml_0001
     * @tc.number SUB_ANI_TUPLE_MEML_0100
     * @tc.desc   Verify no reference leak after 100 GetNumberOfItems cycles
     */
    it("test_Tuple_Meml_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Meml_0001()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Meml_0002
     * @tc.number SUB_ANI_TUPLE_MEML_0200
     * @tc.desc   Verify no reference leak after 100 GetItem_Ref cycles
     */
    it("test_Tuple_Meml_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Meml_0002()).assertTrue(); done();
    })
    /**
     * @tc.name test_Tuple_Meml_0003
     * @tc.number SUB_ANI_TUPLE_MEML_0300
     * @tc.desc   Verify local scope management with GetItem_Int
     */
    it("test_Tuple_Meml_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let cls = new Foo(); expect(cls.test_Tuple_Meml_0003()).assertTrue(); done();
    })
  })
}
