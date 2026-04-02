'use static';
import XComponentTest from './XComponentTest/XComponent.test';
import XComponentHdrBrightnessTest from './XComponentHdrBrightnessTest/XComponentHdrBrightness.test';
import ComponentContentApiTest from './ComponentContentApiTest/ComponentContentApi.test';

export default function testsuite() {
  XComponentTest();
  XComponentHdrBrightnessTest();
  ComponentContentApiTest();
}