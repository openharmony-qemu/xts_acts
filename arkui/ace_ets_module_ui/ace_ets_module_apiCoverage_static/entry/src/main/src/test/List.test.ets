'use static'
import CoverageStaticTest from './CoverageTest/CoverageStatic.test';
import Coverage0917StaticTest from './CoverageTest/Coverage0917Static.test';
import TabsApi12CoverageStaticTest from './CoverageTest/TabsApi12CoverageStatic.test';
import TabsApiCoverageStaticTest from './CoverageTest/TabsApiCoverageStatic.test';
import TabsApiCoverageAbnormalStaticTest from './CoverageTest/TabsApiCoverageAbnormalStatic.test';

export default function testsuite(): void {
  CoverageStaticTest();
  Coverage0917StaticTest();
  TabsApi12CoverageStaticTest();
  // Abnormal before Static: avoid router.clear teardown SIGSEGV into Abnormal page
  TabsApiCoverageAbnormalStaticTest();
  TabsApiCoverageStaticTest();
}
