import { describe, it, expect } from 'jsunit_lite/index';
import assertTest from './Assert.test';
import lifecycleTest from './Lifecycle.test';
import skipErrorTest from './SkipError.test';
import coreTest from './Core.test';
import reportTest from './Report.test';
import constantTest from './Constant.test';
import kernelTest from './Kernel.test';

export default function testsuite() {
    assertTest();
    lifecycleTest();
    skipErrorTest();
    coreTest();
    reportTest();
    constantTest();
    kernelTest();
}
