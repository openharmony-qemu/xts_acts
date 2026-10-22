'use static';

/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import decimalConstantsTest from './decimal/DecimalConstantsTest.test';
import decimalPowTest from './decimal/DecimalPowTest.test';
import decimalPrecisionTest from './decimal/DecimalPrecisionTest.test';
import decimalPropertiesTest from './decimal/DecimalPropertiesTest.test';
import decimalRandomTest from './decimal/DecimalRandomTest.test';
import decimalRoundTest from './decimal/DecimalRoundTest.test';
import decimalSetTest from './decimal/DecimalSetTest.test';
import decimalSignTest from './decimal/DecimalSignTest.test';
import decimalSinTest from './decimal/DecimalSinTest.test';
import decimalSinhTest from './decimal/DecimalSinhTest.test';
import decimalSqrtTest from './decimal/DecimalSqrtTest.test';
import decimalSubTest from './decimal/DecimalSubTest.test';
import decimalSumTest from './decimal/DecimalSumTest.test';
import decimalTanTest from './decimal/DecimalTanTest.test';
import decimalTanhTest from './decimal/DecimalTanhTest.test';
import decimalToBinaryTest from './decimal/DecimalToBinaryTest.test';

export default function testsuite(): void {
  decimalConstantsTest();
  decimalPowTest();
  decimalPrecisionTest();
  decimalPropertiesTest();
  decimalRandomTest();
  decimalRoundTest();
  decimalSetTest();
  decimalSignTest();
  decimalSinTest();
  decimalSinhTest();
  decimalSqrtTest();
  decimalSubTest();
  decimalSumTest();
  decimalTanTest();
  decimalTanhTest();
  decimalToBinaryTest();
}
