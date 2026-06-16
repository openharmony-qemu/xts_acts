'use static';
import CustomComponentTest from './CustomComponentTest/CustomComponent.test';
import CustomComponentLifecycleTest from './CustomComponentTest/CustomComponentLifecycle.test';
import CustomEnvIndex from './CustomComponentTest/CustomEnvIndex.test';

export default function testsuite() {
  CustomComponentTest();
  CustomComponentLifecycleTest();
  CustomEnvIndex();
}
