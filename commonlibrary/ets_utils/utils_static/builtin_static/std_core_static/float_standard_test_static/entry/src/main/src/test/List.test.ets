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

import FloatAddTest from './float/FloatAddTest.test';
import FloatAddTest2 from './float/FloatAddTest2.test';
import FloatSubTest from './float/FloatSubTest.test';
import FloatSubTest2 from './float/FloatSubTest2.test';
import FloatMulTest from './float/FloatMulTest.test';
import FloatMulTest2 from './float/FloatMulTest2.test';
import FloatDivTest from './float/FloatDivTest.test';
import FloatDivTest2 from './float/FloatDivTest2.test';
import FloatConstructor1Test from './float/FloatConstructor1Test.test';
import FloatConstructor1Test2 from './float/FloatConstructor1Test2.test';
import FloatConstructor2Test from './float/FloatConstructor2Test.test';
import FloatConstructor2Test2 from './float/FloatConstructor2Test2.test';
import FloatConstructor3Test from './float/FloatConstructor3Test.test';
import FloatConstructor3Test2 from './float/FloatConstructor3Test2.test';
import FloatCompareToTest from './float/FloatCompareToTest.test';
import FloatCompareToTest2 from './float/FloatCompareToTest2.test';
import FloatCompareTest from './float/FloatCompareTest.test';
import FloatCompareTest2 from './float/FloatCompareTest2.test';
import FloatEqualsTest from './float/FloatEqualsTest.test';
import FloatEqualsTest2 from './float/FloatEqualsTest2.test';
import FloatIsLessThanTest from './float/FloatIsLessThanTest.test';
import FloatIsLessThanTest2 from './float/FloatIsLessThanTest2.test';
import FloatIsLessEqualThanTest from './float/FloatIsLessEqualThanTest.test';
import FloatIsLessEqualThanTest2 from './float/FloatIsLessEqualThanTest2.test';
import FloatIsGreaterThanTest from './float/FloatIsGreaterThanTest.test';
import FloatIsGreaterThanTest2 from './float/FloatIsGreaterThanTest2.test';
import FloatIsGreaterEqualThanTest from './float/FloatIsGreaterEqualThanTest.test';
import FloatIsGreaterEqualThanTest2 from './float/FloatIsGreaterEqualThanTest2.test';
import FloatToByte1Test from './float/FloatToByte1Test.test';
import FloatToByte1Test2 from './float/FloatToByte1Test2.test';
import FloatToByte2Test from './float/FloatToByte2Test.test';
import FloatToByte2Test2 from './float/FloatToByte2Test2.test';
import FloatToShort1Test from './float/FloatToShort1Test.test';
import FloatToShort1Test2 from './float/FloatToShort1Test2.test';
import FloatToShort2Test from './float/FloatToShort2Test.test';
import FloatToShort2Test2 from './float/FloatToShort2Test2.test';
import FloatToInt1Test from './float/FloatToInt1Test.test';
import FloatToInt1Test2 from './float/FloatToInt1Test2.test';
import FloatToInt2Test from './float/FloatToInt2Test.test';
import FloatToInt2Test2 from './float/FloatToInt2Test2.test';
import FloatToLong1Test from './float/FloatToLong1Test.test';
import FloatToLong1Test2 from './float/FloatToLong1Test2.test';
import FloatToLong2Test from './float/FloatToLong2Test.test';
import FloatToLong2Test2 from './float/FloatToLong2Test2.test';
import FloatToFloat1Test from './float/FloatToFloat1Test.test';
import FloatToFloat1Test2 from './float/FloatToFloat1Test2.test';
import FloatToFloat2Test from './float/FloatToFloat2Test.test';
import FloatToFloat2Test2 from './float/FloatToFloat2Test2.test';
import FloatToDouble1Test from './float/FloatToDouble1Test.test';
import FloatToDouble1Test2 from './float/FloatToDouble1Test2.test';
import FloatToDouble2Test from './float/FloatToDouble2Test.test';
import FloatToDouble2Test2 from './float/FloatToDouble2Test2.test';
import FloatToString1Test from './float/FloatToString1Test.test';
import FloatToString1Test2 from './float/FloatToString1Test2.test';
import FloatToString2Test from './float/FloatToString2Test.test';
import FloatToString2Test2 from './float/FloatToString2Test2.test';
import FloatToString3Test from './float/FloatToString3Test.test';
import FloatToString3Test2 from './float/FloatToString3Test2.test';
import FloatToString4Test from './float/FloatToString4Test.test';
import FloatToString4Test2 from './float/FloatToString4Test2.test';
import FloatToLocaleString1Test from './float/FloatToLocaleString1Test.test';
import FloatToLocaleString1Test2 from './float/FloatToLocaleString1Test2.test';
import FloatToLocaleString2Test from './float/FloatToLocaleString2Test.test';
import FloatToLocaleString2Test2 from './float/FloatToLocaleString2Test2.test';
import FloatIsNaN1Test from './float/FloatIsNaN1Test.test';
import FloatIsNaN1Test2 from './float/FloatIsNaN1Test2.test';
import FloatIsNaN2Test from './float/FloatIsNaN2Test.test';
import FloatIsNaN2Test2 from './float/FloatIsNaN2Test2.test';
import FloatIsFinite1Test from './float/FloatIsFinite1Test.test';
import FloatIsFinite1Test2 from './float/FloatIsFinite1Test2.test';
import FloatIsFinite2Test from './float/FloatIsFinite2Test.test';
import FloatIsFinite2Test2 from './float/FloatIsFinite2Test2.test';
import FloatIsInteger1Test from './float/FloatIsInteger1Test.test';
import FloatIsInteger1Test2 from './float/FloatIsInteger1Test2.test';
import FloatIsInteger2Test from './float/FloatIsInteger2Test.test';
import FloatIsInteger2Test2 from './float/FloatIsInteger2Test2.test';
import FloatIsSafeInteger1Test from './float/FloatIsSafeInteger1Test.test';
import FloatIsSafeInteger1Test2 from './float/FloatIsSafeInteger1Test2.test';
import FloatIsSafeInteger2Test from './float/FloatIsSafeInteger2Test.test';
import FloatIsSafeInteger2Test2 from './float/FloatIsSafeInteger2Test2.test';
import FloatBitCastFromIntTest from './float/FloatBitCastFromIntTest.test';
import FloatBitCastFromIntTest2 from './float/FloatBitCastFromIntTest2.test';
import FloatBitCastToIntTest from './float/FloatBitCastToIntTest.test';
import FloatBitCastToIntTest2 from './float/FloatBitCastToIntTest2.test';
import FloatConstantsTest from './float/FloatConstantsTest.test';
import FloatConstantsTest2 from './float/FloatConstantsTest2.test';


