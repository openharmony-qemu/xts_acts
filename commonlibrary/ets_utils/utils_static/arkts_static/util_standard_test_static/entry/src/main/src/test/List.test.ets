/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import UtilTest from './UtilInterface.test';
import Util2Test from './util/UtilInterface2.test';
import Base64HelperTest from './util/Base64HelperTest.test';
import Base64Helper02Test from './util/Base64HelperTest02.test';
import Base64Helper03Test from './util/Base64HelperTest03.test';
import LRUCacheTest from './util/LRUCacheTest.test';
import LRUCache02Test from './util/LRUCacheTest02.test';
import LRUCache03Test from './util/LRUCacheTest03.test';
import LRUCache04Test from './util/LRUCacheTest04.test';
import LRUCache05Test from './util/LRUCacheTest05.test';
import RationalNumberTest from './util/RationalNumberTest.test';
import RationalNumber02Test from './util/RationalNumberTest02.test';
import RationalNumber03Test from './util/RationalNumberTest03.test';
import RationalNumber04Test from './util/RationalNumberTest04.test';
import StringDecoder01Test from './util/StringDecoderTest01.test';
import StringDecoder02Test from './util/StringDecoderTest02.test';
import TextDecoderTest from './util/TextDecoderTest.test';
import TextDecoder02Test from './util/TextDecoderTest02.test';
import TextEncoderTest from './util/TextEncoderTest.test';
import TextEncoder02Test from './util/TextEncoderTest02.test';
import Util1Test from './util/Util.test';

export default function testsuite() {
  UtilTest();
  Util2Test();
  Base64HelperTest();
  Base64Helper02Test();
  Base64Helper03Test();
  LRUCacheTest();
  LRUCache02Test();
  LRUCache03Test();
  LRUCache04Test();
  LRUCache05Test();
  RationalNumberTest();
  RationalNumber02Test();
  RationalNumber03Test();
  RationalNumber04Test();
  StringDecoder01Test();
  StringDecoder02Test();
  TextDecoderTest();
  TextDecoder02Test();
  TextEncoderTest();
  TextEncoder02Test();
  Util1Test();
}
