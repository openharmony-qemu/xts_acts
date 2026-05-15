/*
 * Hypium：BigInt 导图用例入口（entry/src/main/src/test/bigint）
 */
import BigIntConstructorNoArgTest from './BigIntConstructorNoArgTest.test';
import BigIntConstructorIntegralTest from './BigIntConstructorIntegralTest.test';
import BigIntConstructorDoubleTest from './BigIntConstructorDoubleTest.test';
import BigIntConstructorStringTest from './BigIntConstructorStringTest.test';
import BigIntConstructorBooleanTest from './BigIntConstructorBooleanTest.test';
import BigIntConstructorCopyTest from './BigIntConstructorCopyTest.test';
import BigIntAsUintNTest from './BigIntAsUintNTest.test';
import BigIntAsIntNTest from './BigIntAsIntNTest.test';

export default function runBigIntHypiumTests(): void {
  BigIntConstructorNoArgTest();
  BigIntConstructorIntegralTest();
  BigIntConstructorDoubleTest();
  BigIntConstructorStringTest();
  BigIntConstructorBooleanTest();
  BigIntConstructorCopyTest();
  BigIntAsUintNTest();
  BigIntAsIntNTest();
}
