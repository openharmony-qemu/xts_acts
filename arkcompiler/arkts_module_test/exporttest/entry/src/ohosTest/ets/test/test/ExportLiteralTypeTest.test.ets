/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from "@ohos/hypium";
import { StatusLiteral, NumOrNullish, StrOrNullish } from '../exports_literal/LiteralExport';
import { sleep } from "../utils/Utils";

export default function exportLiteralTypeTest() {
  describe('ExportLiteralTypeTest', () => {
    beforeAll(() => {})
    beforeEach(async () => {
      await sleep(100);
    })
    afterEach(() => {})
    afterAll(() => {})

    /**
     * @tc.name   exportLiteralTypeTest0100
     * @tc.number SUB_EXPORT_LITERAL_TYPE_TEST_0100
     * @tc.desc   Test literal type PENDING value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('exportLiteralTypeTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let status: StatusLiteral = 'PENDING';
      expect('PENDING').assertEqual(status);
    })

    /**
     * @tc.name   exportLiteralTypeTest0200
     * @tc.number SUB_EXPORT_LITERAL_TYPE_TEST_0200
     * @tc.desc   Test literal type SHIPPED value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportLiteralTypeTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let status: StatusLiteral = 'SHIPPED';
      expect('SHIPPED').assertEqual(status);
    })

    /**
     * @tc.name   exportLiteralTypeTest0300
     * @tc.number SUB_EXPORT_LITERAL_TYPE_TEST_0300
     * @tc.desc   Test literal type DELIVERED value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportLiteralTypeTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let status: StatusLiteral = 'DELIVERED';
      expect('DELIVERED').assertEqual(status);
    })

    /**
     * @tc.name   exportLiteralTypeTest0400
     * @tc.number SUB_EXPORT_LITERAL_TYPE_TEST_0400
     * @tc.desc   Test NumOrNullish with number value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportLiteralTypeTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let v: NumOrNullish = 100;
      expect(100).assertEqual(v);
    })

    /**
     * @tc.name   exportLiteralTypeTest0500
     * @tc.number SUB_EXPORT_LITERAL_TYPE_TEST_0500
     * @tc.desc   Test NumOrNullish with null value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportLiteralTypeTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let v: NumOrNullish = null;
      expect(v).assertEqual(null);
    })

    /**
     * @tc.name   exportLiteralTypeTest0600
     * @tc.number SUB_EXPORT_LITERAL_TYPE_TEST_0600
     * @tc.desc   Test StrOrNullish with string value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportLiteralTypeTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let v: StrOrNullish = 'testString';
      expect('testString').assertEqual(v);
    })

    /**
     * @tc.name   exportLiteralTypeTest0700
     * @tc.number SUB_EXPORT_LITERAL_TYPE_TEST_0700
     * @tc.desc   Test StrOrNullish with null value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportLiteralTypeTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let v: StrOrNullish = null;
      expect(v).assertEqual(null);
    })

    /**
     * @tc.name   exportLiteralTypeTest0800
     * @tc.number SUB_EXPORT_LITERAL_TYPE_TEST_0800
     * @tc.desc   Test StrOrNullish with undefined value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('exportLiteralTypeTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let v: StrOrNullish = undefined;
      expect(v).assertEqual(undefined);
    })
  })
}
