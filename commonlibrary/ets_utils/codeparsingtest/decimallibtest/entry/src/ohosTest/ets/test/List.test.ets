/*
* Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import decimalTest from './decimal/Decimal.test';
import Decimal2Test from './decimal/Decimal2.test';
import Decimal3Test from './decimal/Decimal3.test';
import Decimal4Test from './decimal/Decimal4.test';
import DecimalStaticAddPart01Test from './decimal2/DecimalStaticAddPart01Test.test';
import DecimalStaticAddPart02Test from './decimal2/DecimalStaticAddPart02Test.test';
import DecimalStaticAsinPart01Test from './decimal2/DecimalStaticAsinPart01Test.test';
import DecimalStaticAsinPart02Test from './decimal2/DecimalStaticAsinPart02Test.test';
import DecimalStaticAsinhPart01Test from './decimal2/DecimalStaticAsinhPart01Test.test';
import DecimalStaticAsinhPart02Test from './decimal2/DecimalStaticAsinhPart02Test.test';
import DecimalStaticAtan2Part01Test from './decimal2/DecimalStaticAtan2Part01Test.test';
import DecimalStaticAtan2Part02Test from './decimal2/DecimalStaticAtan2Part02Test.test';
import DecimalStaticAtanPart01Test from './decimal2/DecimalStaticAtanPart01Test.test';
import DecimalStaticAtanPart02Test from './decimal2/DecimalStaticAtanPart02Test.test';
import DecimalStaticAtanhPart01Test from './decimal2/DecimalStaticAtanhPart01Test.test';
import DecimalStaticAtanhPart02Test from './decimal2/DecimalStaticAtanhPart02Test.test';
import DecimalStaticCbrtPart01Test from './decimal2/DecimalStaticCbrtPart01Test.test';
import DecimalStaticCbrtPart02Test from './decimal2/DecimalStaticCbrtPart02Test.test';
import DecimalStaticCeilPart01Test from './decimal2/DecimalStaticCeilPart01Test.test';
import DecimalStaticCeilPart02Test from './decimal2/DecimalStaticCeilPart02Test.test';
import DecimalStaticClampPart01Test from './decimal2/DecimalStaticClampPart01Test.test';
import DecimalStaticClampPart02Test from './decimal2/DecimalStaticClampPart02Test.test';
import DecimalStaticClampPart03Test from './decimal2/DecimalStaticClampPart03Test.test';
import DecimalStaticCosPart01Test from './decimal2/DecimalStaticCosPart01Test.test';
import DecimalStaticCosPart02Test from './decimal2/DecimalStaticCosPart02Test.test';
import DecimalStaticCoshPart01Test from './decimal2/DecimalStaticCoshPart01Test.test';
import DecimalStaticCoshPart02Test from './decimal2/DecimalStaticCoshPart02Test.test';
import DecimalStaticDivPart01Test from './decimal2/DecimalStaticDivPart01Test.test';
import DecimalStaticDivPart02Test from './decimal2/DecimalStaticDivPart02Test.test';
import DecimalStaticExpPart01Test from './decimal2/DecimalStaticExpPart01Test.test';
import DecimalStaticExpPart02Test from './decimal2/DecimalStaticExpPart02Test.test';
import DecimalStaticFloorPart01Test from './decimal2/DecimalStaticFloorPart01Test.test';
import DecimalStaticFloorPart02Test from './decimal2/DecimalStaticFloorPart02Test.test';
import DecimalStaticHypotPart01Test from './decimal2/DecimalStaticHypotPart01Test.test';
import DecimalStaticHypotPart02Test from './decimal2/DecimalStaticHypotPart02Test.test';
import DecimalStaticLnPart01Test from './decimal2/DecimalStaticLnPart01Test.test';
import DecimalStaticLnPart02Test from './decimal2/DecimalStaticLnPart02Test.test';
import DecimalStaticLog10Part01Test from './decimal2/DecimalStaticLog10Part01Test.test';
import DecimalStaticLog10Part02Test from './decimal2/DecimalStaticLog10Part02Test.test';
import DecimalStaticLog2Part01Test from './decimal2/DecimalStaticLog2Part01Test.test';
import DecimalStaticLog2Part02Test from './decimal2/DecimalStaticLog2Part02Test.test';
import DecimalStaticLogPart01Test from './decimal2/DecimalStaticLogPart01Test.test';
import DecimalStaticLogPart02Test from './decimal2/DecimalStaticLogPart02Test.test';

export default function testsuite() {
  Decimal2Test();
  decimalTest();
  Decimal3Test();
  Decimal4Test();
  DecimalStaticAddPart01Test();
  DecimalStaticAddPart02Test();
  DecimalStaticAsinPart01Test();
  DecimalStaticAsinPart02Test();
  DecimalStaticAsinhPart01Test();
  DecimalStaticAsinhPart02Test();
  DecimalStaticAtan2Part01Test();
  DecimalStaticAtan2Part02Test();
  DecimalStaticAtanPart01Test();
  DecimalStaticAtanPart02Test();
  DecimalStaticAtanhPart01Test();
  DecimalStaticAtanhPart02Test();
  DecimalStaticCbrtPart01Test();
  DecimalStaticCbrtPart02Test();
  DecimalStaticCeilPart01Test();
  DecimalStaticCeilPart02Test();
  DecimalStaticClampPart01Test();
  DecimalStaticClampPart02Test();
  DecimalStaticClampPart03Test();
  DecimalStaticCosPart01Test();
  DecimalStaticCosPart02Test();
  DecimalStaticCoshPart01Test();
  DecimalStaticCoshPart02Test();
  DecimalStaticDivPart01Test();
  DecimalStaticDivPart02Test();
  DecimalStaticExpPart01Test();
  DecimalStaticExpPart02Test();
  DecimalStaticFloorPart01Test();
  DecimalStaticFloorPart02Test();
  DecimalStaticHypotPart01Test();
  DecimalStaticHypotPart02Test();
  DecimalStaticLnPart01Test();
  DecimalStaticLnPart02Test();
  DecimalStaticLog10Part01Test();
  DecimalStaticLog10Part02Test();
  DecimalStaticLog2Part01Test();
  DecimalStaticLog2Part02Test();
  DecimalStaticLogPart01Test();
  DecimalStaticLogPart02Test();
}