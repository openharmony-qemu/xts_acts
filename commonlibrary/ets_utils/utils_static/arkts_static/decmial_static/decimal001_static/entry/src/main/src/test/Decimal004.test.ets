/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../hypium/index';
import { Decimal, Deque } from '@kit.ArkTS';
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';


function test_tanh_001(n: string, pr: number, rm: number, expected: string) {
  Decimal.set({ precision: pr, rounding: rm });
  expect(expected).assertEqual(Decimal.tanh(n).valueOf());
  expect(expected).assertEqual(new Decimal(n).tanh().valueOf());
}


export default function DecimalTest004() {
  describe("DecimalTest004", () => {
    beforeAll(() => {
      console.info("beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.");
    });
    beforeEach(async () => {
      await Utils.msSleep(200)
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
     * @tc.number    : DECIMAL_TEST_001
     * @tc.name      : Decimal_tanh_Func_001
     * @tc.desc      : Test tanh
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("Decimal_tanh_Func_001", 0, () => {
    });


  });
}