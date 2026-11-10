'use static';
import arkTSUtilsLockTest from "./ArkTSUtilsLock.test";
import LockTest from "./LockTest.test";
import AsyncLockTest from "./AsyncLockTest.test";
import AsyncLockTaskPoolStaticTest from "./AsyncLockTaskPoolStatic.test";
export default function testsuite(): void {
  arkTSUtilsLockTest();
  LockTest();
  AsyncLockTest();
  AsyncLockTaskPoolStaticTest();
}
