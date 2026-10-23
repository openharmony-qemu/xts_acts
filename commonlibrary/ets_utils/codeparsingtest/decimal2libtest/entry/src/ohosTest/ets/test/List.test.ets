
import DecimalConfigPropertiesTest from './decimal1/DecimalConfigTest.test';
import DecimalConstructorBoundaryTest from './decimal1/DecimalConstructorBoundaryTest.test';
import DecimalToBinaryTest from './decimal1/DecimalToBinaryTest.test';
import DecimalToDecimalPlacesTest from './decimal1/DecimalToDecimalPlacesTest.test';
import DecimalToExponentialTest from './decimal1/DecimalToExponentialTest.test';

export default function testsuite() {
  DecimalConfigPropertiesTest();
  DecimalConstructorBoundaryTest();
  DecimalToBinaryTest();
  DecimalToDecimalPlacesTest();
  DecimalToExponentialTest();
}
