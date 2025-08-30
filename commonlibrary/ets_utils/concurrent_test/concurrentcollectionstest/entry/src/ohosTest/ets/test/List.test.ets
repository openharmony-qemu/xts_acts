import abilityTest from './Ability.test';
import SendableTest from './SendableLruCachetest.test';
import globalTest1 from './ConcurrentArrayTest.test'
import globalTest2 from './ConcurrentMapAndSetTest.test'
import globalTest3 from './ConcurrentAsyncLockTest.test'
import globalTest4 from './ConcurrentCondVariableTest.test'
import int8ArrayTest from './ClassInt8Array.test';
import int16ArrayTest from './ClassInt16Array.test';
import int32ArrayTest from './ClassInt32Array.test';
import unit32ArrayTest from './ClassUint32Array.test';
import unit16ArrayTest from './ClassUint16Array.test';
import unit8ArrayTest from './ClassUint8Array.test';
import unit8ClampedArrayTest from './ClassUint8ClampedArray.test';
import float32ArrayTest from './ClassFloat32Array.test';
import bitVectorTest from './ClassBitVector.test';

export default function testsuite() {
  SendableTest();
  globalTest1();
  globalTest2();
  globalTest3();
  globalTest4();
  int8ArrayTest();
  int16ArrayTest();
  int32ArrayTest();
  unit32ArrayTest();
  unit16ArrayTest();
  unit8ArrayTest();
  unit8ClampedArrayTest();
  float32ArrayTest();
  bitVectorTest();
}