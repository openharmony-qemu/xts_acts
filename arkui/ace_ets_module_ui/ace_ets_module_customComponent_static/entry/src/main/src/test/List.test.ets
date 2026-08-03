'use static';
import CustomComponentTest from './CustomComponentTest/CustomComponent.test';
import CustomComponentLifecycleTest from './CustomComponentTest/CustomComponentLifecycle.test';
import CustomEnvKeyCreateTest from './CustomComponentTest/CustomEnvKeyCreate.test';
import CustomEnvKeyAbnormalTest from './CustomComponentTest/CustomEnvKeyAbnormal.test';

export default function testsuite(): void {
  CustomComponentTest();
  CustomComponentLifecycleTest();
  CustomEnvKeyCreateTest();
  CustomEnvKeyAbnormalTest();
}
