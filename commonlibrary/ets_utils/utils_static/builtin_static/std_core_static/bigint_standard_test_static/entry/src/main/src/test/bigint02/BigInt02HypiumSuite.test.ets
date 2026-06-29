'use static'
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
/*
 * Hypium: BigInt mind-map test suite entry (entry/src/main/src/test/bigint02)
 * Mind-map directory: bigint/ (repository root)
 */
import BigIntOperatorMultiplyTest from './BigIntOperatorMultiplyTest.test';
import BigIntOperatorSubtractTest from './BigIntOperatorSubtractTest.test';
import BigIntOperatorDivideTest from './BigIntOperatorDivideTest.test';
import BigIntOperatorModuleTest from './BigIntOperatorModuleTest.test';
import BigIntOperatorGreaterThanTest from './BigIntOperatorGreaterThanTest.test';
import BigIntOperatorLessThanTest from './BigIntOperatorLessThanTest.test';
import BigIntOperatorGreaterThanEqualTest from './BigIntOperatorGreaterThanEqualTest.test';
import BigIntOperatorLessThanEqualTest from './BigIntOperatorLessThanEqualTest.test';
import BigIntOperatorLeftShiftTest from './BigIntOperatorLeftShiftTest.test';
import BigIntOperatorRightShiftTest from './BigIntOperatorRightShiftTest.test';
import BigIntOperatorIncrementTest from './BigIntOperatorIncrementTest.test';
import BigIntOperatorDecrementTest from './BigIntOperatorDecrementTest.test';
import BigIntPowTest from './BigIntPowTest.test';
import BigIntPositiveTest from './BigIntPositiveTest.test';
import BigIntValueOfTest from './BigIntValueOfTest.test';
import BigIntToString1Test from './BigIntToString1Test.test';
import BigIntToString2Test from './BigIntToString2Test.test';
import BigIntToString3Test from './BigIntToString3Test.test';
import BigIntToLocaleString1Test from './BigIntToLocaleString1Test.test';
import BigIntToLocaleString2Test from './BigIntToLocaleString2Test.test';
import BigIntToLocaleStringOptionsPropsTest from './BigIntToLocaleStringOptionsPropsTest.test';
import BigIntToLocaleStringOptionsIfaceTest from './BigIntToLocaleStringOptionsIfaceTest.test';
import BigIntTypeAliasTest from './BigIntTypeAliasTest.test';

import BigIntOperatorDecrement2Test from './BigIntOperatorDecrement2Test.test';
import BigIntOperatorDivide2Test from './BigIntOperatorDivide2Test.test';
import BigIntOperatorGreaterThan2Test from './BigIntOperatorGreaterThan2Test.test';
import BigIntOperatorGreaterThanEqual2Test from './BigIntOperatorGreaterThanEqual2Test.test';
import BigIntOperatorIncrement2Test from './BigIntOperatorIncrement2Test.test';
import BigIntOperatorLeftShift2Test from './BigIntOperatorLeftShift2Test.test';
import BigIntOperatorLessThan2Test from './BigIntOperatorLessThan2Test.test';


export default function runBigInt02HypiumTests(): void {
  BigIntOperatorMultiplyTest();
  BigIntOperatorSubtractTest();
  BigIntOperatorDivideTest();
  BigIntOperatorModuleTest();
  BigIntOperatorGreaterThanTest();
  BigIntOperatorLessThanTest();
  BigIntOperatorGreaterThanEqualTest();
  BigIntOperatorLessThanEqualTest();
  BigIntOperatorLeftShiftTest();
  BigIntOperatorRightShiftTest();
  BigIntOperatorIncrementTest();
  BigIntOperatorDecrementTest();
  BigIntPowTest();
  BigIntPositiveTest();
  BigIntValueOfTest();
  BigIntToString1Test();
  BigIntToString2Test();
  BigIntToString3Test();
  BigIntToLocaleString1Test();
  BigIntToLocaleString2Test();
  BigIntToLocaleStringOptionsPropsTest();
  BigIntToLocaleStringOptionsIfaceTest();
  BigIntTypeAliasTest();

  BigIntOperatorDecrement2Test();
  BigIntOperatorDivide2Test();
  BigIntOperatorGreaterThan2Test();
  BigIntOperatorGreaterThanEqual2Test();


}
