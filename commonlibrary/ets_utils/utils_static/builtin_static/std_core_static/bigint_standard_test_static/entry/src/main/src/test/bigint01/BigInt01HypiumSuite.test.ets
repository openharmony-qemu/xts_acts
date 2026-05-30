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
}
