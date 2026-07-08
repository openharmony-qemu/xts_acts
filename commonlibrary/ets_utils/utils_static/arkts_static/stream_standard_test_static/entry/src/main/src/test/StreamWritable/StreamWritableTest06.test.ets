'use static';
﻿/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium-binary/src/main/indexStatic';
import { stream, util } from '@kit.ArkTS';
import Utils from '../Util.test';

class TestWritable extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: () => void): void {
    callback();
  }
}

export default function StreamWritable06Test(): void {
  describe('StreamWritable06Test', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(async (): Promise<void> => {
      await Utils.msSleep(10)
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSIX_0100
     * @tc.name      testStreamWritable06Chapter0001
     * @tc.desc      Test off with NaN as event name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable06Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let writableStream: stream.Writable = new TestWritable();

      try {
        writableStream.off('NaN');
        expect(typeof writableStream.off).assertEqual('function');
      } catch (err) {
        expect(err.code).assertEqual(undefined);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSIX_0200
     * @tc.name      testStreamWritable06Chapter0002
     * @tc.desc      Test off with '0' as event name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable06Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let writableStream: stream.Writable = new TestWritable();

      let offSucceeded = false;
      try {
        writableStream.off('0');
        offSucceeded = true;
        expect(typeof writableStream.off).assertEqual('function');
      } catch (err) {
        expect(err.code).assertEqual(401);
      }

      expect(offSucceeded).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSIX_0300
     * @tc.name      testStreamWritable06Chapter0003
     * @tc.desc      Test off with unregistered finish listener
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable06Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let writableStream: stream.Writable = new TestWritable();
      let testListenerCalled: boolean = false;
      let testListener = (): void => {
        testListenerCalled = true;
      };
      writableStream.on('finish', (): void => {
      });
      writableStream.off('finish', testListener);
      writableStream.end();
      setTimeout(() => {
        expect(testListenerCalled).assertFalse();
      }, 10);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSIX_0400
     * @tc.name      testStreamWritable06Chapter0004
     * @tc.desc      Test off with invalid event name 'notvalid'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable06Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let writableStream: stream.Writable = new TestWritable();

      let offSucceeded = false;
      try {
        writableStream.off('notvalid');
        offSucceeded = true;
        expect(typeof writableStream.off).assertEqual('function');
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
      expect(offSucceeded).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSIX_0500
     * @tc.name      testStreamWritable06Chapter0005
     * @tc.desc      Test off with large JSON-like string as event name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable06Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let init: (size: number) => string = (size: number): string => {
        let ans = '[';
        while (ans.length < size) {
          ans += '{"a":1},';
        }
        ans += '{"a":1}]';
        return ans;
      };

      let writableStream: stream.Writable = new TestWritable();

      let offSucceeded = false;
      try {
        let treeString = init(1000);
        expect(treeString.length).assertLarger(0);
        writableStream.off(treeString);
        offSucceeded = true;
        expect(typeof writableStream.off).assertEqual('function');
      } catch (err) {
        expect(err.code).assertEqual(401);
      }

      expect(offSucceeded).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSIX_0600
     * @tc.name      testStreamWritable06Chapter0006
     * @tc.desc      Test off with truncated object-like string as event name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable06Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let writableStream: stream.Writable = new TestWritable();

      let offSucceeded = false;
      try {
        let str = "{k1:value1,k2:value2}";
        expect(str.length).assertLarger(0);
        let sliceStr = str.substring(0, str.length - 2);
        expect(sliceStr.length).assertLarger(0);
        writableStream.off(sliceStr);
        offSucceeded = true;
        expect(typeof writableStream.off).assertEqual('function');
      } catch (err) {
        expect(err.code).assertEqual(401);
      }

      expect(offSucceeded).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSIX_0700
     * @tc.name      testStreamWritable06Chapter0007
     * @tc.desc      Test off with large repeated string as event name
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable06Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let writableStream: stream.Writable = new TestWritable();

      let offSucceeded = false;
      try {
        let largeStr = "a".repeat(100000);
        expect(largeStr.length).assertEqual(100000);
        writableStream.off(largeStr);
        offSucceeded = true;
        expect(typeof writableStream.off).assertEqual('function');
      } catch (err) {
        expect(err.code).assertEqual(401);
      }

      expect(offSucceeded).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMWRITABLETESTSIX_0800
     * @tc.name      testStreamWritable06Chapter0008
     * @tc.desc      Test off with large repeated string in block scope
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStreamWritable06Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let writableStream: stream.Writable = new TestWritable();

      let offSucceeded = false;
      try {
        {
          let largeStr = "b".repeat(100000);
          expect(largeStr.length).assertEqual(100000);
          writableStream.off(largeStr);
          offSucceeded = true;
        }

        expect(typeof writableStream.off).assertEqual('function');
      } catch (err) {
        expect(err.code).assertEqual(401);
      }

      expect(offSucceeded).assertEqual(true);
    });
  })
}
