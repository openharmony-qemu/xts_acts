'use static';
import CustomComponentTest from './CustomComponentTest/CustomComponent.test';
import CustomComponentLifecycleTest from './CustomComponentTest/CustomComponentLifecycle.test';
import CustomEnvIndex from './CustomComponentTest/CustomEnvIndex.test';
import CustomEnvKeyCreateTest from './CustomComponentTest/CustomEnvKeyCreate.test';
import CustomEnvKeyAbnormalTest from './CustomComponentTest/CustomEnvKeyAbnormal.test';

export default function testsuite(): void {
  CustomComponentTest();
  CustomComponentLifecycleTest();
  CustomEnvIndex();
  CustomEnvKeyCreateTest();
  CustomEnvKeyAbnormalTest();
}
