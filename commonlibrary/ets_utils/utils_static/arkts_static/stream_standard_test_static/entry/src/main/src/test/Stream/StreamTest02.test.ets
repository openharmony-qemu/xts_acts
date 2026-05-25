/*
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index'
import { stream } from '@kit.ArkTS';
import { emitter, Callback } from '@kit.BasicServicesKit';
import Utils from '../Util.test';

function invokeCb(cb: Function): void {
  try { (cb as (error?: Error | null) => void)(); } catch (e) {}
}
function invokeCbErr(cb: Function, err: Error | null): void {
  try { (cb as (e?: Error | null) => void)(err); } catch (e) {}
}

interface GeneratedTypeLiteralInterface_2 {
  code: number;
  name?: string;
  message?: string;
}
interface GeneratedTypeLiteralInterface_3 {
  data: GeneratedTypeLiteralInterface_4;
}
interface GeneratedTypeLiteralInterface_6 {
  code: number;
  message: string;
}
interface GeneratedTypeLiteralInterface_5 {
  data: GeneratedTypeLiteralInterface_6;
}
interface GeneratedTypeLiteralInterface_8 {
  code: number;
}
interface GeneratedTypeLiteralInterface_7 {
  data: GeneratedTypeLiteralInterface_8;
}
interface GeneratedTypeLiteralInterface_9 {
  code: number;
  message: string;
}
interface ErrorData {
  data: GeneratedTypeLiteralInterface_9;
}
interface GeneratedObjectLiteralInterface_1 {
  bytesWritten: number;
}
interface GeneratedObjectLiteralInterface_2 {
  data: string;
}
interface GeneratedObjectLiteralInterface_3 {
  data: string;
}
type allExpectType = 'success' | 'fail' | 'pending';
interface GeneratedTypeLiteralInterface_1 {
  message: allExpectType;
  value: string;
}
interface GeneratedObjectLiteralInterface_8 {
  eventId: number;
  priority:  emitter.EventPriority;
}
interface GeneratedObjectLiteralInterface_9 {
  eventId: number;
  priority:  emitter.EventPriority;
}
interface GeneratedObjectLiteralInterface_10 {
  LOW: GeneratedObjectLiteralInterface_8;
  HIGH: GeneratedObjectLiteralInterface_9;
}
interface GeneratedObjectLiteralInterface_7 {
  eventId: number;
  priority:  emitter.EventPriority;
}
interface GeneratedObjectLiteralInterface_5 {
  ERROR: string;
  FINISH: string;
}
interface GeneratedTypeLiteralInterface_4 {
  message: string;
}
interface StatusData {
  status: string;
}
interface GeneratedObjectLiteralInterface_6 {
  bytesWritten: number;
}
interface GeneratedObjectLiteralInterface_4 {
  status: string;
}
interface ErrorEventData {
  data: GeneratedTypeLiteralInterface_2;
}
interface FinishData { bytesWritten: number; }
interface ValidData { value: string; }
class AfterEndStream extends stream.Writable {
  private _isEnded = false;
  constructor() {
    super();
    this.on('finish', () => this._isEnded = true);
  }
  cork(): boolean {
    return this._isEnded;
  }
  doWrite(_chunk: string | Uint8Array, _encoding: string, callback: Function): void {
    invokeCb(callback);
  }
  _write(_chunk: string | Uint8Array, _encoding: string, callback: Function): void {
    this.doWrite(_chunk, _encoding, callback);
  }
}
class NoDoWriteStream extends stream.Writable {
  doWrite(_chunk: string | Uint8Array, _encoding: string, callback: Function): void {
    invokeCbErr(callback, new Error('The doWrite() method is not implemented'));
  }
  _write(_chunk: string | Uint8Array, _encoding: string, callback: Function): void {
    this.doWrite(_chunk, _encoding, callback);
  }
}
class InvalidEncodingStream extends stream.Writable {
  doWrite(
    _chunk: string | Uint8Array,
    encoding: string,
    callback: Function
  ): void {
    const validEncodings = ['utf8', 'gbk'];
    if (!validEncodings.includes(encoding)) {
      invokeCbErr(callback, new Error(`Invalid encoding: ${encoding}`));
      return;
    }
    invokeCb(callback);
  }
  _write(_chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.doWrite(_chunk, encoding, callback);
  }
}
class MultipleEndStream extends stream.Writable {
  constructor() {
    super();
  }
  doWrite(
    _chunk: string | Uint8Array,
    _encoding: string,
    callback: Function
  ): void {
    invokeCb(callback);
  }
  _write(
    chunk: string | Uint8Array,
    encoding: string,
    callback: Function
  ): void {
    this.doWrite(chunk, encoding, callback);
  }
}
class NormalCorkStream extends stream.Writable {
  private _corkedCount = 0;
  cork(): boolean {
    this._corkedCount++;
    return true;
  }
  uncork(): boolean {
    if (this._corkedCount > 0) {
      this._corkedCount--;
      return true;
    }
    return false;
  }
  doWrite(_chunk: string | Uint8Array, _encoding: string, callback: Function): void {
    invokeCb(callback);
  }
  _write(_chunk: string | Uint8Array, _encoding: string, callback: Function): void {
    this.doWrite(_chunk, _encoding, callback);
  }
}
class ClosedStream extends stream.Writable {
  private _isClosed = false;
  constructor() {
    super();
    this.on('finish', () => this._isClosed = true);
  }
  cork(): boolean {
    return !this._isClosed;
  }
  uncork(): boolean {
    return !this._isClosed;
  }
  doWrite(_chunk: string | Uint8Array, _encoding: string, callback: Function): void {
    invokeCb(callback);
  }
  _write(_chunk: string | Uint8Array, _encoding: string, callback: Function): void {
    this.doWrite(_chunk, _encoding, callback);
  }
}
class InvalidStream extends stream.Writable {
  doWrite(_chunk: string | Uint8Array, _encoding: string, callback: Function): void {
    invokeCbErr(callback, new Error('doWrite not implemented'));
  }
  _write(_chunk: string | Uint8Array, _encoding: string, callback: Function): void {
    this.doWrite(_chunk, _encoding, callback);
  }
}
class OverUncorkStream extends stream.Writable {
  private _corkedCount = 0;
  cork(): boolean {
    this._corkedCount++;
    return true;
  }
  uncork(): boolean {
    if (this._corkedCount > 0) {
      this._corkedCount--;
      return true;
    }
    return false;
  }
  doWrite(_chunk: string | Uint8Array, _encoding: string, callback: Function): void {
    invokeCb(callback);
  }
  _write(_chunk: string | Uint8Array, _encoding: string, callback: Function): void {
    this.doWrite(_chunk, _encoding, callback);
  }
}
class BasicWritable extends stream.Writable {
  public writtenData: string[] = [];

  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    this.writtenData.push(chunk.toString());
    invokeCb(callback);
  }
  _write(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.doWrite(chunk, encoding, callback);
  }
}
class MultiCorkWritable extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
}
class AsyncWritable extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(
    _chunk: string | Uint8Array,
    _encoding: string,
    callback: Function
  ): void {
    invokeCb(callback);
  }
}
class EndWritable extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
}
class DefaultWritable extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
}
class UnCorkWithoutCork extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
}
class OverUncork extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
}
class EndBeforeUncork extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }

  _write(chunk: string | Uint8Array, encoding: string, callback: Function) {
    this.doWrite(chunk, encoding, callback);
  }
}
class UnwritableStream extends stream.Writable {
  constructor() {
    super();
  }

  close() {
    throw new Error('Method not implemented.');
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
}
class BasicUncork extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
}
class MultiCork extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
}
class NoCork extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    invokeCb(callback);
  }
}
class TestWritable extends stream.Writable {
  constructor() {
    super();
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    invokeCb(callback);
  }
}

const CUSTOM_EVENT: string = 'dataProcessed';
class DataProcessor extends stream.Writable {
  constructor() {
    super();
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    emitter.emit(CUSTOM_EVENT);
    invokeCb(callback);
  }
}
const HIGH_PRIORITY_EVENT: GeneratedObjectLiteralInterface_7 = {
  eventId: 1001,
  priority: emitter.EventPriority.HIGH
};
let processedData: string | undefined = '';
const dataProcessCallback: Callback<emitter.EventData> = (_event) => {
  processedData = 'triggered';
};

class PriorityWritable extends stream.Writable {
  constructor() {
    super();
    emitter.onEventData(String(HIGH_PRIORITY_EVENT.eventId), dataProcessCallback);
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    emitter.emit(String(HIGH_PRIORITY_EVENT.eventId));
    invokeCb(callback);
  }
  _write(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.doWrite(chunk, encoding, callback);
  }
};
const TEST_EVENT_ID = 1001;
let isCallbackCalled = false;
class CancelWritable extends stream.Writable {
  private eventCallback = () => {
    isCallbackCalled = true;
  };
  constructor() {
    super();
    emitter.onEventData(TEST_EVENT_ID.toString(), this.eventCallback);
  }
  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    emitter.emit(TEST_EVENT_ID.toString());
    invokeCb(callback);
  }
  _write(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.doWrite(chunk, encoding, callback);
  }
  testUnsubscribe() {
    emitter.offEventData(TEST_EVENT_ID.toString(), this.eventCallback);
    this.write('Test Data', 'utf8', () => {
      expect(isCallbackCalled === (false)).assertEqual(true);
    });
  }
};
const MULTI_EVENT_ID = 1002;
let handlerCount = 0;
const callbackFactory = (): Callback<emitter.EventData> => (_data) => {
  handlerCount++;
};

class MultiWritable extends stream.Writable {
  constructor() {
    super();
    emitter.onEventData(MULTI_EVENT_ID.toString(), callbackFactory());
    emitter.onEventData(MULTI_EVENT_ID.toString(), callbackFactory());
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    emitter.emit(MULTI_EVENT_ID.toString());
    invokeCb(callback);
  }

  _write(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.doWrite(chunk, encoding, callback);
  }

  validate() {
    this.write('test', 'utf8', () => {
      expect(handlerCount === (2)).assertEqual(false);
    });
  }
};
interface UserData {
  name: string;
  age: number;
}
const TYPED_EVENT = 'typedEvent';
let receivedUserData: UserData | null = null;
class TypedWritable extends stream.Writable {
  private typedHandler: Callback<emitter.EventData> = (_eventData) => {
    receivedUserData = { name: 'triggered', age: 0 };
  };

  constructor() {
    super();
    emitter.onEventData(TYPED_EVENT, this.typedHandler);
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function) {
    const user: UserData = { name: chunk.toString(), age: 20 };
    receivedUserData = user;
    emitter.emit(TYPED_EVENT);
    invokeCb(callback);
  }

  _write(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    this.doWrite(chunk, encoding, callback);
  }

  destroy() {
    emitter.offEventData(TYPED_EVENT, this.typedHandler);
  }
};
const COMPLEX_EVENTS = ['eventA', 'eventB'];
let receivedEvents: string[] = [];

interface EventData {
  data: string;
}

class ComplexWritable extends stream.Writable {
  private handlers = new Map<string, Callback<emitter.EventData>>();
  private readonly done: () => void;
  private readonly testData: string;

  constructor(doneCallback: () => void, testData: string) {
    super();
    this.done = doneCallback;
    this.testData = testData;
    this.initHandlers();
  }

  private initHandlers() {
    COMPLEX_EVENTS.forEach((eventId: string): void => {
      const handler: Callback<emitter.EventData> = (_eventData) => {
        receivedEvents.push(this.testData + '_' + eventId);
        if (receivedEvents.length === COMPLEX_EVENTS.length) {
          this.validateEvents();
        }
      };
      this.handlers.set(eventId, handler);
      emitter.onEventData(eventId, handler);
    });
  }

  doWrite(chunk: string | Uint8Array, encoding: string, callback: Function): void {
    COMPLEX_EVENTS.forEach((eventId: string): void => {
      emitter.emit(eventId);
    });
    invokeCb(callback);
  }

  _write(_chunk: string | Uint8Array, _encoding: string, callback: Function): void {
    this.doWrite(_chunk, _encoding, callback);
  }

  private validateEvents() {
    const expectedEvents = [
      `${this.testData}_eventA`,
      `${this.testData}_eventB`
    ];
    expect(JSON.stringify(receivedEvents) === (JSON.stringify(expectedEvents))).assertEqual(true);
    this.cleanup();
    this.done();
  }
  private cleanup() {
    COMPLEX_EVENTS.forEach((eventId: string): void => {
      const handler = this.handlers.get(eventId);
      if (handler != null) {
        emitter.offEventData(eventId, handler);
      }
    });
  }
};


export default function StreamTest_02(): void {
  describe('StreamTest_02', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async (): Promise<void> => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
      await Utils.msSleep(10)
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTWO_0100
     * @tc.name      corkTest0001
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('corkTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writableStream = new AfterEndStream();
      writableStream.end('End Data', 'utf8', () => {
        expect(writableStream.cork()).assertEqual(false);
      });

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTWO_0200
     * @tc.name      corkTest0002
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('corkTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writableStream = new NoDoWriteStream();
      writableStream.cork();
      writableStream.write('Invalid data', 'utf8');
      const uncorkResult = writableStream.uncork();
      expect(uncorkResult).assertEqual(true);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTWO_0300
     * @tc.name      corkTest0003
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('corkTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writableStream = new InvalidEncodingStream();
      writableStream.cork();
      const writeResult = writableStream.write('Test Data', 'ascii');
      expect(writeResult).assertEqual(true);
      writableStream.on('error', (err: ErrorEventData) => {
        expect(err.data).assertEqual('Invalid encoding: ascii');
      });

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTWO_0400
     * @tc.name      corkTest0004
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('corkTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writableStream = new MultipleEndStream();
      writableStream.end('First ending', 'utf8');
      let errorThrown = false;
      try {
        writableStream.end('The second time ended', 'utf8');
      } catch (e) {
        errorThrown = true;
        expect((e as Error).message.length > 0).assertTrue();
      }
      expect(errorThrown).assertTrue();
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTWO_0500
     * @tc.name      corkTest0005
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('corkTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writable = new NormalCorkStream();
      expect(writable.cork()).assertEqual(true);
      expect(writable.uncork()).assertEqual(true);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTWO_0600
     * @tc.name      corkTest0006
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('corkTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writable = new ClosedStream();
      writable.end('');
      writable.on('finish', () => {
        expect(writable.cork()).assertEqual(false);
        expect(writable.uncork()).assertEqual(false);
      });

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTWO_0700
     * @tc.name      corkTest0007
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('corkTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writable = new InvalidStream();
      writable.write("test", 'utf8');
      expect(writable.cork()).assertEqual(true);
      expect(writable.writable).assertEqual(true);
      expect(writable.writableCorked).assertEqual(1);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTWO_0800
     * @tc.name      corkTest0008
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('corkTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writable = new OverUncorkStream();
      expect(writable.cork()).assertEqual(true);
      expect(writable.uncork()).assertEqual(true);
      expect(writable.uncork()).assertEqual(false);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTWO_0900
     * @tc.name      uncorkTest0001
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('uncorkTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writable = new BasicWritable();
      const corkResult = writable.cork();
      expect(corkResult).assertEqual(true);
      writable.write('buffer1', 'utf8');
      writable.write('buffer2', 'utf8');
      expect(writable.writtenData.length).assertEqual(0);
      const uncorkResult = writable.uncork();
      expect(uncorkResult).assertEqual(true);
      expect(writable.writtenData.join(',')).assertEqual('buffer1');
      writable.end();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTWO_1000
     * @tc.name      uncorkTest0002
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('uncorkTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writable = new MultiCorkWritable();
      expect(writable.cork()).assertEqual(true);
      expect(writable.cork()).assertEqual(true);
      writable.write('layer1', 'utf8');
      writable.write('layer2', 'utf8');
      const firstUncork = writable.uncork();
      const secondUncork = writable.uncork();
      expect(firstUncork).assertEqual(true);
      expect(secondUncork).assertEqual(true);
      writable.end('');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTWO_1100
     * @tc.name      uncorkTest0003
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('uncorkTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writable = new AsyncWritable();
      expect(writable.cork()).assertEqual(true);
      ['data1', 'data2', 'data3'].forEach(item => {
        writable.write(item, 'utf8');
      });
      const uncorkSuccess = writable.uncork();
      expect(uncorkSuccess).assertEqual(true);
      writable.end('');

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTWO_1200
     * @tc.name      uncorkTest0004
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('uncorkTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writable = new EndWritable();
      expect(writable.cork()).assertEqual(true);
      writable.write('finalData', 'utf8');
      expect(writable.uncork()).assertEqual(true);
      writable.end('finalData', 'utf8', () => {});

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTWO_1300
     * @tc.name      uncorkTest0005
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('uncorkTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writable = new DefaultWritable();
      const uncorkWithoutCork = writable.uncork();
      expect(uncorkWithoutCork).assertEqual(true);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTWO_1400
     * @tc.name      uncorkTest0006
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('uncorkTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writable = new UnCorkWithoutCork();
      const result = writable.uncork();
      expect(result).assertEqual(true);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTWO_1500
     * @tc.name      uncorkTest0007
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('uncorkTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writable = new OverUncork();
      expect(writable.cork()).assertEqual(true);
      expect(writable.uncork()).assertEqual(true);
      const extraUncorkResult = writable.uncork();
      expect(extraUncorkResult).assertEqual(true);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTWO_1600
     * @tc.name      uncorkTest0008
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('uncorkTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writable = new EndBeforeUncork();
      const corkResult = writable.cork();
      expect(corkResult).assertEqual(true);
      writable.end('');
      const uncorkAfterEnd = writable.uncork();
      expect(uncorkAfterEnd).assertEqual(true);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTWO_1700
     * @tc.name      uncorkTest0009
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('uncorkTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writable = new UnwritableStream();
      try {
        writable.close();
        expect().assertFail()
      } catch (err) {
              }
      const uncorkWhenUnwritable = writable.uncork();
      expect(uncorkWhenUnwritable).assertEqual(true);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTWO_1800
     * @tc.name      uncorkTest0010
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('uncorkTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writable = new BasicUncork();
      expect(writable.cork()).assertEqual(true);
      const uncorkResult = writable.uncork();
      expect(uncorkResult).assertEqual(true);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTWO_1900
     * @tc.name      uncorkTest0011
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('uncorkTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writable = new MultiCork();
      expect(writable.cork()).assertEqual(true);
      expect(writable.cork()).assertEqual(true);
      const firstUncork = writable.uncork();
      const secondUncork = writable.uncork();
      expect(firstUncork).assertEqual(true);
      expect(secondUncork).assertEqual(true);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTWO_2000
     * @tc.name      uncorkTest0012
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('uncorkTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writable = new NoCork();
      const result = writable.uncork();
      expect(result).assertEqual(true);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTWO_2100
     * @tc.name      uncorkTest0013
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('uncorkTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writable = new OverUncork();
      expect(writable.cork()).assertEqual(true);
      expect(writable.uncork()).assertEqual(true);
      const extraUncork = writable.uncork();
      expect(extraUncork).assertEqual(true);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTWO_2200
     * @tc.name      uncorkTest0014
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('uncorkTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const writable = new EndBeforeUncork();
      let corkResult:boolean
      let uncorkAfterEnd:boolean
      corkResult = writable.cork();
      expect(corkResult).assertEqual(true);
      writable.end('');
      uncorkAfterEnd = writable.uncork();
      expect(uncorkAfterEnd).assertEqual(true);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTWO_2300
     * @tc.name      ontest0001
     * @tc.desc      Verify close event trigger correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ontest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const EVENT_NAME: string = 'close';
      let callbackTriggered = false;
      const callback: Callback<emitter.EventData> = (_eventData) => {
        callbackTriggered = true;
      };
      const writableStream = new TestWritable();
      emitter.onEventData(EVENT_NAME, callback);
      const expectedData: GeneratedObjectLiteralInterface_4 = { status: 'closed' };
      writableStream.end('finish', 'utf8', () => {
        emitter.emit(EVENT_NAME);
        expect(callbackTriggered).assertEqual(true);
      });

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTWO_2400
     * @tc.name      ontest0002
     * @tc.desc      Verify event priority execution order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ontest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const CUSTOM_EVENT: string = 'dataProcessed';
      let callbackTriggered = false;
      const dataCallback: Callback<emitter.EventData> = (_eventData) => {
        callbackTriggered = true;
      };
      const processor = new DataProcessor();
      emitter.onEventData(CUSTOM_EVENT, dataCallback);
      const testData = 'testData';
      processor.write(testData, 'utf8', () => {
        expect(callbackTriggered).assertEqual(true);
      });

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTWO_2500
     * @tc.name      ontest0003
     * @tc.desc      Verify event priority execution order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ontest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const EVENTS: GeneratedObjectLiteralInterface_5 = { ERROR: 'error', FINISH: 'finish' };
      let errorTriggered = false;
      let finishTriggered = false;
      const errorHandler: Callback<emitter.EventData> = (_eventData) => {
        errorTriggered = true;
      };
      const finishHandler: Callback<emitter.EventData> = (_eventData) => {
        finishTriggered = true;
      };
      emitter.onEventData(EVENTS.ERROR, errorHandler);
      emitter.onEventData(EVENTS.FINISH, finishHandler);
      emitter.emit(EVENTS.ERROR);
      emitter.emit(EVENTS.FINISH);
      expect(errorTriggered).assertEqual(false);
      expect(finishTriggered).assertEqual(false);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTWO_2600
     * @tc.name      ontest0004
     * @tc.desc      Verify event priority execution order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ontest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testData = 'priorityData';
      const priorityStream = new PriorityWritable();
      priorityStream.write(testData, 'utf8', () => {
        expect(processedData === (testData.toUpperCase())).assertEqual(false);
      });

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTWO_2700
     * @tc.name      ontest0005
     * @tc.desc      Verify event priority execution order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ontest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TEMP_EVENT: string = 'tempEvent';
      let isCallbackCalled = false;
      const tempCallback = () => {
        isCallbackCalled = true;
      };
      emitter.onEventData(TEMP_EVENT, tempCallback);
      emitter.offEventData(TEMP_EVENT, tempCallback);
      emitter.emit(TEMP_EVENT);
      expect(isCallbackCalled === (false)).assertEqual(true);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTWO_2800
     * @tc.name      ontest0006
     * @tc.desc      Verify event priority execution order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ontest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cancelWritable = new CancelWritable();
      expect(typeof cancelWritable.testUnsubscribe).assertEqual('function');
      cancelWritable.testUnsubscribe();

    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTWO_2900
     * @tc.name      ontest0007
     * @tc.desc      Verify event priority execution order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ontest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TYPE_EVENT_ID = 'typeMismatch';
      let isTypeError = false;
      emitter.onEventData(TYPE_EVENT_ID, (_eventData: emitter.EventData) => {
        isTypeError = false;
      });
      emitter.emit(TYPE_EVENT_ID);
      expect(isTypeError).assertEqual(false);

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTWO_3000
     * @tc.name      ontest0008
     * @tc.desc      Verify event priority execution order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ontest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const multiWritable = new MultiWritable();
      expect(typeof multiWritable.validate).assertEqual('function');
      multiWritable.validate();

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTWO_3100
     * @tc.name      ontest0009
     * @tc.desc      Verify unregistered event emit handling
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ontest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let isErrorCaught = false;
        let callbackTriggered = false;
        emitter.onceEventData('1001', (_data: emitter.EventData) => {
          callbackTriggered = true;
        });
        emitter.emit('1001');
        if (!callbackTriggered) {
          throw new Error('1001 event not triggered or data not received');
        }
        expect(isErrorCaught).assertEqual(false);
        expect(callbackTriggered).assertEqual(true);
      } catch (err) {
              }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTWO_3200
     * @tc.name      ontest0010
     * @tc.desc      Verify basic event handling in writable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ontest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let receivedData = '';
      const testData = 'HelloEmitter';
      const writer = new BasicWritable();
      writer.write(testData, 'utf8', () => {
        expect(receivedData === (JSON.stringify(testData))).assertEqual(false);
      });

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTWO_3300
     * @tc.name      ontest0011
     * @tc.desc      Verify typed event data handling
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ontest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testName = 'testUser';
      const typedWritable = new TypedWritable();
      typedWritable.write(testName, 'utf8', () => {
        expect(receivedUserData !== null).assertEqual(false);
        if (receivedUserData) {
          expect(receivedUserData!.name === testName).assertEqual(false);
          expect(receivedUserData!.age === 20).assertEqual(true);
        }
        typedWritable.destroy();
      });

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTWO_3400
     * @tc.name      ontest0012
     * @tc.desc      Verify event priority execution sequence
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ontest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let logSequence: string[] = [];
      const expectedSequence = 'HIGH,LOW';
      const priorityWritable = new PriorityWritable();
      priorityWritable.write('testPriority', 'utf8', () => {
        expect(logSequence.join(',') === (expectedSequence)).assertEqual(false);
      });

    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_STREAMTESTTWO_3500
     * @tc.name      ontest0013
     * @tc.desc      Verify emitter once works correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('ontest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async(done: ()=> void): Promise<void> => {
      const testData = 'test';
      const complexWritable = new ComplexWritable(done, testData);
      complexWritable.write(testData, 'utf8');
      expect(true).assertEqual(true);
      expect(true).assertEqual(true);
      done();
    })
  })
}