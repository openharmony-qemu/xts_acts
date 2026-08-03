'use static'
import AsyncLockConstructorTest from './AsyncLockConstructorTest.test';
import AsyncLockLockAsyncFirstOverloadTest from './AsyncLockLockAsyncFirstOverloadTest.test';
import AsyncLockLockAsyncSecondOverloadTest from './AsyncLockLockAsyncSecondOverloadTest.test';
import AsyncLockLockAsyncThirdOverloadTest from './AsyncLockLockAsyncThirdOverloadTest.test';
import AsyncLockNamePropertyTest from './AsyncLockNamePropertyTest.test';
import AsyncLockQueryStaticTest from './AsyncLockQueryStaticTest.test';
import AsyncLockQueryInstanceTest from './AsyncLockQueryInstanceTest.test';
import AsyncLockQueryAllTest from './AsyncLockQueryAllTest.test';
import AsyncLockRequestTest from './AsyncLockRequestTest.test';
import AsyncLockInfoTest from './AsyncLockInfoTest.test';
import AsyncLockOptionsConstructorTest from './AsyncLockOptionsConstructorTest.test';
import AsyncLockStatePropertyTest from './AsyncLockStatePropertyTest.test';
import AbortSignalPropertyTest from './AbortSignalPropertyTest.test';
import AsyncLockOptionsParameterizedConstructorTest from './AsyncLockOptionsParameterizedConstructorTest.test';
import AsyncLockCallbackTest from './AsyncLockCallbackTest.test'
import AsyncLockOptionsTest from './AsyncLockOptionsTest.test'

export default function testsuite(): void {
  AbortSignalPropertyTest();
  AsyncLockConstructorTest();
  AsyncLockLockAsyncFirstOverloadTest();
  AsyncLockRequestTest();
  AsyncLockNamePropertyTest();
  AsyncLockLockAsyncSecondOverloadTest();
  AsyncLockOptionsConstructorTest();
  AsyncLockOptionsParameterizedConstructorTest();
  AsyncLockQueryAllTest();
  AsyncLockLockAsyncThirdOverloadTest();
  AsyncLockInfoTest();
  AsyncLockQueryInstanceTest();
  AsyncLockCallbackTest()
  AsyncLockOptionsTest();
  AsyncLockStatePropertyTest();
  AsyncLockQueryStaticTest();

}