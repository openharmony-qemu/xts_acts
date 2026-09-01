import base64HelperTest from './Base64Helper/Base64HelperTest.test';
import base64HelperTest02 from './Base64Helper/Base64HelperTest02.test';
import base64HelperTest03 from './Base64Helper/Base64HelperTest03.test';

import jsonTest from './json/Json.test';
import jsonTest01 from './json/JsonTest01.test';
import jsonTest02 from './json/JsonTest02.test';
import jsonTest03 from './json/JsonTest03.test';
import jsonTest04 from './json/JsonTest04.test';
import jsonTest05 from './json/JsonTest05.test';
import jsonTest06 from './json/JsonTest06.test';

import lruCacheBaseTest from './LRUCache/LRUCache.test';
import lruCacheTest from './LRUCache/LRUCacheTest.test';
import lruCacheTest02 from './LRUCache/LRUCacheTest02.test';
import lruCacheTest03 from './LRUCache/LRUCacheTest03.test';
import lruCacheTest04 from './LRUCache/LRUCacheTest04.test';
import lruCacheTest05 from './LRUCache/LRUCacheTest05.test';

import rationalNumberTest from './RationalNumber/RationalNumberTest.test';
import rationalNumberTest02 from './RationalNumber/RationalNumberTest02.test';
import rationalNumberTest03 from './RationalNumber/RationalNumberTest03.test';
import rationalNumberTest04 from './RationalNumber/RationalNumberTest04.test';

import stringDecoderBaseTest from './StringDecoder/StringDecoder.test';
import stringDecoderTest01 from './StringDecoder/StringDecoderTest01.test';
import stringDecoderTest02 from './StringDecoder/StringDecoderTest02.test';

import textDecoderTest from './TextDecode/TextDecoderTest.test';
import textDecoderTest02 from './TextDecode/TextDecoderTest02.test';

import textEncoderTest from './TextEncode/TextEncoderTest.test';
import textEncoderTest02 from './TextEncode/TextEncoderTest02.test';

import utilTest from './util/Util.test';
import util2Test from './util/Util2.test';
import util3Test from './util/Util3.test';
import utilTypeTest from './util/UtilType.test';
import vmHeapMemoryPressureTest from './util/VMHeapMemoryPressureTest.test';

export default function testsuite() {
  base64HelperTest();
  base64HelperTest02();
  base64HelperTest03();
  jsonTest();
  jsonTest01();
  jsonTest02();
  jsonTest03();
  jsonTest04();
  jsonTest05();
  jsonTest06();
  lruCacheBaseTest();
  lruCacheTest();
  lruCacheTest02();
  lruCacheTest03();
  lruCacheTest04();
  lruCacheTest05();
  rationalNumberTest();
  rationalNumberTest02();
  rationalNumberTest03();
  rationalNumberTest04();
  stringDecoderBaseTest();
  stringDecoderTest01();
  stringDecoderTest02();
  textDecoderTest();
  textDecoderTest02();
  textEncoderTest();
  textEncoderTest02();
  utilTest();
  util2Test();
  util3Test();
  utilTypeTest();
  vmHeapMemoryPressureTest();
}
