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
import BigIntConstructorNoArgTest from './BigIntConstructorNoArgTest.test';
import BigIntConstructorIntegralTest from './BigIntConstructorIntegralTest.test';
import BigIntConstructorDoubleTest from './BigIntConstructorDoubleTest.test';
import BigIntConstructorStringTest from './BigIntConstructorStringTest.test';
import BigIntConstructorBooleanTest from './BigIntConstructorBooleanTest.test';
import BigIntConstructorCopyTest from './BigIntConstructorCopyTest.test';
import BigIntAsUintNTest from './BigIntAsUintNTest.test';
import BigIntAsIntNTest from './BigIntAsIntNTest.test';
import BigIntPerformanceTest from './BigIntPerformanceTest.test';
import BigIntPerformanceLargeIntegerTest from './BigIntPerformanceLargeIntegerTest.test';
import BigIntPerformanceBatchCompareTest from './BigIntPerformanceBatchCompareTest.test';
import BigIntBoundaryValuesTest from './BigIntBoundaryValuesTest.test';

export default function runBigIntHypiumTests(): void {
  BigIntConstructorNoArgTest();
  BigIntConstructorIntegralTest();
  BigIntConstructorDoubleTest();
  BigIntConstructorStringTest();
  BigIntConstructorBooleanTest();
  BigIntConstructorCopyTest();
  BigIntAsUintNTest();
  BigIntAsIntNTest();
  BigIntBoundaryValuesTest();
  BigIntPerformanceTest();
  BigIntPerformanceLargeIntegerTest();
  BigIntPerformanceBatchCompareTest();
}
