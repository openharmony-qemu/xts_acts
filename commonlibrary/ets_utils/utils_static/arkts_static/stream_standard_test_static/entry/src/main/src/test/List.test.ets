'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import streamTest from './StreamTest.test'

import StreamTest_01 from "./Stream/StreamTest01.test";
import StreamTest_04 from "./Stream/StreamTest04.test";
import StreamTest_05 from "./Stream/StreamTest05.test";
import StreamTest_06 from "./Stream/StreamTest06.test";
import StreamTest_07 from "./Stream/StreamTest07.test";
import StreamTest_08 from "./Stream/StreamTest08.test";
import StreamTest_09 from "./Stream/StreamTest09.test";
import StreamTest_10 from "./Stream/StreamTest10.test";

import StreamDuplex01Test from "./StreamDuplex/StreamDuplexTest01.test";
import StreamDuplex02Test from "./StreamDuplex/StreamDuplexTest02.test";
import StreamDuplex03Test from "./StreamDuplex/StreamDuplexTest03.test";
import StreamDuplex04Test from "./StreamDuplex/StreamDuplexTest04.test";
import StreamDuplex05Test from "./StreamDuplex/StreamDuplexTest05.test";
import StreamDuplex06Test from "./StreamDuplex/StreamDuplexTest06.test";
import StreamDuplex07Test from "./StreamDuplex/StreamDuplexTest07.test";
import StreamDuplex08Test from "./StreamDuplex/StreamDuplexTest08.test";

import StreamReadable01Test from "./StreamReadable/StreamReadableTest01.test";
import StreamReadable02Test from "./StreamReadable/StreamReadableTest02.test";
import StreamReadable03Test from "./StreamReadable/StreamReadableTest03.test";
import StreamReadable05Test from "./StreamReadable/StreamReadableTest05.test";

import StreamWritable01Test from "./StreamWritable/StreamWritableTest01.test";
import StreamWritable02Test from "./StreamWritable/StreamWritableTest02.test";
import StreamWritable03Test from "./StreamWritable/StreamWritableTest03.test";
import StreamWritable04Test from "./StreamWritable/StreamWritableTest04.test";
import StreamWritable05Test from "./StreamWritable/StreamWritableTest05.test";
import StreamWritable06Test from "./StreamWritable/StreamWritableTest06.test";
import StreamWritable07Test from "./StreamWritable/StreamWritableTest07.test";
import StreamWritable08Test from "./StreamWritable/StreamWritableTest08.test";

export default function testsuite(): void {
  streamTest();

  StreamWritable01Test();
  StreamWritable02Test();
  StreamWritable03Test();
  StreamWritable04Test();
  StreamWritable05Test();
  StreamWritable06Test();
  StreamWritable07Test();
  StreamWritable08Test();

  StreamTest_04();
  StreamTest_05();
  StreamTest_06();
  StreamTest_07();
  StreamTest_08();
  StreamTest_09();
  StreamTest_10();

  StreamTest_01();

  StreamDuplex01Test();
  StreamDuplex02Test();
  StreamDuplex03Test();
  StreamDuplex04Test();
  StreamDuplex05Test();
  StreamDuplex06Test();
  StreamDuplex07Test();
  StreamDuplex08Test();

  StreamReadable05Test();

  StreamReadable01Test();
  StreamReadable02Test();
  StreamReadable03Test();

}
