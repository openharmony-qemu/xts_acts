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

import DoubleAddTest from "./double/DoubleAddTest.test";
import DoubleBitCastFromLongTest from "./double/DoubleBitCastFromLongTest.test";
import DoubleBitCastToLongTest from "./double/DoubleBitCastToLongTest.test";
import DoubleCompareTest from "./double/DoubleCompareTest.test";
import DoubleCompareToTest from "./double/DoubleCompareToTest.test";
import DoubleConstructorFourTest from "./double/DoubleConstructorFourTest.test";
import DoubleConstructorOneTest from "./double/DoubleConstructorOneTest.test";
import DoubleConstructorThreeTest from "./double/DoubleConstructorThreeTest.test";
import DoubleConstructorTwoTest from "./double/DoubleConstructorTwoTest.test";
import DoubleDivTest from "./double/DoubleDivTest.test";
import DoubleDollarInvokeOneTest from "./double/DoubleDollarInvokeOneTest.test";
import DoubleDollarInvokeTwoTest from "./double/DoubleDollarInvokeTwoTest.test";
import DoubleEqualsTest from "./double/DoubleEqualsTest.test";
import DoubleIsFiniteOneTest from "./double/DoubleIsFiniteOneTest.test";
import DoubleIsFiniteTwoTest from "./double/DoubleIsFiniteTwoTest.test";
import DoubleIsGreaterEqualThanTest from "./double/DoubleIsGreaterEqualThanTest.test";
import DoubleIsGreaterThanTest from "./double/DoubleIsGreaterThanTest.test";
import DoubleIsIntegerOneTest from "./double/DoubleIsIntegerOneTest.test";
import DoubleIsIntegerTwoTest from "./double/DoubleIsIntegerTwoTest.test";
import DoubleIsLessEqualThanTest from "./double/DoubleIsLessEqualThanTest.test";
import DoubleIsLessThanTest from "./double/DoubleIsLessThanTest.test";
import DoubleIsNaNOneTest from "./double/DoubleIsNaNOneTest.test";
import DoubleIsNaNTwoTest from "./double/DoubleIsNaNTwoTest.test";
import DoubleIsSafeIntegerOneTest from "./double/DoubleIsSafeIntegerOneTest.test";
import DoubleIsSafeIntegerTwoTest from "./double/DoubleIsSafeIntegerTwoTest.test";
import DoubleMulTest from "./double/DoubleMulTest.test";
import DoubleParseFloatTest from "./double/DoubleParseFloatTest.test";
import DoubleParseIntCoreTest from "./double/DoubleParseIntCoreTest.test";
import DoubleParseIntOneTest from "./double/DoubleParseIntOneTest.test";
import DoubleParseIntThreeTest from "./double/DoubleParseIntThreeTest.test";
import DoubleParseIntTwoTest from "./double/DoubleParseIntTwoTest.test";
import DoubleSubTest from "./double/DoubleSubTest.test";
import DoubleToByteOneTest from "./double/DoubleToByteOneTest.test";
import DoubleToByteTwoTest from "./double/DoubleToByteTwoTest.test";
import DoubleToDoubleOneTest from "./double/DoubleToDoubleOneTest.test";
import DoubleToDoubleTwoTest from "./double/DoubleToDoubleTwoTest.test";
import DoubleToExponentialOneTest from "./double/DoubleToExponentialOneTest.test";
import DoubleToExponentialTwoTest from "./double/DoubleToExponentialTwoTest.test";
import DoubleToExponentialWithNoDigitTest from "./double/DoubleToExponentialWithNoDigitTest.test";
import DoubleToFixedImplTest from "./double/DoubleToFixedImplTest.test";
import DoubleToFixedOneTest from "./double/DoubleToFixedOneTest.test";
import DoubleToFixedTwoTest from "./double/DoubleToFixedTwoTest.test";
import DoubleToFloatOneTest from "./double/DoubleToFloatOneTest.test";
import DoubleToFloatTwoTest from "./double/DoubleToFloatTwoTest.test";
import DoubleToIntTest from "./double/DoubleToIntTest.test";
import DoubleToLocaleString1Test from "./double/DoubleToLocaleString1Test.test";
import DoubleToLocaleString2Test from "./double/DoubleToLocaleString2Test.test";
import DoubleToLong1Test from "./double/DoubleToLong1Test.test";
import DoubleToLong2Test from "./double/DoubleToLong2Test.test";
import DoubleToPrecision1Test from "./double/DoubleToPrecision1Test.test";
import DoubleToPrecision2Test from "./double/DoubleToPrecision2Test.test";
import DoubleToShort1Test from "./double/DoubleToShort1Test.test";
import DoubleToShort2Test from "./double/DoubleToShort2Test.test";
import DoubleToString1Test from "./double/DoubleToString1Test.test";
import DoubleToString2Test from "./double/DoubleToString2Test.test";
import DoubleToString3Test from "./double/DoubleToString3Test.test";
import DoubleToString4Test from "./double/DoubleToString4Test.test";
import DoubleToString5Test from "./double/DoubleToString5Test.test";
import DoubleValueOfTest from "./double/DoubleValueOfTest.test";
import NumberTest from "./double/NumberTest.test";
import DoubleStaticConstantsTest from "./doubleStatic/DoubleStaticConstantsTest.test";
import DoubleToIntStaticTest from "./doubleStatic/DoubleToIntStaticTest.test";

