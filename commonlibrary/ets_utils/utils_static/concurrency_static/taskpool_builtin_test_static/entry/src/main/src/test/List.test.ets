'use static';
/*
 * Copyright (c) 2026 RKH Corp.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import BigIntTest from './BigInt.test';
import BooleanTest from './Boolean.test';
import DataViewTest from './DataView.test';
import ErrorTest from './Error.test';
import globalTest from './Global.test';
import StringTest from './String.test';
import TypedArrayTest from './TypedArray.test';
import globalTest1 from './ConcurrentTest.test'
import globalTest2 from './ConcurrentSecondTest.test'
import globalTest3 from './ConcurrentThirdTest.test'
import supplyTest from './CoucurrentFourthTest.test';
import BuiltinsAsIntNTest from './BuiltinsAsIntNTest.test';
import BuiltinsConstructorTest from './BuiltinsConstructorTest.test';
import BuiltinsCharLiteralTest from './BuiltinsCharLiteralTest.test';
import BuiltinsFloatLiteralTest from './BuiltinsFloatLiteralTest.test';
import BuiltinsGenericsActTest from './BuiltinsGenericsActTest.test';
import BuiltinsMultilineStringLiteralTest from './BuiltinsMultilineStringLiteralTest.test';
import BuiltinsNullLiteralTest from './BuiltinsNullLiteralTest.test';
import builtinsNumberConstructorTest from './BuiltinsNumberConstructorTest.test';
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
import PromisifyTest from './promisify/Promisify.test';
import CallbackWrapperTest from './callbackWrapper/CallbackWrapper.test';
import containerList from './container/List.test';
import threadSafeContainerList from './threadSafeContainer/List.test';
import basicTypeList from './basicType/List.test';
import atomicList from './atomic/List.test';
import classInstanceList from './classInstance/List.test';
import nestedContainerList from './nestedContainer/List.test';
import asyncTaskList from './asyncTask/List.test';
import industryList from './industry/List.test';

export default function testsuite(): void {
  BigIntTest();
  BooleanTest();
  DataViewTest();
  ErrorTest();
  globalTest();
  StringTest();
  TypedArrayTest();
  globalTest1();
  globalTest2();
  globalTest3();
  supplyTest();
  BuiltinsAsIntNTest();
  BuiltinsCharLiteralTest();
  BuiltinsConstructorTest();
  BuiltinsFloatLiteralTest();
  BuiltinsGenericsActTest();
  BuiltinsMultilineStringLiteralTest();
  BuiltinsNullLiteralTest();
  builtinsNumberConstructorTest();
  asyncFunctionTest();
  asyncGeneratorTest();
  asyncIteratorTest();
  asyncAdvancedTest();
  asyncBoundaryTest();
  asyncGenericsTest();
  asyncInteropTest();
  asyncPerformanceTest();
  asyncRealWorldTest();
  asyncFirTest();
  asyncSecTest();
  IsAsyncFunctionTest();
  IsPromiseTest();
  IsSharedArrayBufferTest();
  PromiseChainTest();
  PromisifyTest();
  CallbackWrapperTest();
  containerList();
  threadSafeContainerList();
  basicTypeList();
  atomicList();
  classInstanceList();
  nestedContainerList();
  asyncTaskList();
  industryList();
}
