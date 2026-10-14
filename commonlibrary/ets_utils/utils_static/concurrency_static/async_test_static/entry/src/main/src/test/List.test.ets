'use static';
import asyncAdvancedTest from './AsyncAdvancedTest.test';
import asyncBoundaryTest from './AsyncBoundaryTest.test';
import asyncInteropTest from './AsyncInteropTest.test';
import asyncNestingTest from './AsyncNestingTestStatic.test';
import asyncPerformanceTest from './AsyncPerformanceTest.test';
import asyncRealWorldTest from './AsyncRealWorldTest.test';
import asyncFirTest from './AsyncFirTest.test';
import asyncSecTest from './AsyncSecTest.test';
export default function testsuite(): void {
  asyncAdvancedTest()
  asyncBoundaryTest()
  asyncInteropTest()
  asyncPerformanceTest()
  asyncRealWorldTest()
  asyncFirTest()
  asyncSecTest()
  asyncNestingTest()
}