export default function testsuite(): void {
  DoubleAddTest();
  DoubleBitCastFromLongTest();
  DoubleBitCastToLongTest();
  DoubleCompareTest();
  DoubleCompareToTest();
  DoubleConstructorFourTest();
  DoubleConstructorOneTest();
  DoubleConstructorThreeTest();
  DoubleConstructorTwoTest();
  DoubleDivTest();
  DoubleDollarInvokeOneTest();
  DoubleDollarInvokeTwoTest();
  DoubleEqualsTest();
  DoubleIsFiniteOneTest();
  DoubleIsFiniteTwoTest();
  DoubleIsGreaterEqualThanTest();
  DoubleIsGreaterThanTest();
  DoubleIsIntegerOneTest();
  DoubleIsIntegerTwoTest();
  DoubleIsLessEqualThanTest();
  DoubleIsLessThanTest();
  DoubleIsNaNOneTest();
  DoubleIsNaNTwoTest();
  DoubleIsSafeIntegerOneTest();
  DoubleIsSafeIntegerTwoTest();
  DoubleMulTest();
  DoubleParseFloatTest();
  DoubleParseIntCoreTest();
  DoubleParseIntOneTest();
  DoubleParseIntThreeTest();
  DoubleParseIntTwoTest();
  DoubleSubTest();
  DoubleToByteOneTest();
  DoubleToByteTwoTest();
  DoubleToDoubleOneTest();
  DoubleToDoubleTwoTest();
  DoubleToExponentialOneTest();
  DoubleToExponentialTwoTest();
  DoubleToExponentialWithNoDigitTest();
  DoubleToFixedImplTest();
  DoubleToFixedOneTest();
  DoubleToFixedTwoTest();
  DoubleToFloatOneTest();
  DoubleToFloatTwoTest();
  DoubleToIntTest();
  DoubleToLocaleString1Test();
  DoubleToLocaleString2Test();
  DoubleToLong1Test();
  DoubleToLong2Test();
  DoubleToPrecision1Test();
  DoubleToPrecision2Test();
  DoubleToShort1Test();
  DoubleToShort2Test();
  DoubleToString1Test();
  DoubleToString2Test();
  DoubleToString3Test();
  DoubleToString4Test();
  DoubleToString5Test();
  DoubleValueOfTest();
  NumberTest();
  DoubleStaticConstantsTest();
  DoubleToIntStaticTest();
}