export default function testsuite(): void {

   FloatAddTest();
   FloatAddTest2();
   FloatSubTest();
   FloatSubTest2();
   FloatMulTest();
   FloatMulTest2();
   FloatDivTest();
   FloatDivTest2();
   FloatConstructor1Test();
   FloatConstructor1Test2();
   FloatConstructor2Test();
   FloatConstructor2Test2();
   FloatConstructor3Test();
   FloatConstructor3Test2();
   FloatCompareToTest();
   FloatCompareToTest2();
   FloatCompareTest();
   FloatCompareTest2();
   FloatEqualsTest();
   FloatEqualsTest2();
   FloatIsLessThanTest();
   FloatIsLessThanTest2();
   FloatIsLessEqualThanTest();
   FloatIsLessEqualThanTest2();
   FloatIsGreaterThanTest();
   FloatIsGreaterThanTest2();
   FloatIsGreaterEqualThanTest();
   FloatIsGreaterEqualThanTest2();
   FloatToByte1Test();
   FloatToByte1Test2();
   FloatToByte2Test();
   FloatToByte2Test2();
   FloatToShort1Test();
   FloatToShort1Test2();
   FloatToShort2Test();
   FloatToShort2Test2();
   FloatToInt1Test();
   FloatToInt1Test2();
   FloatToInt2Test();
   FloatToInt2Test2();
   FloatToLong1Test();
   FloatToLong1Test2();
   FloatToLong2Test();
   FloatToLong2Test2();
   FloatToFloat1Test();
   FloatToFloat1Test2();
   FloatToFloat2Test();
   FloatToFloat2Test2();
   FloatToDouble1Test();
   FloatToDouble1Test2();
   FloatToDouble2Test();
   FloatToDouble2Test2();
   FloatToString1Test();
   FloatToString1Test2();
   FloatToString2Test();
   FloatToString2Test2();
   FloatToString3Test();
   FloatToString3Test2();
   FloatToString4Test();
   FloatToString4Test2();
   FloatToLocaleString1Test();
   FloatToLocaleString1Test2();
   FloatToLocaleString2Test();
   FloatToLocaleString2Test2();
   FloatIsNaN1Test();
   FloatIsNaN1Test2();
   FloatIsNaN2Test();
   FloatIsNaN2Test2();
   FloatIsFinite1Test();
   FloatIsFinite1Test2();
   FloatIsFinite2Test();
   FloatIsFinite2Test2();
   FloatIsInteger1Test();
   FloatIsInteger1Test2();
   FloatIsInteger2Test();
   FloatIsInteger2Test2();
   FloatIsSafeInteger1Test();
   FloatIsSafeInteger1Test2();
   FloatIsSafeInteger2Test();
   FloatIsSafeInteger2Test2();
   FloatBitCastFromIntTest();
   FloatBitCastFromIntTest2();
   FloatBitCastToIntTest();
   FloatBitCastToIntTest2();
   FloatConstantsTest();
   FloatConstantsTest2();

}
