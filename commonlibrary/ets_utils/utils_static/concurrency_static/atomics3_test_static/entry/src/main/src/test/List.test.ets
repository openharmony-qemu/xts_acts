'use static'

/*
 * Copyright (c) 2026 RKH Corp.
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

import atomicBooleanCompareAndSwapTest from "./atomicBoolean/AtomicBooleanCompareAndSwapTest.test";
import atomicBooleanConstructorTest from "./atomicBoolean/AtomicBooleanConstructorTest.test";
import atomicBooleanExchangeTest from "./atomicBoolean/AtomicBooleanExchangeTest.test";
import atomicBooleanIsLockFreeTest from "./atomicBoolean/AtomicBooleanIsLockFreeTest.test";
import atomicBooleanLoadTest from "./atomicBoolean/AtomicBooleanLoadTest.test";
import atomicBooleanStoreTest from "./atomicBoolean/AtomicBooleanStoreTest.test";
import atomicCharCompareAndSwapTest from "./atomicChar/AtomicCharCompareAndSwap.test";
import atomicCharConstructorTest from "./atomicChar/AtomicCharConstructor.test";
import atomicCharExchangeTest from "./atomicChar/AtomicCharExchange.test";
import atomicCharIsLockFreeTest from "./atomicChar/AtomicCharIsLockFree.test";
import atomicCharLoadTest from "./atomicChar/AtomicCharLoad.test";
import atomicCharStoreTest from "./atomicChar/AtomicCharStore.test";
import atomicDoubleCompareAndSwapTest from "./atomicDouble/AtomicDoubleCompareAndSwap.test";
import atomicDoubleConstructorTest from "./atomicDouble/AtomicDoubleConstructor.test";
import atomicDoubleExchangeTest from "./atomicDouble/AtomicDoubleExchange.test";
import atomicDoubleFetchAddTest from "./atomicDouble/AtomicDoubleFetchAdd.test";
import atomicDoubleFetchSubTest from "./atomicDouble/AtomicDoubleFetchSub.test";
import atomicDoubleIsLockFreeTest from "./atomicDouble/AtomicDoubleIsLockFree.test";
import atomicDoubleLoadTest from "./atomicDouble/AtomicDoubleLoad.test";
import atomicDoubleStoreTest from "./atomicDouble/AtomicDoubleStore.test";
import atomicIntCompareAndSwapTest from "./atomicInt/AtomicIntCompareAndSwap.test";
import atomicIntConstructorTest from "./atomicInt/AtomicIntConstructor.test";
import atomicIntExchangeTest from "./atomicInt/AtomicIntExchange.test";
import atomicIntFetchAddTest from "./atomicInt/AtomicIntFetchAdd.test";
import atomicIntFetchAndTest from "./atomicInt/AtomicIntFetchAnd.test";
import atomicIntFetchOrTest from "./atomicInt/AtomicIntFetchOr.test";
import atomicIntFetchSubTest from "./atomicInt/AtomicIntFetchSub.test";
import atomicIntFetchXorTest from "./atomicInt/AtomicIntFetchXor.test";
import atomicIntIsLockFreeTest from "./atomicInt/AtomicIntIsLockFree.test";
import atomicIntLoadTest from "./atomicInt/AtomicIntLoad.test";
import atomicLongCompareAndSwapTest from "./atomicLong/AtomicLongCompareAndSwap.test";
import atomicLongConstructorTest from "./atomicLong/AtomicLongConstructor.test";
import atomicLongExchangeTest from "./atomicLong/AtomicLongExchange.test";
import atomicLongFetchAddTest from "./atomicLong/AtomicLongFetchAdd.test";
import atomicLongFetchAndTest from "./atomicLong/AtomicLongFetchAnd.test";
import atomicLongFetchOrTest from "./atomicLong/AtomicLongFetchOr.test";
import atomicLongFetchSubTest from "./atomicLong/AtomicLongFetchSub.test";
import atomicLongFetchXorTest from "./atomicLong/AtomicLongFetchXor.test";
import atomicLongIsLockFreeTest from "./atomicLong/AtomicLongIsLockFree.test";
import atomicLongStoreTest from "./atomicLong/AtomicLongStore.test";
import atomicShortCompareAndSwapTest from "./atomicShort/AtomicShortCompareAndSwap.test";
import atomicShortConstructorTest from "./atomicShort/AtomicShortConstructor.test";
import atomicShortExchangeTest from "./atomicShort/AtomicShortExchange.test";
import atomicShortFetchAddTest from "./atomicShort/AtomicShortFetchAdd.test";
import atomicShortFetchAndTest from "./atomicShort/AtomicShortFetchAnd.test";
import atomicShortFetchOrTest from "./atomicShort/AtomicShortFetchOr.test";
import atomicShortFetchSubTest from "./atomicShort/AtomicShortFetchSub.test";
import atomicShortFetchXorTest from "./atomicShort/AtomicShortFetchXor.test";
import atomicShortIsLockFreeTest from "./atomicShort/AtomicShortIsLockFree.test";
import atomicShortLoadTest from "./atomicShort/AtomicShortLoad.test";
import atomicShortStoreTest from "./atomicShort/AtomicShortStore.test";
import AtomicByteCompareAndSwapTest from "./atomicByte/AtomicByteCompareAndSwapTest.test";
import AtomicByteConstructorTest from "./atomicByte/AtomicByteConstructorTest.test";
import AtomicByteExchangeTest from "./atomicByte/AtomicByteExchangeTest.test";
import AtomicByteFetchAddExtendedTest from "./atomicByte/AtomicByteFetchAddExtendedTest.test";
import AtomicByteFetchAddTest from "./atomicByte/AtomicByteFetchAddTest.test";
import AtomicByteFetchAndTest from "./atomicByte/AtomicByteFetchAndTest.test";
import AtomicByteFetchOrTest from "./atomicByte/AtomicByteFetchOrTest.test";
import AtomicByteFetchSubTest from "./atomicByte/AtomicByteFetchSubTest.test";
import AtomicByteFetchXorTest from "./atomicByte/AtomicByteFetchXorTest.test";
import AtomicByteLoadTest from "./atomicByte/AtomicByteLoadTest.test";
import AtomicByteIsLockFreeTest from "./atomicByte/AtomicByteIsLockFreeTest.test";
import AtomicByteStoreTest from "./atomicByte/AtomicByteStoreTest.test";
import AtomicFloatConstructorTest from "./atomicFloat/AtomicFloatConstructorTest.test";
import AtomicFloatCompareAndSwapTest from "./atomicFloat/AtomicFloatCompareAndSwapTest.test";
import AtomicFloatExchangeTest from "./atomicFloat/AtomicFloatExchangeTest.test";
import AtomicFloatFetchAddTest from "./atomicFloat/AtomicFloatFetchAddTest.test";
import AtomicFloatFetchSubTest from "./atomicFloat/AtomicFloatFetchSubTest.test";
import AtomicFloatIsLockFreeTest from "./atomicFloat/AtomicFloatIsLockFreeTest.test";
import AtomicFloatLoadTest from "./atomicFloat/AtomicFloatLoadTest.test";
import AtomicFloatStoreTest from "./atomicFloat/AtomicFloatStoreTest.test";
import AtomicReferenceCompareAndSwapTest from "./atomicReference/AtomicReferenceCompareAndSwapTest.test";
import AtomicReferenceConstructorTest from "./atomicReference/AtomicReferenceConstructorTest.test";
import AtomicReferenceIsLockFreeTest from "./atomicReference/AtomicReferenceIsLockFreeTest.test";
import AtomicReferenceExchangeTest from "./atomicReference/AtomicReferenceExchangeTest.test";
import AtomicReferenceLoadTest from "./atomicReference/AtomicReferenceLoadTest.test";
import AtomicReferenceStoreTest from "./atomicReference/AtomicReferenceStoreTest.test";

export default function testsuite(): void {
  atomicBooleanCompareAndSwapTest()
  atomicBooleanConstructorTest()
  atomicBooleanExchangeTest()
  atomicBooleanIsLockFreeTest()
  atomicBooleanLoadTest()
  atomicBooleanStoreTest()

  atomicCharCompareAndSwapTest()
  atomicCharConstructorTest()
  atomicCharExchangeTest()
  atomicCharIsLockFreeTest()
  atomicCharLoadTest()
  atomicCharStoreTest()

  atomicDoubleCompareAndSwapTest()
  atomicDoubleConstructorTest()
  atomicDoubleExchangeTest()
  atomicDoubleFetchAddTest()
  atomicDoubleFetchSubTest()
  atomicDoubleIsLockFreeTest()
  atomicDoubleLoadTest()
  atomicDoubleStoreTest()

  atomicIntCompareAndSwapTest()
  atomicIntConstructorTest()
  atomicIntExchangeTest()
  atomicIntFetchAddTest()
  atomicIntFetchAndTest()
  atomicIntFetchOrTest()
  atomicIntFetchSubTest()
  atomicIntFetchXorTest()
  atomicIntIsLockFreeTest()
  atomicIntLoadTest()

  atomicLongCompareAndSwapTest()
  atomicLongConstructorTest()
  atomicLongExchangeTest()
  atomicLongFetchAddTest()
  atomicLongFetchAndTest()
  atomicLongFetchOrTest()
  atomicLongFetchSubTest()
  atomicLongFetchXorTest()
  atomicLongIsLockFreeTest()
  atomicLongStoreTest()

  atomicShortCompareAndSwapTest()
  atomicShortConstructorTest()
  atomicShortExchangeTest()
  atomicShortFetchAndTest()
  atomicShortFetchAddTest()
  atomicShortFetchOrTest()
  atomicShortFetchSubTest()
  atomicShortFetchXorTest()
  atomicShortIsLockFreeTest()
  atomicShortLoadTest()
  atomicShortStoreTest()

  AtomicByteConstructorTest()
  AtomicByteCompareAndSwapTest()
  AtomicByteExchangeTest()
  AtomicByteFetchAddExtendedTest()
  AtomicByteFetchAddTest()
  AtomicByteFetchAndTest()
  AtomicByteFetchSubTest()
  AtomicByteFetchOrTest()
  AtomicByteFetchXorTest()
  AtomicByteIsLockFreeTest()
  AtomicByteLoadTest()
  AtomicByteStoreTest()


  AtomicFloatCompareAndSwapTest()
  AtomicFloatConstructorTest()
  AtomicFloatExchangeTest()
  AtomicFloatFetchAddTest()
  AtomicFloatFetchSubTest()
  AtomicFloatIsLockFreeTest()
  AtomicFloatLoadTest()
  AtomicFloatStoreTest()

  AtomicReferenceCompareAndSwapTest()
  AtomicReferenceExchangeTest()
  AtomicReferenceConstructorTest()
  AtomicReferenceIsLockFreeTest()
  AtomicReferenceLoadTest()
  AtomicReferenceStoreTest()
}
