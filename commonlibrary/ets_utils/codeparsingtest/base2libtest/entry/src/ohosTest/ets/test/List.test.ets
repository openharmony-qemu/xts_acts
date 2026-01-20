import LRUCacheTest from './util/LRUCacheTest.test'
import TextDecoderTest from './util/TextDecoderTest.test'
import Base64HelperTest from './util/Base64HelperTest.test'
import StringDecoder01Test from './util/StringDecoderTest01.test'
import StringDecoder02Test from './util/StringDecoderTest02.test'
import RationalNumberTest from './util/RationalNumberTest.test'
import TextEncoderTest from './util/TextEncoderTest.test'
import XmlTest01 from "./util/xml/XmlTest01.test"
import XmlTest02 from "./util/xml/XmlTest02.test"
import XmlTest03 from "./util/xml/XmlTest03.test"
import XmlTest04 from "./util/xml/XmlTest04.test"
import XmlTest05 from "./util/xml/XmlTest05.test"
import XmlTest06 from "./util/xml/XmlTest06.test"
import XmlTest07 from "./util/xml/XmlTest07.test"
import XmlTest08 from "./util/xml/XmlTest08.test"
import StreamTest01 from "./util/stream/StreamTest01.test"
import StreamTest02 from "./util/stream/StreamTest02.test"
import StreamTest03 from "./util/stream/StreamTest03.test"
import StreamTest04 from "./util/stream/StreamTest04.test"
import StreamTest05 from "./util/stream/StreamTest05.test"
import StreamTest06 from "./util/stream/StreamTest06.test"
import StreamTest07 from "./util/stream/StreamTest07.test"
import StreamTest08 from "./util/stream/StreamTest08.test"
import StreamTest09 from "./util/stream/StreamTest09.test"
import StreamTest10 from "./util/stream/StreamTest10.test"

export default function testsuite() {
  LRUCacheTest();
  TextDecoderTest();
  Base64HelperTest();
  StringDecoder01Test();
  StringDecoder02Test();
  RationalNumberTest(); 
  TextEncoderTest();
  XmlTest01();
  XmlTest02();
  XmlTest03();
  XmlTest04();
  XmlTest05();
  XmlTest06();
  XmlTest07();
  XmlTest08();
  StreamTest01();
  StreamTest02();
  StreamTest03();
  StreamTest04();
  StreamTest05();
  StreamTest06();
  StreamTest07();
  StreamTest08();
  StreamTest09();
  StreamTest10();
};

