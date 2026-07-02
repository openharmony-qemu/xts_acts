'use static';
import tuple0ToTuple10Test from "./tuple/Tuple0ToTuple10Test.test";
import tupleIteratorTest from "./tuple/TupleIteratorTest.test";
import tupleLengthTest from "./tuple/TupleLengthTest.test";
import tupleUnsafeGetTest from "./tuple/TupleUnsafeGetTest.test";
import abilityTest from "./Ability.test";
export default function testsuite():void {
  tuple0ToTuple10Test();
  tupleIteratorTest();
  tupleLengthTest();
  tupleUnsafeGetTest();
   abilityTest();
}
