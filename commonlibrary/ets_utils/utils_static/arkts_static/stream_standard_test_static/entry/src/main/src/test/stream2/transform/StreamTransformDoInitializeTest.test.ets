'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../../hypium/index';
import { stream } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';

class DiTestTransform extends stream.Transform {
  public doInitializeCalled: boolean = false;
  public doInitializeCallCount: int = 0;

  constructor() {
    super();
  }

  doTransform(chunk: string, encoding: string, callback: Function): void {
    this.push(chunk);
    callback.unsafeCall();
  }

  doInitialize(callback: Function): void {
    this.doInitializeCalled = true;
    this.doInitializeCallCount++;
    callback.unsafeCall();
  }
}

class DiNoCallbackTransform extends stream.Transform {
  public doInitializeCalled: boolean = false;

  constructor() {
    super();
  }

  doTransform(chunk: string, encoding: string, callback: Function): void {
    this.push(chunk);
    callback.unsafeCall();
  }

  doInitialize(callback: Function): void {
    this.doInitializeCalled = true;
  }
}

class DiAsyncTransform extends stream.Transform {
  public callbackCalled: boolean = false;

  constructor() {
    super();
  }

  doTransform(chunk: string, encoding: string, callback: Function): void {
    this.push(chunk);
    callback.unsafeCall();
  }

  doInitialize(callback: Function): void {
    setTimeout((): void => {
      this.callbackCalled = true;
      callback.unsafeCall();
    }, 20);
  }
}

class DiErrorTransform extends stream.Transform {
  constructor() {
    super();
  }

  doTransform(chunk: string, encoding: string, callback: Function): void {
    this.push(chunk);
    callback.unsafeCall();
  }

  doInitialize(callback: Function): void {
    callback.unsafeCall(new Error('initialize failed'));
  }
}

