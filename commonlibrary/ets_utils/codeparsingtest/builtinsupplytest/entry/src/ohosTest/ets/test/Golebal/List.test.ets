import abilityTest from './Ability.test';
import ArrayBuffer1Test from './ArrayBuffer/ArrayBuffer1.test';
import ArrayBuffer2Test from './ArrayBuffer/ArrayBuffer2.test';
import ArrayBuffer4Test from './ArrayBuffer/ArrayBuffer4.test';
import BigInt1Test from './BigInt/BigInt1.test';
import BigInt2Test from './BigInt/BigInt2.test';
import BigInt3Test from './BigInt/BigInt3.test';
import BigInt4Test from './BigInt/BigInt4.test';
import BigInt5Test from './BigInt/BigInt5.test';
import BigInt6Test from './BigInt/BigInt6.test';
import IsFiniteTest from './IsFinite.test';
import IsNaNTest from './IsNaN.test';
import Json1Test from './Json/Json1.test';
import Json2Test from './Json/Json2.test';
import NaNTest from './NaN.test';
import ParseFloatTest from './ParseFloat.test';
import ParseIntTest from './ParseInt.test';
import SharedArrayBuffer1Test from './SharedArrayBuffer/SharedArrayBuffer1.test';

export default function testsuite() {
  abilityTest();
  BigInt1Test();
  BigInt2Test();
  BigInt3Test();
  BigInt4Test();
  BigInt5Test();
  BigInt6Test();
  ArrayBuffer1Test();
  ArrayBuffer2Test();
  ArrayBuffer4Test();
  SharedArrayBuffer1Test();
  Json1Test();
  Json2Test();
  IsFiniteTest();
  IsNaNTest();
  NaNTest();
  ParseFloatTest();
  ParseIntTest();
}