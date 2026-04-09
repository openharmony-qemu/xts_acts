'use static';
import TextCommonTest from './TextCommonTest/TextCommon.test';
import TextCommonUITest from './TextCommonTest/TextCommonUI.test';

export default function testsuite() {
  TextCommonTest();
  TextCommonUITest();
}