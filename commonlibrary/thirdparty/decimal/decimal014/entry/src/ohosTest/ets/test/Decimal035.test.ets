/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file in in compliance with the License.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType} from "@ohos/hypium";
import { Decimal } from '@kit.ArkTS';
type Rounding = 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8;
function test_sqrt_001 (expected: string, n: string, sd: number, rm: Rounding) {
    Decimal.set({ precision: sd, rounding: rm });
    expect(expected).assertEqual(Decimal.sqrt(n).valueOf());
    expect(expected).assertEqual(new Decimal(n).sqrt().valueOf());
}
function test_sqrt_002 (expected: string, n: number, sd: number, rm: Rounding) {
    Decimal.set({ precision: sd, rounding: rm });
    expect(expected).assertEqual(Decimal.sqrt(n).valueOf());
    expect(expected).assertEqual(new Decimal(n).sqrt().valueOf());
}
export default function DecimalTest035() {
  describe("DecimalTest035", () => {
    beforeAll(() => {
        console.info("beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.");
    });
    beforeEach(() => {
        console.info("beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.");
    });
    afterEach(() => {
        console.info("afterEach: Test case-level clearance conditions, which are executed after each test case is executed.");
    });
    afterAll(() => {
        console.info("afterAll: Test suite-level cleanup condition, which is executed after the test suite is executed");
    });
        console.info("start################################start");
    /**
     * @tc.name   Decimal_sqrt_Func_001
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_SQRT_0100
     * @tc.desc   Test sqrt (special values and random loop)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Decimal_sqrt_Func_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        Decimal.set ({
            precision: 20,
            rounding: 4,
            toExpNeg: -9e15,
            toExpPos: 9e15,
            minE: -9e15,
            maxE: 9e15
        });
        test_sqrt_002('NaN', NaN, 20, 4);
        test_sqrt_002('2', 4, 20, 4);
        test_sqrt_002('0.1', 0.01, 20, 4);
        test_sqrt_002('0', 0, 20, 4);
        test_sqrt_002('-0', -0, 20, 4);
        test_sqrt_001('0', '0', 20, 4);
        test_sqrt_001('-0', '-0', 20, 4);
        test_sqrt_002('Infinity', Infinity, 20, 4);
        test_sqrt_002('NaN', -Infinity, 20, 4);
        test_sqrt_002('NaN', -1, 20, 4);
        test_sqrt_002('NaN', -35.999, 20, 4);
        test_sqrt_001('NaN', '-0.00000000000001', 20, 4);
        for (let i = 0; i < 500; i++) {
            let j = Math.floor(Math.random() * Math.pow(2, Math.floor(Math.random() * 26) + 1));
            j *= j;
            test_sqrt_001(Math.sqrt(j).toString(), j.toString(), 20, 4);
        }
        expect(true).assertEqual(true);
    });
    /**
     * @tc.name   Decimal_sqrt_Func_002
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_SQRT_0200
     * @tc.desc   Test sqrt (low precision rounding)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Decimal_sqrt_Func_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
        Decimal.set ({
            precision: 20,
            rounding: 4,
            toExpNeg: -9e15,
            toExpPos: 9e15,
            minE: -9e15,
            maxE: 9e15
        });
        test_sqrt_001('11', '101', 2, 0);
        test_sqrt_001('11', '111', 2, 0);
        test_sqrt_002('1000', 999000.25, 3, 0);
        test_sqrt_001('10', '101', 2, 1);
        test_sqrt_001('10', '111', 2, 1);
        test_sqrt_002('999', 999000.25, 3, 1);
        test_sqrt_001('11', '101', 2, 2);
        test_sqrt_001('11', '111', 2, 2);
        test_sqrt_002('1000', 999000.25, 3, 2);
        test_sqrt_001('10', '101', 2, 3);
        test_sqrt_001('10', '111', 2, 3);
        test_sqrt_002('999', 999000.25, 3, 3);
        test_sqrt_001('10', '101', 2, 4);
        test_sqrt_001('11', '111', 2, 4);
        test_sqrt_002('1000', 999000.25, 3, 4);
        test_sqrt_001('10', '101', 2, 5);
        test_sqrt_001('11', '111', 2, 5);
        test_sqrt_002('999', 999000.25, 3, 5);
        test_sqrt_001('10', '101', 2, 6);
        test_sqrt_001('11', '111', 2, 6);
        test_sqrt_002('1000', 999000.25, 3, 6);
        test_sqrt_001('10', '101', 2, 7);
        test_sqrt_001('11', '111', 2, 7);
        test_sqrt_002('1000', 999000.25, 2, 7);
        test_sqrt_001('10', '101', 2, 8);
        test_sqrt_001('11', '111', 2, 8);
        test_sqrt_002('999', 999000.25, 3, 8);
        test_sqrt_001('3.7', '13.69', 2, 6);
        test_sqrt_001('14.8', '219.04', 3, 6);
        test_sqrt_001('3.578708384438441', '12.80715370085', 16, 6);
        test_sqrt_001('49.56954417823', '2457.139710037', 13, 6);
        test_sqrt_001('4.9808503290100979', '24.80887', 17, 6);
        test_sqrt_001('54108953.7650348268963935650889893674872', '2927778877546676.5690784769302', 39, 6);
        test_sqrt_001('1.0000000000001', '1.000000000000000001402', 14, 2);
        test_sqrt_001('18.000001', '324.0000000000000000000008467', 8, 2);
        test_sqrt_001('11.00000000000000001', '121.000000000000000000000000001944', 19, 0);
        test_sqrt_001('2.00000000000001', '4.0000000000000000000000000000000005485', 15, 0);
        test_sqrt_001('7.1', '49.00000000000000000000007338', 2, 0);
        test_sqrt_001('19.00000000000001', '361.0000000000000000000000005645', 16, 2);
        test_sqrt_001('1.0000001', '1.00000000000000000000000000000006986', 8, 0);
        test_sqrt_001('30771277.0274560007853901874282412', '946871489900441.411712749999999999999999999999999999999999999999', 33, 6);
        test_sqrt_001('668.093253221434649746', '446348.594999999999999999999999999999', 21, 5);
        test_sqrt_001('0.9999999999999999999999999999999999999999', '0.9999999999999999999999999999999999999998', 40, 5);
        test_sqrt_001('0.9999999999999999999997187097975391240474677563824', '0.9999999999999999999994374195950782480949355918890297218761543222489261', 49, 3);
        test_sqrt_001('0.0000000000000298840312673111495324166498096924391126062701', '8.9305532478563043E-28', 45, 5);
        test_sqrt_001('0.0000000000000000000000000000000000000000025385115498645', '6.4440408887956349899441566682289191111111111111111111E-84', 14, 5);
        test_sqrt_001('0.0000000000000000000000000000000000000000000000000000140471526414353053458592377645343274655348630930173397', '1.97322497331782876158645511100784258994087355048761111111111111E-106', 54, 5);
        test_sqrt_001('0.00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002598902022257132166703490111187879281161770014282895', '6.7542917212922111E-232', 52, 5);
        test_sqrt_001('0.00999999999999999999999999999949', '0.00009999999999999999999999999999', 30, 1);
        expect(true).assertEqual(true);
    });
    /**
     * @tc.name   Decimal_sqrt_Func_003
     * @tc.number SUB_COMMONLIBRARY_DECIMAL_SQRT_0300
     * @tc.desc   Test sqrt error handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("Decimal_sqrt_Func_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        Decimal.set ({
            precision: 20,
            rounding: 4,
            toExpNeg: -9e15,
            toExpPos: 9e15,
            minE: -9e15,
            maxE: 9e15
        });
        try {
            test_sqrt_001('e', 'eee', 21, 5);
            expect(true).assertEqual(false);
        } catch (err) {
            expect(err.name).assertEqual(`BusinessError`);
            expect(err.code).assertEqual(401);
            expect(err.message).assertEqual(`The type of "test(str)" must be Hex/Binary/Octal. Received value is: eee`);
        }
    });
  });
}
