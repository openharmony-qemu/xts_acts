'use static';
import IteratorForEachTest from "./iterator/IteratorForEachTest.test";
import IterableTest from "./iterator/IterableTest.test";
import IterableIteratorTest from "./iterator/IterableIteratorTest.test";
import IteratorTest from "./iterator/IteratorTest.test";
import IteratorResultTest from "./iterator/IteratorResultTest.test";
import IteratorResultConstructor1Test from "./iterator/IteratorResultConstructor1Test.test";
import IteratorResultConstructor2Test from "./iterator/IteratorResultConstructor2Test.test";
import IteratorResultConstructor3Test from "./iterator/IteratorResultConstructor3Test.test";

export default function testsuite():void {
  IteratorForEachTest();
  IterableTest();
  IterableIteratorTest();
  IteratorTest();
  IteratorResultTest();
  IteratorResultConstructor1Test();
  IteratorResultConstructor2Test();
  IteratorResultConstructor3Test();
}