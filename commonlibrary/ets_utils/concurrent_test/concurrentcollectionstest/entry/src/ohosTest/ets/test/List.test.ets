import abilityTest from './Ability.test';
import SendableTest from './SendableLruCachetest.test';
import globalTest1 from './ConcurrentArrayTest.test'
import globalTest2 from './ConcurrentMapAndSetTest.test'
import globalTest3 from './ConcurrentAsyncLockTest.test'
import globalTest4 from './ConcurrentCondVariableTest.test'
import int8ArrayTest from './ClassInt8Array.test';
import Int16ArrayGlobalTest from './ClassInt16Array.test';
import Int32ArrayGlobalTest from './ClassInt32Array.test';
import Float32ArrayGlobalTest from './ClassFloat32Array.test';
import globalTest5 from './ConcurrentBitVectorTest.test'
import globalTest6 from './ConcurrentUint8ArrayTest.test'
import globalTest7 from './ConcurrentUint16ArrayTest.test'
import globalTest8 from './ConcurrentUint32ArrayTest.test'
import globalTest9 from './ConcurrentUint8ClampedArrayTest.test'

export default function testsuite() {
  SendableTest();
  globalTest1();
  globalTest2();
  globalTest3();
  globalTest4();
  int8ArrayTest();
  Int16ArrayGlobalTest();
  Int32ArrayGlobalTest();
  Float32ArrayGlobalTest();
  globalTest5();
  globalTest6();
  globalTest7();
  globalTest8();
  globalTest9();
}