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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { collections } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';

export default function TypedArray401Test() {
  describe('TypedArray401Test', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number  SUB_TYPEDARRAY_FIND_ONE_0100
     * @tc.name    testTypedArrayOneFind0001
     * @tc.desc    Verify find with non-function callback throws 401
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('testTypedArrayOneFind0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ta = new collections.Int8Array([1, 2, 3]);
      let threw = false;
      try {
        ta.find('invalid' as Object as (value: number, index: number, array: collections.Int8Array) => boolean);
      } catch (error) {
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.number  SUB_TYPEDARRAY_FINDINDEX_ONE_0200
     * @tc.name    testTypedArrayOneFindIndex0002
     * @tc.desc    Verify findIndex with non-function callback throws 401
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('testTypedArrayOneFindIndex0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ta = new collections.Int8Array([1, 2, 3]);
      let threw = false;
      try {
        ta.findIndex('invalid' as Object as (value: number, index: number, array: collections.Int8Array) => boolean);
      } catch (error) {
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.number  SUB_TYPEDARRAY_MAP_ONE_0300
     * @tc.name    testTypedArrayOneMap0003
     * @tc.desc    Verify map with non-function callback throws 401
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('testTypedArrayOneMap0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ta = new collections.Int8Array([1, 2, 3]);
      let threw = false;
      try {
        ta.map('invalid' as Object as (value: number, index: number, array: collections.Int8Array) => number);
      } catch (error) {
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.number  SUB_TYPEDARRAY_FILTER_ONE_0400
     * @tc.name    testTypedArrayOneFilter0004
     * @tc.desc    Verify filter with non-function callback throws 401
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('testTypedArrayOneFilter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ta = new collections.Int8Array([1, 2, 3]);
      let threw = false;
      try {
        ta.filter('invalid' as Object as (value: number, index: number, array: collections.Int8Array) => boolean);
      } catch (error) {
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.number  SUB_TYPEDARRAY_FOREACH_ONE_0500
     * @tc.name    testTypedArrayOneForEach0005
     * @tc.desc    Verify forEach with non-function callback throws 401
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('testTypedArrayOneForEach0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ta = new collections.Int8Array([1, 2, 3]);
      let threw = false;
      try {
        ta.forEach('invalid' as Object as (value: number, index: number, array: collections.Int8Array) => void);
      } catch (error) {
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.number  SUB_TYPEDARRAY_EVERY_ONE_0600
     * @tc.name    testTypedArrayOneEvery0006
     * @tc.desc    Verify every with non-function callback throws 401
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('testTypedArrayOneEvery0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ta = new collections.Int8Array([1, 2, 3]);
      let threw = false;
      try {
        ta.every('invalid' as Object as (value: number, index: number, array: collections.Int8Array) => boolean);
      } catch (error) {
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.number  SUB_TYPEDARRAY_SOME_ONE_0700
     * @tc.name    testTypedArrayOneSome0007
     * @tc.desc    Verify some with non-function callback throws 401
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('testTypedArrayOneSome0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ta = new collections.Int8Array([1, 2, 3]);
      let threw = false;
      try {
        ta.some('invalid' as Object as (value: number, index: number, array: collections.Int8Array) => boolean);
      } catch (error) {
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.number  SUB_TYPEDARRAY_SET_ONE_0800
     * @tc.name    testTypedArrayOneSet0008
     * @tc.desc    Verify set with non-ArrayLike source throws 401
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('testTypedArrayOneSet0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ta = new collections.Int8Array([1, 2, 3]);
      let threw = false;
      try {
        ta.set('invalid' as Object as ArrayLike<number>);
      } catch (error) {
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.number  SUB_TYPEDARRAY_FILL_ONE_0900
     * @tc.name    testTypedArrayOneFill0009
     * @tc.desc    Verify fill with wrong-typed value throws 401
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('testTypedArrayOneFill0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ta = new collections.Int8Array([1, 2, 3]);
      let result = ta.fill('invalid' as Object as number);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number  SUB_TYPEDARRAY_AT_ONE_1000
     * @tc.name    testTypedArrayOneAt0010
     * @tc.desc    Verify at with wrong-typed index reads element at coerced index (actual)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('testTypedArrayOneAt0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ta = new collections.Int8Array([1, 2, 3]);
      expect(ta.at('invalid' as Object as number)).assertEqual(1);
    });
  })
}
