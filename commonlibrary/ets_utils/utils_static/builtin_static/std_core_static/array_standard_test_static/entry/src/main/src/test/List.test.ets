import ArrayAt1Test from "./array/ArrayAt1Test.test";
import ArrayAt2Test from "./array/ArrayAt2Test.test";
import ArrayConcatTest from "./array/ArrayConcatTest.test";
import ArrayCopyWithin1Test from "./array/ArrayCopyWithin1Test.test";
import ArrayCopyWithin2Test from "./array/ArrayCopyWithin2Test.test";
import ArrayCopyWithin3Test from "./array/ArrayCopyWithin3Test.test";
import ArrayCopyWithin4Test from "./array/ArrayCopyWithin4Test.test";
import ArrayConstructor1Test from "./array/ArrayConstructor1Test.test";
import ArrayConstructor2Test from "./array/ArrayConstructor2Test.test";
import ArrayConstructor3Test from "./array/ArrayConstructor3Test.test";
import ArrayConstructor4Test from "./array/ArrayConstructor4Test.test";
import ArrayCreateTest from "./array/ArrayCreateTest.test";
import ArrayGetTest from "./array/ArrayGetTest.test";
import ArrayInvoke1Test from "./array/ArrayInvoke1Test.test";
import ArrayInvoke2Test from "./array/ArrayInvoke2Test.test";
import ArrayInvoke3Test from "./array/ArrayInvoke3Test.test";
import ArrayIteratorTest from "./array/ArrayIteratorTest.test";
import ArraySetTest from "./array/ArraySetTest.test";

export default function testsuite(): void {
  ArrayAt1Test()
  ArrayAt2Test()
  ArrayConcatTest();
  ArrayCopyWithin1Test();
  ArrayCopyWithin2Test();
  ArrayCopyWithin3Test();
  ArrayCopyWithin4Test();
  ArrayConstructor1Test();
  ArrayConstructor2Test();
  ArrayConstructor3Test();
  ArrayConstructor4Test();
  ArrayCreateTest();
  ArrayGetTest()
  ArrayInvoke1Test()
  ArrayInvoke2Test()
  ArrayInvoke3Test()
  ArrayIteratorTest()
  ArraySetTest()
}
