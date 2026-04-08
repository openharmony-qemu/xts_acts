'use static';
import TextAttributeTest from './TextTest/TextAttribute.test';
import TextDirectionTest from './TextTest/TextDirection.test';

export default function testsuite() {
  TextAttributeTest();
  TextDirectionTest();
}