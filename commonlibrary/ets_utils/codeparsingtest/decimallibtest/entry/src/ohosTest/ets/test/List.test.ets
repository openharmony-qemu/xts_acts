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
import decimalIsZeroTest from './decimal/DecimalIsZeroTest.test.ets';
import decimalLessThanOrEqualToPart01Test from './decimal/DecimalLessThanOrEqualToPart01Test.test.ets';
import decimalLessThanOrEqualToPart02Test from './decimal/DecimalLessThanOrEqualToPart02Test.test.ets';
import decimalLessThanPart01Test from './decimal/DecimalLessThanPart01Test.test.ets';
import decimalLessThanPart02Test from './decimal/DecimalLessThanPart02Test.test.ets';
import decimalLnTest from './decimal/DecimalLnTest.test.ets';
import decimalLogPart01Test from './decimal/DecimalLogPart01Test.test.ets';
import decimalLogPart02Test from './decimal/DecimalLogPart02Test.test.ets';
import decimalModPart01Test from './decimal/DecimalModPart01Test.test.ets';
import decimalModPart02Test from './decimal/DecimalModPart02Test.test.ets';
import decimalMulPart01Test from './decimal/DecimalMulPart01Test.test.ets';
import decimalMulPart02Test from './decimal/DecimalMulPart02Test.test.ets';
import decimalNegateTest from './decimal/DecimalNegateTest.test.ets';
import decimalOverviewPart01Test from './decimal/DecimalOverviewPart01Test.test.ets';
import decimalOverviewPart02Test from './decimal/DecimalOverviewPart02Test.test.ets';
import decimalOverviewPart03Test from './decimal/DecimalOverviewPart03Test.test.ets';
import decimalOverviewPart04Test from './decimal/DecimalOverviewPart04Test.test.ets';
import decimalOverviewPart05Test from './decimal/DecimalOverviewPart05Test.test.ets';
import decimalOverviewPart06Test from './decimal/DecimalOverviewPart06Test.test.ets';
import decimalOverviewPart07Test from './decimal/DecimalOverviewPart07Test.test.ets';
import decimalOverviewPart08Test from './decimal/DecimalOverviewPart08Test.test.ets';
import decimalPowPart01Test from './decimal/DecimalPowPart01Test.test.ets';
import decimalPowPart02Test from './decimal/DecimalPowPart02Test.test.ets';
import decimalPrecisionPart01Test from './decimal/DecimalPrecisionPart01Test.test.ets';
import decimalPrecisionPart02Test from './decimal/DecimalPrecisionPart02Test.test.ets';
import decimalPrecisionPart03Test from './decimal/DecimalPrecisionPart03Test.test.ets';
import decimalPropertiesPart01Test from './decimal/DecimalPropertiesPart01Test.test.ets';
import decimalPropertiesPart02Test from './decimal/DecimalPropertiesPart02Test.test.ets';
import decimalPropertiesPart03Test from './decimal/DecimalPropertiesPart03Test.test.ets';
import decimalPropertiesPart04Test from './decimal/DecimalPropertiesPart04Test.test.ets';
import decimalPropertiesPart05Test from './decimal/DecimalPropertiesPart05Test.test.ets';
import decimalPropertiesPart06Test from './decimal/DecimalPropertiesPart06Test.test.ets';
import decimalSinTest from './decimal/DecimalSinTest.test.ets';
import decimalSinhTest from './decimal/DecimalSinhTest.test.ets';
import decimalSqrtPart01Test from './decimal/DecimalSqrtPart01Test.test.ets';
import decimalSqrtPart02Test from './decimal/DecimalSqrtPart02Test.test.ets';
import decimalStaticAbsPart01Test from './decimal/DecimalStaticAbsPart01Test.test.ets';
import decimalStaticAbsPart02Test from './decimal/DecimalStaticAbsPart02Test.test.ets';
import decimalStaticAcosPart01Test from './decimal/DecimalStaticAcosPart01Test.test.ets';
import decimalStaticAcosPart02Test from './decimal/DecimalStaticAcosPart02Test.test.ets';
import decimalStaticAcoshPart01Test from './decimal/DecimalStaticAcoshPart01Test.test.ets';
import decimalStaticAcoshPart02Test from './decimal/DecimalStaticAcoshPart02Test.test.ets';

export default function testsuite() {
  Decimal2Test();
  decimalTest();
  Decimal3Test();
  Decimal4Test();
  decimalIsZeroTest();
  decimalLessThanOrEqualToPart01Test();
  decimalLessThanOrEqualToPart02Test();
  decimalLessThanPart01Test();
  decimalLessThanPart02Test();
  decimalLnTest();
  decimalLogPart01Test();
  decimalLogPart02Test();
  decimalModPart01Test();
  decimalModPart02Test();
  decimalMulPart01Test();
  decimalMulPart02Test();
  decimalNegateTest();
  decimalOverviewPart01Test();
  decimalOverviewPart02Test();
  decimalOverviewPart03Test();
  decimalOverviewPart04Test();
  decimalOverviewPart05Test();
  decimalOverviewPart06Test();
  decimalOverviewPart07Test();
  decimalOverviewPart08Test();
  decimalPowPart01Test();
  decimalPowPart02Test();
  decimalPrecisionPart01Test();
  decimalPrecisionPart02Test();
  decimalPrecisionPart03Test();
  decimalPropertiesPart01Test();
  decimalPropertiesPart02Test();
  decimalPropertiesPart03Test();
  decimalPropertiesPart04Test();
  decimalPropertiesPart05Test();
  decimalPropertiesPart06Test();
  decimalSinTest();
  decimalSinhTest();
  decimalSqrtPart01Test();
  decimalSqrtPart02Test();
  decimalStaticAbsPart01Test();
  decimalStaticAbsPart02Test();
  decimalStaticAcosPart01Test();
  decimalStaticAcosPart02Test();
  decimalStaticAcoshPart01Test();
  decimalStaticAcoshPart02Test();
}
