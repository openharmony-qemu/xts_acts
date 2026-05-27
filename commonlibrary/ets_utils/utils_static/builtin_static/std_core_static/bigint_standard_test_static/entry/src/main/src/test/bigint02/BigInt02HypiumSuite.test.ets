/*
 * Hypium: BigInt mind-map test suite entry (entry/src/main/src/test/bigint02)
 * Mind-map directory: bigint/ (repository root)
 */
import BigIntOperatorMultiplyTest from './BigIntOperatorMultiplyTest.test';
import BigIntOperatorSubtractTest from './BigIntOperatorSubtractTest.test';
import BigIntOperatorDivideTest from './BigIntOperatorDivideTest.test';
import BigIntOperatorModuleTest from './BigIntOperatorModuleTest.test';
import BigIntOperatorGreaterThanTest from './BigIntOperatorGreaterThanTest.test';
import BigIntOperatorLessThanTest from './BigIntOperatorLessThanTest.test';
import BigIntOperatorGreaterThanEqualTest from './BigIntOperatorGreaterThanEqualTest.test';
import BigIntOperatorLessThanEqualTest from './BigIntOperatorLessThanEqualTest.test';
import BigIntOperatorLeftShiftTest from './BigIntOperatorLeftShiftTest.test';
import BigIntOperatorRightShiftTest from './BigIntOperatorRightShiftTest.test';
import BigIntOperatorIncrementTest from './BigIntOperatorIncrementTest.test';
import BigIntOperatorDecrementTest from './BigIntOperatorDecrementTest.test';
import BigIntPowTest from './BigIntPowTest.test';
import BigIntPositiveTest from './BigIntPositiveTest.test';
import BigIntValueOfTest from './BigIntValueOfTest.test';
import BigIntToString1Test from './BigIntToString1Test.test';
import BigIntToString2Test from './BigIntToString2Test.test';
import BigIntToString3Test from './BigIntToString3Test.test';
import BigIntToStringAsPowerOfTwoRadixTest from './BigIntToStringAsPowerOfTwoRadixTest.test';
import BigIntToLocaleString1Test from './BigIntToLocaleString1Test.test';
import BigIntToLocaleString2Test from './BigIntToLocaleString2Test.test';
import BigIntToLocaleStringOptionsPropsTest from './BigIntToLocaleStringOptionsPropsTest.test';
import BigIntToLocaleStringOptionsIfaceTest from './BigIntToLocaleStringOptionsIfaceTest.test';
import BigIntTypeAliasTest from './BigIntTypeAliasTest.test';

export default function runBigInt02HypiumTests(): void {
  BigIntOperatorMultiplyTest();
  BigIntOperatorSubtractTest();
  BigIntOperatorDivideTest();
  BigIntOperatorModuleTest();
  BigIntOperatorGreaterThanTest();
  BigIntOperatorLessThanTest();
  BigIntOperatorGreaterThanEqualTest();
  BigIntOperatorLessThanEqualTest();
  BigIntOperatorLeftShiftTest();
  BigIntOperatorRightShiftTest();
  BigIntOperatorIncrementTest();
  BigIntOperatorDecrementTest();
  BigIntPowTest();
  BigIntPositiveTest();
  BigIntValueOfTest();
  BigIntToString1Test();
  BigIntToString2Test();
  BigIntToString3Test();
  BigIntToStringAsPowerOfTwoRadixTest();
  BigIntToLocaleString1Test();
  BigIntToLocaleString2Test();
  BigIntToLocaleStringOptionsPropsTest();
  BigIntToLocaleStringOptionsIfaceTest();
  BigIntTypeAliasTest();
}
