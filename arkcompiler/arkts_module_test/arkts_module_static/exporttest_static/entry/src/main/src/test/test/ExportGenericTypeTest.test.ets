'use static'
/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the License);
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an AS IS BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import { ConstraintBox, GenericDefaultBox, identity, convertToNumber, Container } from '../exports_generic/GenericExport';
import DefaultBox from '../exports_generic/GenericExport';
import { sleep } from '../utils/Utils';

export default function exportGenericTypeTest(): void {
  describe('ExportGenericTypeTest', () => {
    beforeAll(() => {})
    beforeEach(async () => {
      await sleep(100);
    })
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.name   exportGenericTypeTest0100
     * @tc.number SUB_EXPORT_GENERIC_TYPE_TEST_0100
     * @tc.desc   Test generic class with number constraint
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('exportGenericTypeTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      let box: ConstraintBox<number> = new ConstraintBox<number>(10);
      expect(10).assertEqual(box.getValue());
    })

    /**
     * @tc.name   exportGenericTypeTest0200
     * @tc.number SUB_EXPORT_GENERIC_TYPE_TEST_0200
     * @tc.desc   Test generic class with float value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportGenericTypeTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      let box: ConstraintBox<number> = new ConstraintBox<number>(3.14);
      expect(3.14).assertEqual(box.getValue());
    })

    /**
     * @tc.name   exportGenericTypeTest0300
     * @tc.number SUB_EXPORT_GENERIC_TYPE_TEST_0300
     * @tc.desc   Test generic default type parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportGenericTypeTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      let box: GenericDefaultBox = new GenericDefaultBox();
      expect('GenericDefaultBox').assertEqual(box.name);
      expect(1).assertEqual(box.getValue());
    })

    /**
     * @tc.name   exportGenericTypeTest0400
     * @tc.number SUB_EXPORT_GENERIC_TYPE_TEST_0400
     * @tc.desc   Test default export generic class
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportGenericTypeTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      let box: DefaultBox = new DefaultBox();
      expect(1).assertEqual(box.getValue());
      box.setValue(99);
      expect(99).assertEqual(box.getValue());
    })

    /**
     * @tc.name   exportGenericTypeTest0500
     * @tc.number SUB_EXPORT_GENERIC_TYPE_TEST_0500
     * @tc.desc   Test identity function with number
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportGenericTypeTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      let result: int = identity(42);
      expect(42).assertEqual(result);
    })

    /**
     * @tc.name   exportGenericTypeTest0600
     * @tc.number SUB_EXPORT_GENERIC_TYPE_TEST_0600
     * @tc.desc   Test identity function with string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportGenericTypeTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      let result: string = identity('hello');
      expect('hello').assertEqual(result);
    })

    /**
     * @tc.name   exportGenericTypeTest0700
     * @tc.number SUB_EXPORT_GENERIC_TYPE_TEST_0700
     * @tc.desc   Test convertToNumber with constrained generic
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportGenericTypeTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      let result: number = convertToNumber(7);
      expect(7).assertEqual(result);
    })

    it('exportGenericTypeTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      let impl: Container<int> = {
        getContent(): int { return 10 },
        setContent(v: int): void {}
      };
      expect(10).assertEqual(impl.getContent());
    })
  })
}
