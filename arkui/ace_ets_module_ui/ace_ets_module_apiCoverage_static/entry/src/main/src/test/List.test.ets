'use static'
import CoverageStaticTest from './CoverageTest/CoverageStatic.test';
import Coverage0917StaticTest from './CoverageTest/Coverage0917Static.test';
import TabsApiCoverageStaticTest from './CoverageTest/TabsApiCoverageStatic.test';

export default function testsuite(): void {
  CoverageStaticTest();
  Coverage0917StaticTest();
  TabsApiCoverageStaticTest();
}
