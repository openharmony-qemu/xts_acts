'use static';
import TabContentTest from './TabContentTest/TabContent.test';
import TabBarOptionsCoverageTest from './TabContentTest/TabBarOptionsCoverage.test';

export default function testsuite(): void {
  TabContentTest();
  TabBarOptionsCoverageTest();
}