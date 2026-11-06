'use static';

import ability from './Ability.test';
import StringDecoderOverviewTest from './utilText/stringdecoder/StringDecoderOverviewTest.test';
import StringDecoderWriteTest from './utilText/stringdecoder/StringDecoderWriteTest.test';
import TextDecoderConstructorTest from './utilText/textdecoder/TextDecoderConstructorTest.test';
import TextDecoderCreateTest from './utilText/textdecoder/TextDecoderCreateTest.test';
import TextDecoderDecodeToStringTest from './utilText/textdecoder/TextDecoderDecodeToStringTest.test';
import TextDecoderOverviewTest from './utilText/textdecoder/TextDecoderOverviewTest.test';
import TextDecoderPropertiesTest from './utilText/textdecoder/TextDecoderPropertiesTest.test';
import TextDecoderOptionsPropertiesTest from './utilText/textdecoderoptions/TextDecoderOptionsPropertiesTest.test';
import TextEncoderConstructorTest from './utilText/textencoder/TextEncoderConstructorTest.test';
import TextEncoderCreateTest from './utilText/textencoder/TextEncoderCreateTest.test';
import TextEncoderEncodeIntoTest from './utilText/textencoder/TextEncoderEncodeIntoTest.test';
import TextEncoderEncodeIntoUint8ArrayTest from './utilText/textencoder/TextEncoderEncodeIntoUint8ArrayTest.test';
import TextEncoderOverviewTest from './utilText/textencoder/TextEncoderOverviewTest.test';
import TextEncoderPropertiesTest from './utilText/textencoder/TextEncoderPropertiesTest.test';

export default function testsuite(): void {
  ability();
  StringDecoderOverviewTest();
  StringDecoderWriteTest();
  TextDecoderConstructorTest();
  TextDecoderCreateTest();
  TextDecoderDecodeToStringTest();
  TextDecoderOverviewTest();
  TextDecoderPropertiesTest();
  TextDecoderOptionsPropertiesTest();
  TextEncoderConstructorTest();
  TextEncoderCreateTest();
  TextEncoderEncodeIntoTest();
  TextEncoderEncodeIntoUint8ArrayTest();
  TextEncoderOverviewTest();
  TextEncoderPropertiesTest();
}
