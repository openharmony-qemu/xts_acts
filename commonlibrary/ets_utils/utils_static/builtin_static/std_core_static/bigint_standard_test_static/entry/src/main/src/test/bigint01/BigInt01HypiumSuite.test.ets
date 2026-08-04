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
import BigIntFromULongTest from './BigIntFromULongTest.test';
import BigIntEquals1Test from './BigIntEquals1Test.test';
import BigIntEquals2Test from './BigIntEquals2Test.test';
import BigIntNegativeTest from './BigIntNegativeTest.test';
import BigIntOperatorAddTest from './BigIntOperatorAddTest.test';
import BigIntGetULongTest from './BigIntGetULongTest.test';
import BigIntGetLongTest from './BigIntGetLongTest.test';
import BigIntDoubleValueTest from './BigIntDoubleValueTest.test';
import BigIntNegateTest from './BigIntNegateTest.test';
import BigIntOperatorBitwiseNotTest from './BigIntOperatorBitwiseNotTest.test';
import BigIntOperatorBitwiseAndTest from './BigIntOperatorBitwiseAndTest.test';
import BigIntOperatorBitwiseXorTest from './BigIntOperatorBitwiseXorTest.test';
import BigIntOperatorBitwiseOrTest from './BigIntOperatorBitwiseOrTest.test';


import BigIntDoubleValueTest_2 from './BigIntDoubleValueTest_2.test';
import BigIntFromULongTest_2 from './BigIntFromULongTest_2.test';
import BigIntEquals1Test_2 from './BigIntEquals1Test_2.test';
import BigIntEquals2Test_2 from './BigIntEquals2Test_2.test';
import BigIntNegativeTest_2 from './BigIntNegativeTest_2.test';
import BigIntOperatorAddTest_2 from './BigIntOperatorAddTest_2.test';
import BigIntGetULongTest_2 from './BigIntGetULongTest_2.test';
import BigIntGetLongTest_2 from './BigIntGetLongTest_2.test';
import BigIntNegateTest_2 from './BigIntNegateTest_2.test';
import BigIntOperatorBitwiseNotTest_2 from './BigIntOperatorBitwiseNotTest_2.test';
import BigIntOperatorBitwiseAndTest_2 from './BigIntOperatorBitwiseAndTest_2.test';
import BigIntOperatorBitwiseXorTest_2 from './BigIntOperatorBitwiseXorTest_2.test';
import BigIntOperatorBitwiseOrTest_2 from './BigIntOperatorBitwiseOrTest_2.test';

export default function runBigInt01HypiumTests(): void {

  BigIntFromULongTest();
  BigIntEquals1Test();
  BigIntEquals2Test();
  BigIntNegativeTest();
  BigIntOperatorAddTest();
  BigIntGetULongTest();
  BigIntGetLongTest();
  BigIntDoubleValueTest();
  BigIntNegateTest();
  BigIntOperatorBitwiseNotTest();
  BigIntOperatorBitwiseAndTest();
  BigIntOperatorBitwiseXorTest();
  BigIntOperatorBitwiseOrTest();


  BigIntDoubleValueTest_2();
  BigIntEquals1Test_2();
  BigIntEquals2Test_2();
  BigIntFromULongTest_2();
  BigIntNegativeTest_2();
  BigIntOperatorAddTest_2();
  BigIntGetULongTest_2();
  BigIntGetLongTest_2();
  BigIntNegateTest_2();
  BigIntOperatorBitwiseNotTest_2();
  BigIntOperatorBitwiseAndTest_2();
  BigIntOperatorBitwiseXorTest_2();
  BigIntOperatorBitwiseOrTest_2();
}
