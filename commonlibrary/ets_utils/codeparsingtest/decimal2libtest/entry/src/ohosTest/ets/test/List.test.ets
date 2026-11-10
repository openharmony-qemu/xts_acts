
import DecimalConfigTest from './decimal1/DecimalConfigTest.test';
import DecimalConstructorBoundaryTest from './decimal1/DecimalConstructorBoundaryTest.test';
import DecimalToBinaryTest from './decimal1/DecimalToBinaryTest.test';
import DecimalToDecimalPlacesTest from './decimal1/DecimalToDecimalPlacesTest.test';
import DecimalToExponentialTest from './decimal1/DecimalToExponentialTest.test';
import DecimalToFixedTest from './decimal1/DecimalToFixedTest.test';
import DecimalToFractionTest from './decimal1/DecimalToFractionTest.test';
import DecimalToHexadecimalTest from './decimal1/DecimalToHexadecimalTest.test';
import DecimalToNearestTest from './decimal1/DecimalToNearestTest.test';
import DecimalToNumberTest from './decimal1/DecimalToNumberTest.test';
import DecimalToOctalTest from './decimal1/DecimalToOctalTest.test';
import DecimalToPrecisionTest from './decimal1/DecimalToPrecisionTest.test';
import DecimalToSignificantDigitsTest from './decimal1/DecimalToSignificantDigitsTest.test';
import DecimalToStringTest from './decimal1/DecimalToStringTest.test';
import DecimalTruncTest from './decimal1/DecimalTruncTest.test';
import DecimalUnionTest from './decimal1/DecimalUnionTest.test';
import DecimalValueOfTest from './decimal1/DecimalValueOfTest.test';

export default function testsuite() {
  DecimalConfigTest();
  DecimalConstructorBoundaryTest();
  DecimalToBinaryTest();
  DecimalToDecimalPlacesTest();
  DecimalToExponentialTest();
  DecimalToFixedTest();
  DecimalToFractionTest();
  DecimalToHexadecimalTest();
  DecimalToNearestTest();
  DecimalToNumberTest();
  DecimalToOctalTest();
  DecimalToPrecisionTest();
  DecimalToSignificantDigitsTest();
  DecimalToStringTest();
  DecimalTruncTest();
  DecimalUnionTest();
  DecimalValueOfTest();
}
