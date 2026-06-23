import asyncFunctionTest from './async/asyncFunctionTest.test';
import asyncGeneratorTest from './async/asyncGeneratorTest.test';
import asyncIteratorTest from './async/asyncIteratorTest.test';
import asyncAdvancedTest from './async/AsyncAdvancedTest.test';
import asyncBoundaryTest from './async/AsyncBoundaryTest.test';
import asyncGenericsTest from './async/AsyncGenericsTest.test';
import asyncInteropTest from './async/AsyncInteropTest.test';
import asyncPerformanceTest from './async/AsyncPerformanceTest.test';
import asyncRealWorldTest from './async/AsyncRealWorldTest.test';
import asyncFirTest from './async/AsyncFirTest.test';
import asyncSecTest from './async/AsyncSecTest.test';
import IsAsyncFunctionTest from './isAsyncFunction/IsAsyncFunction.test';
import IsPromiseTest from './isPromise/IsPromise.test';
import IsSharedArrayBufferTest from './isSharedArrayBuffer/IsSharedArrayBuffer.test';
import PromiseChainTest from './promise/PromiseChain.test';
import CallbackWrapperTest from './callbackWrapper/CallbackWrapper.test';
import PromisifyTest from './promisify/Promisify.test';

export default function testsuite() {
  asyncFunctionTest()
  asyncGeneratorTest()
  asyncIteratorTest()
  asyncAdvancedTest()
  asyncBoundaryTest()
  asyncGenericsTest()
  asyncInteropTest()
  asyncPerformanceTest()
  asyncRealWorldTest()
  asyncFirTest()
  asyncSecTest()
  IsAsyncFunctionTest();
  IsPromiseTest();
  IsSharedArrayBufferTest();
  PromiseChainTest();
  PromisifyTest();
  CallbackWrapperTest();
}