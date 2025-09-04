import abilityTest from './Ability.test';
import BigIntTest from './BigInt.test';
import BooleanTest from './Boolean.test';
import DataViewTest from './DataView.test';
import ErrorTest from './Error.test';
import globalTest from './Global.test';
import IntTest from './Intl.test';
import StringTest from './String.test';
import TypedArrayTest from './TypedArray.test';
import globalTest1 from './ConcurrentTest.test'
import globalTest2 from './ConcurrentSecondTest.test'
import globalTest3 from './ConcurrentThirdTest.test'

export default function testsuite() {
  abilityTest();
  BigIntTest();
  BooleanTest();
  DataViewTest();
  ErrorTest();
  globalTest();
  IntTest();
  StringTest();
  TypedArrayTest();
  globalTest1();
  globalTest2();
  globalTest3();
}