'use static';

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
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from "@ohos/hypium-static/src/main/indexStatic";
import Utils from "../Util.test";
import { Decimal } from "@kit.ArkTS";

export default function decimalToExponentialPart03Test(): void {
  describe("DecimalToExponentialPart03Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART03_0100
     * @tc.name decimalToExponentialPart03Test001
     * @tc.desc Verify toExponential(1, Decimal.ROUND_HALF_UP) on new Decimal("1.23e+4") returns 1.2e+4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart03Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("1.23e+4").toExponential(1, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("1.2e+4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART03_0200
     * @tc.name decimalToExponentialPart03Test002
     * @tc.desc Verify toExponential(2, Decimal.ROUND_HALF_UP) on new Decimal("0123") returns 1.23e+2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart03Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new Decimal("0123").toExponential(2, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("1.23e+2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART03_0300
     * @tc.name decimalToExponentialPart03Test003
     * @tc.desc Verify toExponential(2, Decimal.ROUND_UP) on new Decimal(1234.5) returns 1.24e+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart03Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_DOWN });
      let s: string = new Decimal(1234.5).toExponential(2, Decimal.ROUND_UP);
      expect(s).assertEqual("1.24e+3");
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART03_0400
     * @tc.name decimalToExponentialPart03Test004
     * @tc.desc Verify toExponential(3, Decimal.ROUND_HALF_UP) on new Decimal(1234.5) returns 1.235e+3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart03Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ precision: 2 });
      let s: string = new Decimal(1234.5).toExponential(3, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("1.235e+3");
      Decimal.set({ defaults: true });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECIMAL_TO_EXPONENTIAL_PART03_0500
     * @tc.name decimalToExponentialPart03Test005
     * @tc.desc Verify toExponential(0, Decimal.ROUND_HALF_UP) on new Decimal(2.5) returns 3e+0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("decimalToExponentialPart03Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      Decimal.set({ rounding: Decimal.ROUND_HALF_EVEN });
      let s: string = new Decimal(2.5).toExponential(0, Decimal.ROUND_HALF_UP);
      expect(s).assertEqual("3e+0");
      Decimal.set({ defaults: true });
    });
  });
}