export default function StreamTransformDoInitializeTest(): void {
  describe('StreamTransformDoInitializeTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: (value: void) => void): void => {
        setTimeout((): void => resolve(undefined as void), 0);
      });
    });
    beforeAll((): void => {
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_INITIALIZE_0100
     * @tc.name testStreamTransformDoInitialize001
     * @tc.desc Verify doInitialize is called when on(data) is registered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoInitialize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new DiTestTransform();
      expect(transform.doInitializeCalled).assertFalse();
      transform.on('data', (): void => {
      });
      expect(transform.doInitializeCalled).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_INITIALIZE_0200
     * @tc.name testStreamTransformDoInitialize002
     * @tc.desc Verify doInitialize callback executes without error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoInitialize002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new DiTestTransform();
      let code: int = 0;
      try {
        transform.on('data', (): void => {
        });
      } catch (e) {
        expect(e.name).assertEqual("BusinessError");
        code = e.code;
      }
      expect(code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_INITIALIZE_0300
     * @tc.name testStreamTransformDoInitialize003
     * @tc.desc Verify doInitialize is called only once even when multiple events registered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoInitialize003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new DiTestTransform();
      transform.on('data', (): void => {
      });
      transform.on('end', (): void => {
      });
      expect(transform.doInitializeCallCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_INITIALIZE_0400
     * @tc.name testStreamTransformDoInitialize004
     * @tc.desc Verify a doInitialize that never invokes its callback leaves the write callback pending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoInitialize004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new DiNoCallbackTransform();
        let callbackFired: boolean = false;
        transform.on('data', (): void => {
        });
        try {
          await new Promise<void>((resolve: (value: void) => void,
            reject: (reason: Error) => void): void => {
            transform.write('data', 'utf8', (err?: Error): void => {
              callbackFired = true;
              if (err !== undefined) {
                reject(err);
                return;
              }
            });
            setTimeout((): void => {
              resolve(undefined as void);
            }, 50);
          });
          expect(transform.doInitializeCalled).assertTrue();
          expect(callbackFired).assertFalse();
        } catch (e) {
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_INITIALIZE_0500
     * @tc.name testStreamTransformDoInitialize005
     * @tc.desc Verify doInitialize is triggered by readable listener
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoInitialize005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new DiTestTransform();
      transform.on('readable', (): void => {
      });
      expect(transform.doInitializeCalled).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_INITIALIZE_0600
     * @tc.name testStreamTransformDoInitialize006
     * @tc.desc Verify multiple data listeners trigger doInitialize once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoInitialize006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new DiTestTransform();
      transform.on('data', (): void => {
      });
      transform.on('data', (): void => {
      });
      expect(transform.doInitializeCallCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_INITIALIZE_0700
     * @tc.name testStreamTransformDoInitialize007
     * @tc.desc Verify initialization without callback prevents data delivery
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoInitialize007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new DiNoCallbackTransform();
      let dataCalled: boolean = false;
      transform.on('data', (): void => {
        dataCalled = true;
      });
      transform.write('blocked', 'utf8');
      expect(transform.doInitializeCalled).assertTrue();
      expect(dataCalled).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_INITIALIZE_0800
     * @tc.name testStreamTransformDoInitialize008
     * @tc.desc Verify each Transform instance initializes independently for readable and writable registrations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoInitialize008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first = new DiTestTransform();
      let second = new DiTestTransform();
      first.on('data', (): void => {
      });
      expect(first.doInitializeCallCount).assertEqual(1);
      expect(second.doInitializeCallCount).assertEqual(0);
      second.on('readable', (): void => {
      });
      expect(second.doInitializeCallCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_INITIALIZE_0900
     * @tc.name testStreamTransformDoInitialize009
     * @tc.desc Verify initialization is not repeated by later write operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoInitialize009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new DiTestTransform();
      transform.on('data', (): void => {
      });
      transform.write('first', 'utf8');
      transform.write('second', 'utf8');
      expect(transform.doInitializeCallCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_INITIALIZE_1000
     * @tc.name testStreamTransformDoInitialize010
     * @tc.desc Verify doInitialize runs before the first data callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoInitialize010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new DiTestTransform();
        let initAtData: boolean = false;
        let callCountAtData: int = 0;
        transform.on('data', (): void => {
          initAtData = transform.doInitializeCalled;
          callCountAtData = transform.doInitializeCallCount;
        });
        let callCountAtEnd: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('end', (): void => {
            callCountAtEnd = transform.doInitializeCallCount;
            resolve(undefined as void);
          });
          transform.write('first', 'utf8');
          transform.end();
        });
        expect(initAtData).assertTrue();
        expect(callCountAtData).assertEqual(1);
        expect(callCountAtEnd).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_INITIALIZE_1100
     * @tc.name testStreamTransformDoInitialize011
     * @tc.desc Verify readable and data listeners share one initialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoInitialize011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new DiTestTransform();
      transform.on('readable', (): void => {
      });
      transform.on('data', (): void => {
      });
      transform.on('data', (): void => {
      });
      expect(transform.doInitializeCallCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_INITIALIZE_1200
     * @tc.name testStreamTransformDoInitialize012
     * @tc.desc Verify initialization is not repeated by end and close events
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoInitialize012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new DiTestTransform();
        let callCountAtEnd: int = 0;
        let callCountAtClose: int = 0;
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('end', (): void => {
            callCountAtEnd = transform.doInitializeCallCount;
          });
          transform.on('close', (): void => {
            callCountAtClose = transform.doInitializeCallCount;
            resolve(undefined as void);
          });
          transform.resume();
          transform.end();
        });
        expect(callCountAtEnd).assertEqual(1);
        expect(callCountAtClose).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_INITIALIZE_1300
     * @tc.name testStreamTransformDoInitialize013
     * @tc.desc Verify a second data write uses the already initialized transform
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoInitialize013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new DiTestTransform();
      transform.on('data', (): void => {
      });
      transform.write('one', 'utf8');
      transform.write('two', 'utf8');
      transform.write('three', 'utf8');
      expect(transform.doInitializeCallCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_INITIALIZE_1400
     * @tc.name testStreamTransformDoInitialize014
     * @tc.desc Verify initialization state is visible to a readable listener
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoInitialize014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new DiTestTransform();
        let initAtReadable: boolean = false;
        let callCountAtReadable: int = 0;
        transform.on('readable', (): void => {
          initAtReadable = transform.doInitializeCalled;
          callCountAtReadable = transform.doInitializeCallCount;
          while (transform.readableLength > 0) {
            transform.read();
          }
        });
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('end', (): void => {
            resolve(undefined as void);
          });
          transform.write('readable-check', 'utf8');
          transform.end();
        });
        expect(initAtReadable).assertTrue();
        expect(callCountAtReadable).assertEqual(1);
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_INITIALIZE_1500
     * @tc.name testStreamTransformDoInitialize015
     * @tc.desc Verify doInitialize not called after write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoInitialize015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new DiTestTransform();
      transform.write('hello', 'utf8');
      expect(transform.doInitializeCalled).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_INITIALIZE_1600
     * @tc.name testStreamTransformDoInitialize016
     * @tc.desc Verify doInitialize not called after end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoInitialize016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new DiTestTransform();
      transform.end();
      expect(transform.doInitializeCalled).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_INITIALIZE_1700
     * @tc.name testStreamTransformDoInitialize017
     * @tc.desc Verify doInitialize not called after cork/uncork
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoInitialize017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new DiTestTransform();
      transform.cork();
      transform.uncork();
      expect(transform.doInitializeCalled).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_INITIALIZE_1800
     * @tc.name testStreamTransformDoInitialize018
     * @tc.desc Verify doInitialize not called after setEncoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoInitialize018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new DiTestTransform();
      transform.setEncoding('utf8');
      expect(transform.doInitializeCalled).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_INITIALIZE_1900
     * @tc.name testStreamTransformDoInitialize019
     * @tc.desc Verify doInitialize not called after setDefaultEncoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoInitialize019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new DiTestTransform();
      transform.setDefaultEncoding('utf8');
      expect(transform.doInitializeCalled).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_INITIALIZE_2000
     * @tc.name testStreamTransformDoInitialize020
     * @tc.desc Verify doInitialize not called after pause
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoInitialize020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new DiTestTransform();
      transform.pause();
      expect(transform.doInitializeCalled).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_INITIALIZE_2100
     * @tc.name testStreamTransformDoInitialize021
     * @tc.desc Verify doInitialize called once after on(data) then resume
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoInitialize021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new DiTestTransform();
      transform.on('data', (): void => {
      });
      transform.pause();
      transform.resume();
      expect(transform.doInitializeCallCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_INITIALIZE_2200
     * @tc.name testStreamTransformDoInitialize022
     * @tc.desc Verify doInitialize called once after pipe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoInitialize022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new DiTestTransform();
      let writable: stream.Writable = new stream.Writable();
      transform.pipe(writable);
      expect(transform.doInitializeCallCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_INITIALIZE_2300
     * @tc.name testStreamTransformDoInitialize023
     * @tc.desc Verify read does not trigger lazy doInitialize before on()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoInitialize023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new DiTestTransform();
      transform.pause();
      transform.read();
      expect(transform.doInitializeCallCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_INITIALIZE_2400
     * @tc.name testStreamTransformDoInitialize024
     * @tc.desc Verify doInitialize not called on NoCallback transform before on
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoInitialize024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new DiNoCallbackTransform();
      expect(transform.doInitializeCalled).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_INITIALIZE_2500
     * @tc.name testStreamTransformDoInitialize025
     * @tc.desc Verify doInitialize NoCallback transform called after on(data)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoInitialize025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new DiNoCallbackTransform();
      transform.on('data', (chunk: Object): void => {
      });
      expect(transform.doInitializeCalled).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_INITIALIZE_2600
     * @tc.name testStreamTransformDoInitialize026
     * @tc.desc Verify doInitialize does not affect writable* properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoInitialize026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new DiTestTransform();
      transform.resume();
      expect(transform.writable).assertTrue();
      expect(transform.writableEnded).assertFalse();
      expect(transform.writableCorked).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_INITIALIZE_2700
     * @tc.name testStreamTransformDoInitialize027
     * @tc.desc Verify resume-triggered doInitialize leaves all readable* properties at defaults
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoInitialize027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new DiTestTransform();
      transform.resume();
      expect(transform.readableEnded).assertFalse();
      expect(transform.readableEncoding).assertEqual(null);
      expect(transform.readableHighWatermark).assertEqual(16384);
      expect(transform.readableObjectMode).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_INITIALIZE_2800
     * @tc.name testStreamTransformDoInitialize028
     * @tc.desc Verify doInitialize runs before first data callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoInitialize028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        let transform = new DiTestTransform();
        let initializedBeforeData: boolean = false;
        transform.on('data', (chunk: Object): void => {
          initializedBeforeData = transform.doInitializeCalled;
        });
        await new Promise<void>((resolve: (value: void) => void): void => {
          transform.on('end', (): void => {
            resolve(undefined as void);
          });
          transform.write('hello', 'utf8');
          transform.end();
        });
        expect(initializedBeforeData).assertTrue();
        done();
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_INITIALIZE_2900
     * @tc.name testStreamTransformDoInitialize029
     * @tc.desc Verify doInitialize not called after push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoInitialize029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new DiTestTransform();
      transform.push('hello');
      expect(transform.doInitializeCalled).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_INITIALIZE_3000
     * @tc.name testStreamTransformDoInitialize030
     * @tc.desc Verify doInitialize is called only once after multiple resume calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoInitialize030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new DiTestTransform();
      transform.on('data', (): void => {
      });
      transform.resume();
      transform.resume();
      transform.resume();
      expect(transform.doInitializeCallCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_INITIALIZE_3100
     * @tc.name testStreamTransformDoInitialize031
     * @tc.desc Verify doInitialize is called only once after on(data) then resume
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoInitialize031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new DiTestTransform();
      transform.on('data', (chunk: Object): void => {
      });
      transform.resume();
      expect(transform.doInitializeCallCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STREAM_TRANSFORM_DO_INITIALIZE_3200
     * @tc.name testStreamTransformDoInitialize032
     * @tc.desc Verify doInitialize is called only once after pipe then on(data)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStreamTransformDoInitialize032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let transform = new DiTestTransform();
      let writable: stream.Writable = new stream.Writable();
      transform.pipe(writable);
      transform.on('data', (chunk: Object): void => {
      });
      expect(transform.doInitializeCallCount).assertEqual(1);
    });

  });
}
