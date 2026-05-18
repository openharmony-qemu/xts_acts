/*
 * Hypium：BigInt 导图用例入口（entry/src/main/src/test/bigint01）
 * 导图目录：/Users/yuhu/word/harmony/test
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
