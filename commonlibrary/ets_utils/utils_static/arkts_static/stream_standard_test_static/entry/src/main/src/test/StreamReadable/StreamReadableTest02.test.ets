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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import { stream, util } from '@kit.ArkTS';
import Utils from '../Util.test';

class TestReadable0201 extends stream.Readable {
  data: number[] = [1, 2, 3, 4, 5];
  index: int = 0;
  constructor() {
    super();
  }
  doRead(size: int) {
    if (this.index < this.data.length) {
      let chunk = new Uint8Array(1);
      chunk[0] = this.data[this.index++];
      this.push(chunk);
    } else {
      this.push(null);
    }
  }
}

class TestReadable0202 extends stream.Readable {
  constructor() {
    super();
  }
  doRead(size: int) {
    this.push(null);
  }
}

class TestReadable0203 extends stream.Readable {
  constructor() {
    super();
  }
  doRead(size: int) {
  }
}

class TestReadable0204 extends stream.Readable {
  constructor() {
    super();
  }
  doRead(size: int) {
    let arr = new Uint8Array(3);
    arr[0] = 1;
    arr[1] = 2;
    arr[2] = 3;
    this.push(arr);
  }
}

class TestReadable0205 extends stream.Readable {
  data: number[] = [10, 20, 30];
  index: int = 0;
  constructor() {
    super();
  }
  doRead(size: int) {
    if (this.index < this.data.length) {
      let chunk = new Uint8Array(1);
      chunk[0] = this.data[this.index++];
      this.push(chunk);
    } else {
      this.push(null);
    }
  }
}

function createReadable(): stream.Readable {
  return new stream.Readable();
}


export default function StreamReadable02Test(): void {
  describe('StreamReadable02Test', () => {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTWO_0100
     * @tc.name      testStreamReadable02Chapter0001
     * @tc.desc      Test reading data from readable stream and collecting chunks
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamReadable02Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0201();
      let collected: Uint8Array[] = new Array<Uint8Array>();

      readableStream.on('data', (chunk: Object) => {
        collected.push(chunk as Uint8Array);
      });

      readableStream.on('end', () => {
        console.info("Stream ended, collected length:", collected.length);
        expect(collected.length).assertEqual(5);
      });

      readableStream.resume();
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTWO_0200
     * @tc.name      testStreamReadable02Chapter0003
     * @tc.desc      Test pause on readable stream with empty doRead
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamReadable02Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0203();
      let pauseSucceeded = false;
      let errorCaught = false;

      try {
        let pauseResult = readableStream.pause();
        pauseSucceeded = true;
        expect(pauseResult).assertEqual(readableStream);
      } catch (error) {
        errorCaught = true;
        expect(error.code).assertEqual(401);
      }

      expect(pauseSucceeded).assertEqual(true);
      expect(errorCaught).assertEqual(false);
      expect(readableStream.isPaused()).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTWO_0300
     * @tc.name      testStreamReadable02Chapter0004
     * @tc.desc      Test pause returns the readable stream instance and sets paused state
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamReadable02Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0204();
      let result = readableStream.pause();
      console.info("Pause result type:", typeof result);
      expect(result).assertEqual(readableStream);
      expect(readableStream.isPaused()).assertTrue();
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMREADABLETESTTWO_0400
     * @tc.name      testStreamReadable02Chapter0005
     * @tc.desc      Test switching between pause and resume multiple times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStreamReadable02Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let readableStream = new TestReadable0205();
      readableStream.pause();
      expect(readableStream.isPaused()).assertTrue();

      readableStream.resume();
      expect(readableStream.isPaused()).assertFalse();

      readableStream.pause();
      expect(readableStream.isPaused()).assertTrue();
      console.info("Successfully switched between pause and resume");
    })
  })
}
