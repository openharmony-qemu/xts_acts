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
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

class Cls1 {
  static cb2(): void {}
}

class Payload {
  tag: string = '';

  constructor(t: string) {
    this.tag = t;
  }
}

export default function GlobalSetTimeoutPart_1Test(): void {
  describe('GlobalSetTimeoutPart_1Test', (): void => {
    beforeAll(() => {});

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0010
     * @tc.name testGlobalSetTimeoutTest001
     * @tc.desc setTimeout registers timer, id>0, and returns a positive timer ID
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let id: int = setTimeout((): void => {}, 0);
      expect(id).assertLarger(0);
      clearTimeout(id);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0020
     * @tc.name testGlobalSetTimeoutTest002
     * @tc.desc setTimeout with Promise, result=42
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let result: int = 0;
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout((): void => {
            result = 42;
            resolve(undefined);
          }, 0);
        });
        expect(result).assertEqual(42);
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0030
     * @tc.name testGlobalSetTimeoutTest003
     * @tc.desc setTimeout registers timer, result="ok", the awaited callback fires, setting a string value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let result: string = '';
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout((): void => {
            result = 'ok';
            resolve(undefined);
          }, 0);
        });
        expect(result).assertEqual('ok');
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0040
     * @tc.name testGlobalSetTimeoutTest004
     * @tc.desc setTimeout callback fires, sum=3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let sum: int = 0;
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout((): void => {
            const a: int = 1;
            let b: int = 2;
            sum = a + b;
            resolve(undefined);
          }, 0);
        });
        expect(sum).assertEqual(3);
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0050
     * @tc.name testGlobalSetTimeoutTest005
     * @tc.desc setTimeout + clearTimeout returns valid positive timer ID
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const callback = (): void => {
        let x: int = 1;
      };
      let id: int = setTimeout(callback, 0);
      expect(id).assertLarger(0);
      clearTimeout(id);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0060
     * @tc.name testGlobalSetTimeoutTest006
     * @tc.desc setTimeout callback fires, captured=11
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let captured: int = 10;
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout((): void => {
            captured = captured + 1;
            resolve(undefined);
          }, 0);
        });
        expect(captured).assertEqual(11);
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0070
     * @tc.name testGlobalSetTimeoutTest007
     * @tc.desc setTimeout registers timer, result=5, the awaited callback fires, invoking a helper function
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        const helper = (): int => {
          return 5;
        };
        let result: int = 0;
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout((): void => {
            result = helper();
            resolve(undefined);
          }, 0);
        });
        expect(result).assertEqual(5);
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0080
     * @tc.name testGlobalSetTimeoutTest008
     * @tc.desc setTimeout registers timer, result="positive", the awaited callback fires, branching on a condition
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let result: string = '';
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout((): void => {
            const x: int = 1;
            if (x > 0) {
              result = 'positive';
            } else {
              result = 'nonpositive';
            }
            resolve(undefined);
          }, 0);
        });
        expect(result).assertEqual('positive');
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0090
     * @tc.name testGlobalSetTimeoutTest009
     * @tc.desc setTimeout registers timer, sum=10, the awaited callback fires, running a loop
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let sum: int = 0;
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout((): void => {
            for (let i: int = 0; i < 5; i++) {
              sum = sum + i;
            }
            resolve(undefined);
          }, 0);
        });
        expect(sum).assertEqual(10);
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0100
     * @tc.name testGlobalSetTimeoutTest010
     * @tc.desc setTimeout callback fires, sum=7
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let sum: int = 0;
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout(
            (a: int, b: int): void => {
              sum = a + b;
              resolve(undefined);
            },
            0,
            3,
            4,
          );
        });
        expect(sum).assertEqual(7);
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0110
     * @tc.name testGlobalSetTimeoutTest011
     * @tc.desc setTimeout callback fires, first=10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let first: int = 0;
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout(
            (a: int): void => {
              first = a;
              resolve(undefined);
            },
            0,
            10,
            20,
            30,
          );
        });
        expect(first).assertEqual(10);
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0120
     * @tc.name testGlobalSetTimeoutTest012
     * @tc.desc setTimeout callback fires, flag=true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let flag: boolean = false;
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout(
            (): void => {
              flag = true;
              resolve(undefined);
            },
            0,
            42,
            'ignored',
          );
        });
        expect(flag).assertTrue();
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0130
     * @tc.name testGlobalSetTimeoutTest013
     * @tc.desc setTimeout callback fires, result=90
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let result: int = 0;
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout((): void => {
            result = (10 + 20) * 3;
            resolve(undefined);
          }, 0);
        });
        expect(result).assertEqual(90);
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0140
     * @tc.name testGlobalSetTimeoutTest014
     * @tc.desc setTimeout callback fires, result="helloworld"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let result: string = '';
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout(
            (a: string, b: string): void => {
              result = a + b;
              resolve(undefined);
            },
            0,
            'hello',
            'world',
          );
        });
        expect(result).assertEqual('helloworld');
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0150
     * @tc.name testGlobalSetTimeoutTest015
     * @tc.desc setTimeout callback fires, result=3.14
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let result: number = 0.0;
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout(
            (val: number): void => {
              result = val;
              resolve(undefined);
            },
            0,
            3.14,
          );
        });
        expect(result).assertEqual(3.14);
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0160
     * @tc.name testGlobalSetTimeoutTest016
     * @tc.desc setTimeout with Promise and delay 0, result=true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let result: boolean = false;
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout(
            (val: boolean): void => {
              result = val;
              resolve(undefined);
            },
            0,
            true,
          );
        });
        expect(result).assertTrue();
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0170
     * @tc.name testGlobalSetTimeoutTest017
     * @tc.desc setTimeout with Promise, sum=15.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let sum: number = 0.0;
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout(
            (a: int, b: number, c: boolean): void => {
              if (c) {
                sum = a + b;
              }
              resolve(undefined);
            },
            0,
            10,
            5.5,
            true,
          );
        });
        expect(sum).assertEqual(15.5);
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0180
     * @tc.name testGlobalSetTimeoutTest018
     * @tc.desc setTimeout callback fires, result=5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let result: int = 0;
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout(
            (x: int): void => {
              result = x > 0 ? x : -x;
              resolve(undefined);
            },
            0,
            -5,
          );
        });
        expect(result).assertEqual(5);
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0190
     * @tc.name testGlobalSetTimeoutTest019
     * @tc.desc setTimeout callback fires, val=80
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let val: int = 0;
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout((): void => {
            val = 80;
            resolve(undefined);
          }, -1);
        });
        expect(val).assertEqual(80);
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0200
     * @tc.name testGlobalSetTimeoutTest020
     * @tc.desc setTimeout callback fires, result="data"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let result: string = '';
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout(
            (x: string): void => {
              result = x;
              resolve(undefined);
            },
            null,
            'data',
          );
        });
        expect(result).assertEqual('data');
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0210
     * @tc.name testGlobalSetTimeoutTest021
     * @tc.desc setTimeout with Promise and delay undefined, result=true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let result: boolean = false;
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout(
            (x: boolean): void => {
              result = x;
              resolve(undefined);
            },
            undefined,
            true,
          );
        });
        expect(result).assertTrue();
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0220
     * @tc.name testGlobalSetTimeoutTest022
     * @tc.desc setTimeout with Promise, flag=true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        const delay: int = -1;
        let flag: boolean = false;
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout((): void => {
            flag = true;
            resolve(undefined);
          }, delay);
        });
        expect(flag).assertTrue();
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0230
     * @tc.name testGlobalSetTimeoutTest023
     * @tc.desc setTimeout callback fires, result=0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let result: int = -1;
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout(
            (x: int): void => {
              result = x;
              resolve(undefined);
            },
            0,
            0,
          );
        });
        expect(result).assertEqual(0);
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0240
     * @tc.name testGlobalSetTimeoutTest024
     * @tc.desc setTimeout callback fires, result=-1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let result: int = 0;
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout(
            (x: int): void => {
              result = x;
              resolve(undefined);
            },
            0,
            -1,
          );
        });
        expect(result).assertEqual(-1);
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0250
     * @tc.name testGlobalSetTimeoutTest025
     * @tc.desc setTimeout with Float.NaN via closure capture (avoid arg serialization crash)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let result: number = 0.0;
        let val: number = Float.NaN;
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout((): void => {
            result = val;
            resolve(undefined);
          }, 0);
        });
        expect(isNaN(result)).assertTrue();
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0260
     * @tc.name testGlobalSetTimeoutTest026
     * @tc.desc setTimeout with Float.POSITIVE_INFINITY via closure capture
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let result: number = 0.0;
        let val: number = Float.POSITIVE_INFINITY;
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout((): void => {
            result = val;
            resolve(undefined);
          }, 0);
        });
        expect(result).assertEqual(Float.POSITIVE_INFINITY);
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0270
     * @tc.name testGlobalSetTimeoutTest027
     * @tc.desc setTimeout with -Float.POSITIVE_INFINITY via closure capture
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let result: number = 0.0;
        let val: number = -Float.POSITIVE_INFINITY;
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout((): void => {
            result = val;
            resolve(undefined);
          }, 0);
        });
        expect(result).assertEqual(-Float.POSITIVE_INFINITY);
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0280
     * @tc.name testGlobalSetTimeoutTest028
     * @tc.desc setTimeout callback fires, result=""
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let result: string = 'x';
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout(
            (x: string): void => {
              result = x;
              resolve(undefined);
            },
            0,
            '',
          );
        });
        expect(result).assertEqual('');
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0290
     * @tc.name testGlobalSetTimeoutTest029
     * @tc.desc setTimeout callback fires, result=false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let result: boolean = true;
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout(
            (x: boolean): void => {
              result = x;
              resolve(undefined);
            },
            0,
            false,
          );
        });
        expect(result).assertFalse();
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0300
     * @tc.name testGlobalSetTimeoutTest030
     * @tc.desc setTimeout callback fires, result="42answer"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let result: string = '';
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout(
            (a: int, b: string): void => {
              result = a.toString() + b;
              resolve(undefined);
            },
            0,
            42,
            'answer',
          );
        });
        expect(result).assertEqual('42answer');
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0310
     * @tc.name testGlobalSetTimeoutTest031
     * @tc.desc setTimeout with Promise, sum=13
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let sum: int = 0;
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout(
            (a: int, b: boolean, c: string): void => {
              if (b) {
                sum = a + c.length;
              }
              resolve(undefined);
            },
            0,
            10,
            true,
            'abc',
          );
        });
        expect(sum).assertEqual(13);
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0320
     * @tc.name testGlobalSetTimeoutTest032
     * @tc.desc setTimeout with Promise, result=5.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let result: number = 0.0;
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout(
            (a: number, b: int, c: boolean): void => {
              if (c) {
                result = a + b;
              }
              resolve(undefined);
            },
            0,
            2.5,
            3,
            true,
          );
        });
        expect(result).assertEqual(5.5);
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0330
     * @tc.name testGlobalSetTimeoutTest033
     * @tc.desc setTimeout with Promise, product=24
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let product: int = 0;
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout(
            (a: int, b: int, c: int): void => {
              product = a * b * c;
              resolve(undefined);
            },
            0,
            2,
            3,
            4,
          );
        });
        expect(product).assertEqual(24);
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0340
     * @tc.name testGlobalSetTimeoutTest034
     * @tc.desc setTimeout passes 5 and 10 rest args to callback, sum verified
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let sum: int = 0;
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout(
            (a: int, b: int, c: int, d: int, e: int): void => {
              sum = a + b + c + d + e;
              resolve(undefined);
            },
            0,
            1,
            2,
            3,
            4,
            5,
          );
        });
        expect(sum).assertEqual(15);
        let total: int = 0;
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout(
            (a: int, b: int, c: int, d: int, e: int, f: int, g: int, h: int, i: int, j: int): void => {
              total = a + b + c + d + e + f + g + h + i + j;
              resolve(undefined);
            },
            0,
            1,
            2,
            3,
            4,
            5,
            6,
            7,
            8,
            9,
            10,
          );
        });
        expect(total).assertEqual(55);
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0350
     * @tc.name testGlobalSetTimeoutTest035
     * @tc.desc setTimeout with Promise, result=99
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        const getValue = (): int => {
          return 99;
        };
        let result: int = 0;
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout(
            (x: int): void => {
              result = x;
              resolve(undefined);
            },
            0,
            getValue(),
          );
        });
        expect(result).assertEqual(99);
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0360
     * @tc.name testGlobalSetTimeoutTest036
     * @tc.desc setTimeout two timers with double literal callback, ids distinct
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let id1: int = setTimeout((): void => {
        let d: number = 1.5;
      }, -1);
      let id2: int = setTimeout((): void => {
        let d: number = 2.5;
      }, 0);
      expect(id1).assertLarger(0);
      expect(id2).assertLarger(0);
      expect(id1).not().assertEqual(id2);
      clearTimeout(id1);
      clearTimeout(id2);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0370
     * @tc.name testGlobalSetTimeoutTest037
     * @tc.desc setTimeout two timers with arg-taking no-op callback, ids distinct
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let id1: int = setTimeout(
        (): void => {
          let e: int = 0;
        },
        0,
        42,
      );
      let id2: int = setTimeout(
        (): void => {
          let e: int = 0;
        },
        0,
        7,
        8,
      );
      expect(id1).assertLarger(0);
      expect(id2).assertLarger(0);
      expect(id1).not().assertEqual(id2);
      clearTimeout(id1);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0380
     * @tc.name testGlobalSetTimeoutTest038
     * @tc.desc setTimeout delayMs=0 returns positive timer ID, id1>0, id2>0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const cb1 = (): void => {
        let m: int = 0;
      };
      let id1: int = setTimeout(cb1, 0);
      let id2: int = setTimeout(cb1, 0);
      expect(id1).assertLarger(0);
      expect(id2).assertLarger(0);
      expect(id1).not().assertEqual(id2);
      clearTimeout(id1);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0390
     * @tc.name testGlobalSetTimeoutTest039
     * @tc.desc setTimeout delayMs=0 returns positive timer ID, id1>0, id2>0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let id1: int = setTimeout(Cls1.cb2, 0);
      let id2: int = setTimeout(Cls1.cb2, 0);
      expect(id1).assertLarger(0);
      expect(id2).assertLarger(0);
      expect(id1).not().assertEqual(id2);
      clearTimeout(id1);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0400
     * @tc.name testGlobalSetTimeoutTest040
     * @tc.desc setTimeout callback, id1>0, id2>0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let id1: int = setTimeout((): void => {
        let o: string = 'a';
      }, 0);
      let id2: int = setTimeout((): void => {
        let o: string = 'b';
      }, 0);
      expect(id1).assertLarger(0);
      expect(id2).assertLarger(0);
      expect(id1).not().assertEqual(id2);
      clearTimeout(id1);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0410
     * @tc.name testGlobalSetTimeoutTest041
     * @tc.desc setTimeout callback fires, thrown=true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let thrown: boolean = false;
        try {
          await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
            setTimeout((): void => {
              try {
                throw new Error('callback error');
              } catch (e) {
                expect(e.name).assertEqual('Error');
                thrown = true;
              } finally {
                resolve(undefined);
              }
            }, 0);
          });
        } catch (e) {
          expect(false).assertFail();
        }
        expect(thrown).assertTrue();
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0420
     * @tc.name testGlobalSetTimeoutTest042
     * @tc.desc setTimeout timer, gtid0=true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let id: int = setTimeout((): void => {}, null);
      const gtid0: boolean = id > 0;
      expect(gtid0).assertTrue();
      clearTimeout(id);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0430
     * @tc.name testGlobalSetTimeoutTest043
     * @tc.desc setTimeout with callback arg: callback receives 42, timer ID positive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let captured: int = -1;
        await new Promise<void>((resolve: (value: void) => void, _reject: (reason: Error) => void): void => {
          let id: int = setTimeout(
            (a: int): void => {
              captured = a;
              resolve(undefined);
            },
            0,
            42,
          );
          const gtid0: boolean = id > 0;
          expect(gtid0).assertTrue();
        });
        expect(captured).assertEqual(42);
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0440
     * @tc.name testGlobalSetTimeoutTest044
     * @tc.desc setTimeout registers timer, a='str', gtid0=true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let captured: string = '';
        await new Promise<void>((resolve: (value: void) => void, _reject: (reason: Error) => void): void => {
          let id: int = setTimeout(
            (a: string): void => {
              captured = a;
              resolve(undefined);
            },
            null,
            'str',
          );
          const gtid0: boolean = id > 0;
          expect(gtid0).assertTrue();
        });
        expect(captured).assertEqual('str');
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0450
     * @tc.name testGlobalSetTimeoutTest045
     * @tc.desc setTimeout registers timer, a=26, b=10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let capturedA: int = -1;
        let capturedB: int = -1;
        await new Promise<void>((resolve: (value: void) => void, _reject: (reason: Error) => void): void => {
          let id: int = setTimeout(
            (a: int, b: int): void => {
              capturedA = a;
              capturedB = b;
              resolve(undefined);
            },
            0,
            0x1a,
            0b1010,
          );
          const gtid0: boolean = id > 0;
          expect(gtid0).assertTrue();
        });
        expect(capturedA).assertEqual(26);
        expect(capturedB).assertEqual(10);
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0460
     * @tc.name testGlobalSetTimeoutTest046
     * @tc.desc setTimeout registers timer, a=100, b=0.0035
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let capturedA: number = -1;
        let capturedB: number = -1;
        try {
          await new Promise<void>((resolve: (value: void) => void, _reject: (reason: Error) => void): void => {
            let id: int = setTimeout(
              (a: number, b: number): void => {
                capturedA = a;
                capturedB = b;
                resolve(undefined);
              },
              0,
              1e2,
              3.5e-3,
            );
            const gtid0: boolean = id > 0;
            expect(gtid0).assertTrue();
          });
        } catch (e) {
          expect(false).assertFail();
        }
        expect(capturedA).assertEqual(100);
        expect(capturedB).assertEqual(0.0035);
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0470
     * @tc.name testGlobalSetTimeoutTest047
     * @tc.desc setTimeout with callback arg returns valid positive timer ID
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      {
        let id: int = setTimeout((a: int): void => {}, 0, 42);
        const gtid0: boolean = id > 0;
        expect(gtid0).assertTrue();
        clearTimeout(id);
      }
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0480
     * @tc.name testGlobalSetTimeoutTest048
     * @tc.desc setTimeout callback, gtid0=true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      {
        let id: int = setTimeout((a: int, b: string): void => {}, 0, 42, 's');
        const gtid0: boolean = id > 0;
        expect(gtid0).assertTrue();
        clearTimeout(id);
      }
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0490
     * @tc.name testGlobalSetTimeoutTest049
     * @tc.desc setTimeout callback fires, errorCaught=true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let errorCaught: boolean = false;
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout((): void => {
            try {
              throw new Error('cbErr');
            } catch (e) {
              expect(e.name).assertEqual('Error');
              errorCaught = true;
              expect(e.message).assertEqual('cbErr');
            } finally {
              resolve(undefined);
            }
          }, 0);
        });
        expect(errorCaught).assertTrue();
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0500
     * @tc.name testGlobalSetTimeoutTest050
     * @tc.desc setTimeout callback fires, errMsg="timeoutFail"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let errMsg: string = '';
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout((): void => {
            try {
              throw new Error('timeoutFail');
            } catch (e) {
              expect(e.name).assertEqual('Error');
              errMsg = e.message;
            } finally {
              resolve(undefined);
            }
          }, 0);
        });
        expect(errMsg).assertEqual('timeoutFail');
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0510
     * @tc.name testGlobalSetTimeoutTest051
     * @tc.desc setTimeout callback fires, Error('nullDelayErr') caught
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caught: boolean = false;
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout((): void => {
            try {
              throw new Error('nullDelayErr');
            } catch (e) {
              expect(e.name).assertEqual('Error');
              expect(e.message).assertEqual('nullDelayErr');
              caught = true;
            } finally {
              resolve(undefined);
            }
          }, null);
        });
        expect(caught).assertTrue();
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0520
     * @tc.name testGlobalSetTimeoutTest052
     * @tc.desc setTimeout callback fires, Error('negDelayErr') caught
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caught: boolean = false;
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout((): void => {
            try {
              throw new Error('negDelayErr');
            } catch (e) {
              expect(e.name).assertEqual('Error');
              expect(e.message).assertEqual('negDelayErr');
              caught = true;
            } finally {
              resolve(undefined);
            }
          }, -1);
        });
        expect(caught).assertTrue();
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0530
     * @tc.name testGlobalSetTimeoutTest053
     * @tc.desc setTimeout callback fires, errInfo="arg_42"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let errInfo: string = '';
        try {
          await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
            setTimeout(
              (x: int): void => {
                try {
                  throw new Error('arg_' + x);
                } catch (e) {
                  expect(e.name).assertEqual('Error');
                  errInfo = e.message;
                } finally {
                  resolve(undefined);
                }
              },
              0,
              42,
            );
          });
        } catch (e) {
          expect(false).assertFail();
        }
        expect(errInfo).assertEqual('arg_42');
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0540
     * @tc.name testGlobalSetTimeoutTest054
     * @tc.desc setTimeout callback fires, normalVal=777, errFlag=true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let normalVal: int = 0;
        let errFlag: boolean = false;
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout((): void => {
            normalVal = 777;
            resolve(undefined);
          }, 0);
        });
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout((): void => {
            try {
              throw new Error('err');
            } catch (e) {
              expect(e.name).assertEqual('Error');
              errFlag = true;
            } finally {
              resolve(undefined);
            }
          }, 0);
        });
        expect(normalVal).assertEqual(777);
        expect(errFlag).assertTrue();
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0550
     * @tc.name testGlobalSetTimeoutTest055
     * @tc.desc setTimeout callback fires, errCount=3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let errCount: int = 0;
        const throwAndCatch = (msg: string): Promise<void> => {
          return new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
            setTimeout((): void => {
              try {
                throw new Error(msg);
              } catch (e) {
                expect(e.name).assertEqual('Error');
                errCount = errCount + 1;
              } finally {
                resolve(undefined);
              }
            }, 0);
          });
        };
        try {
          await throwAndCatch('e1');
        } catch (e) {
          expect(false).assertFail();
        }
        try {
          await throwAndCatch('e2');
        } catch (e) {
          expect(false).assertFail();
        }
        try {
          await throwAndCatch('e3');
        } catch (e) {
          expect(false).assertFail();
        }
        expect(errCount).assertEqual(3);
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0560
     * @tc.name testGlobalSetTimeoutTest056
     * @tc.desc setTimeout callback fires, msg="noDelayThrow"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let msg: string = '';
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout((): void => {
            try {
              throw new Error('noDelayThrow');
            } catch (e) {
              expect(e.name).assertEqual('Error');
              msg = e.message;
            } finally {
              resolve(undefined);
            }
          });
        });
        expect(msg).assertEqual('noDelayThrow');
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0570
     * @tc.name testGlobalSetTimeoutTest057
     * @tc.desc setTimeout callback fires, Error('nestedErr') caught
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let caught: boolean = false;
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout((): void => {
            setTimeout((): void => {
              try {
                throw new Error('nestedErr');
              } catch (e) {
                expect(e.name).assertEqual('Error');
                expect(e.message).assertEqual('nestedErr');
                caught = true;
              } finally {
                resolve(undefined);
              }
            }, 0);
          }, 0);
        });
        expect(caught).assertTrue();
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0580
     * @tc.name testGlobalSetTimeoutTest058
     * @tc.desc setTimeout rest args (1,2,3) passed to callback; thrown error caught inside, errMsg "123" verified
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let errMsg: string = '';
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout(
            (a: int, b: int, c: int): void => {
              try {
                throw new Error('' + a + b + c);
              } catch (e) {
                expect(e.name).assertEqual('Error');
                errMsg = e.message;
              } finally {
                resolve(undefined);
              }
            },
            0,
            1,
            2,
            3,
          );
        });
        expect(errMsg).assertEqual('123');
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0590
     * @tc.name testGlobalSetTimeoutTest059
     * @tc.desc setTimeout callback fires, lenGtstack=true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let stack: string = '';
        await new Promise<void>((resolve: (value: void) => void, _reject: (reason: Error) => void): void => {
          setTimeout((): void => {
            try {
              throw new Error('stackCheck');
            } catch (e) {
              expect(e.name).assertEqual('Error');
              const s: string | undefined = e.stack;
              if (s !== undefined) {
                stack = s;
              }
            } finally {
              resolve(undefined);
            }
          }, 0);
        });
        const lenGtstack: boolean = stack.length > 0;
        expect(lenGtstack).assertTrue();
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0600
     * @tc.name testGlobalSetTimeoutTest060
     * @tc.desc setTimeout callback, fires
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let ids: int[] = [0, 0, 0, 0, 0];
      ids[0] = setTimeout((): void => {}, 0);
      ids[1] = setTimeout((): void => {}, 0);
      ids[2] = setTimeout((): void => {}, 0);
      ids[3] = setTimeout((): void => {}, 0);
      ids[4] = setTimeout((): void => {}, 0);
      const gt0: boolean = ids[0] > 0 && ids[1] > 0 && ids[2] > 0 && ids[3] > 0 && ids[4] > 0;
      expect(gt0).assertTrue();
      const distinct: boolean = ids[0] !== ids[1] && ids[1] !== ids[2] && ids[2] !== ids[3] && ids[3] !== ids[4];
      expect(distinct).assertTrue();
      for (let i: int = 0; i < 5; i++) {
        clearTimeout(ids[i]);
      }
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0610
     * @tc.name testGlobalSetTimeoutTest061
     * @tc.desc setTimeout callback, distinct=true, both ids > 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let arr: int[] = [0, 0];
      arr[0] = setTimeout((): void => {}, 0);
      arr[1] = setTimeout((): void => {}, 0);
      const distinct: boolean = arr[0] !== arr[1];
      expect(distinct).assertTrue();
      expect(arr[0]).assertLarger(0);
      expect(arr[1]).assertLarger(0);
      clearTimeout(arr[0]);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0620
     * @tc.name testGlobalSetTimeoutTest062
     * @tc.desc setTimeout with Promise, two timers fire counter=2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let counter: int = 0;
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout((): void => {
            counter = counter + 1;
            resolve(undefined);
          }, 0);
        });
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout((): void => {
            counter = counter + 1;
            resolve(undefined);
          }, 0);
        });
        expect(counter).assertEqual(2);
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0630
     * @tc.name testGlobalSetTimeoutTest063
     * @tc.desc setTimeout with Promise, three timers fire arr=[10,20,30]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let arr: int[] = [0, 0, 0];
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout((): void => {
            arr[0] = 10;
            resolve(undefined);
          }, 0);
        });
        try {
          await new Promise<void>((resolve2: (value: void) => void, _reject2: (e: Error) => void): void => {
            setTimeout((): void => {
              arr[1] = 20;
              resolve2(undefined);
            }, 0);
          });
        } catch (e) {
          expect(false).assertFail();
        }
        try {
          try {
            await new Promise<void>((resolve3: (value: void) => void, _reject3: (e: Error) => void): void => {
              setTimeout((): void => {
                arr[2] = 30;
                resolve3(undefined);
              }, 0);
            });
          } catch (e) {
            expect(false).assertFail();
          }
        } catch (e) {
          expect(false).assertFail();
        }
        expect(arr[0]).assertEqual(10);
        expect(arr[1]).assertEqual(20);
        expect(arr[2]).assertEqual(30);
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0640
     * @tc.name testGlobalSetTimeoutTest064
     * @tc.desc setTimeout callback fires, result=150
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let base: int = 100;
        let result: int = 0;
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout((): void => {
            result = base + 50;
            resolve(undefined);
          }, 0);
        });
        expect(result).assertEqual(150);
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0650
     * @tc.name testGlobalSetTimeoutTest065
     * @tc.desc setTimeout callback fires, flags0=false, flags1=true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let flags: boolean[] = [true, false, true];
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout((): void => {
            flags[0] = !flags[0];
            resolve(undefined);
          }, 0);
        });
        try {
          await new Promise<void>((resolve2: (value: void) => void, _reject2: (e: Error) => void): void => {
            setTimeout((): void => {
              flags[1] = !flags[1];
              resolve2(undefined);
            }, 0);
          });
        } catch (e) {
          expect(false).assertFail();
        }
        const flags0: boolean = flags[0];
        expect(flags0).assertFalse();
        const flags1: boolean = flags[1];
        expect(flags1).assertTrue();
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0660
     * @tc.name testGlobalSetTimeoutTest066
     * @tc.desc setTimeout callback fires, shared="ABC"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let shared: string = '';
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout((): void => {
            shared = shared + 'A';
            resolve(undefined);
          }, 0);
        });
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout((): void => {
            shared = shared + 'B';
            resolve(undefined);
          }, 0);
        });
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout((): void => {
            shared = shared + 'C';
            resolve(undefined);
          }, 0);
        });
        expect(shared).assertEqual('ABC');
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0670
     * @tc.name testGlobalSetTimeoutTest067
     * @tc.desc setTimeout callback fires, inner=15
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let outer: int = 5;
        let inner: int = 0;
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout((): void => {
            setTimeout((): void => {
              inner = outer + 10;
              resolve(undefined);
            }, 0);
          }, 0);
        });
        expect(inner).assertEqual(15);
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0680
     * @tc.name testGlobalSetTimeoutTest068
     * @tc.desc setTimeout callback fires, total=3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let total: int = 0;
        const addOne = (): Promise<void> => {
          return new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
            setTimeout((): void => {
              total = total + 1;
              resolve(undefined);
            }, 0);
          });
        };
        try {
          await addOne();
        } catch (e) {
          expect(false).assertFail();
        }
        try {
          await addOne();
        } catch (e) {
          expect(false).assertFail();
        }
        try {
          await addOne();
        } catch (e) {
          expect(false).assertFail();
        }
        expect(total).assertEqual(3);
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0690
     * @tc.name testGlobalSetTimeoutTest069
     * @tc.desc setTimeout callback fires, _mapVal=100
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let map: Map<string, int> = new Map<string, int>();
        map.set('key', 0);
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout((): void => {
            map.set('key', 100);
            resolve(undefined);
          }, 0);
        });
        const _mapVal: int | undefined = map.get('key');
        expect(_mapVal).assertEqual(100);
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0700
     * @tc.name testGlobalSetTimeoutTest070
     * @tc.desc setTimeout callback fires, array copy dst[0] gets src[0] before source mutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let src: int[] = [1, 2, 3];
        let dst: int[] = [0, 0, 0];
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout((): void => {
            dst[0] = src[0];
            src[0] = 99;
            resolve(undefined);
          }, 0);
        });
        expect(dst[0]).assertEqual(1);
        expect(src[0]).assertEqual(99);
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0710
     * @tc.name testGlobalSetTimeoutTest071
     * @tc.desc setTimeout callback fires, area=6.28318 (pi*2.0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let pi: number = 3.14159;
        let area: number = 0.0;
        await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
          setTimeout((): void => {
            area = pi * 2.0;
            resolve(undefined);
          }, 0);
        });
        expect(area).assertEqual(6.28318);
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0720
     * @tc.name testGlobalSetTimeoutTest072
     * @tc.desc setTimeout callback fires, stage chain 1->2->3 across three chained timers
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let stage: int = 0;
        try {
          await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
            setTimeout((): void => {
              stage = 1;
              resolve(undefined);
            }, 0);
          });
        } catch (e) {
          expect(false).assertFail();
        }
        try {
          await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
            setTimeout((): void => {
              if (stage === 1) {
                stage = 2;
              }
              resolve(undefined);
            }, 0);
          });
        } catch (e) {
          expect(false).assertFail();
        }
        try {
          await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
            setTimeout((): void => {
              if (stage === 2) {
                stage = 3;
              }
              resolve(undefined);
            }, 0);
          });
        } catch (e) {
          expect(false).assertFail();
        }
        expect(stage).assertEqual(3);
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0730
     * @tc.name testGlobalSetTimeoutTest073
     * @tc.desc setTimeout registers timer, c=3, the awaited callback fires, setting an observable value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let a: int = 1;
        let b: int = 2;
        let c: int = 0;
        try {
          await new Promise<void>((resolve: (value: void) => void, _reject: (e: Error) => void): void => {
            setTimeout((): void => {
              c = a + b;
              resolve(undefined);
            }, 0);
          });
        } catch (e) {
          expect(false).assertFail();
        }
        expect(c).assertEqual(3);
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0740
     * @tc.name testGlobalSetTimeoutTest074
     * @tc.desc setTimeout registers timer, timerId>0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const cb = (): void => {};
      const timerId: int = setTimeout(cb);
      expect(timerId).assertLarger(0);
      clearTimeout(timerId);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0750
     * @tc.name testGlobalSetTimeoutTest075
     * @tc.desc setTimeout with string message returns positive timer ID
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const timerId: int = setTimeout('delayed log entry');
      expect(timerId).assertLarger(0);
      clearTimeout(timerId);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0760
     * @tc.name testGlobalSetTimeoutTest076
     * @tc.desc setTimeout(msg, delayMs) string overload with numeric delay returns positive timer ID
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const timerId: int = setTimeout('timer fired msg', 0);
      expect(timerId).assertLarger(0);
      clearTimeout(timerId);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0770
     * @tc.name testGlobalSetTimeoutTest077
     * @tc.desc setTimeout(msg, null) string overload with null delay returns positive timer ID
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const timerId: int = setTimeout('null delay trigger', null);
      expect(timerId).assertLarger(0);
      clearTimeout(timerId);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0780
     * @tc.name testGlobalSetTimeoutTest078
     * @tc.desc setTimeout(msg, delayMs) string overload with delay=50 returns clearable timer ID
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const timerId: int = setTimeout('scheduled output', 50);
      expect(timerId).assertLarger(0);
      clearTimeout(timerId);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0790
     * @tc.name testGlobalSetTimeoutTest079
     * @tc.desc setTimeout passes Object arg to callback via ...args
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        const data: Payload = new Payload('delivered');
        let matched: boolean = false;
        let id: int = setTimeout(
          (p: Payload): void => {
            matched = p.tag === 'delivered';
          },
          15,
          data,
        );
        expect(id).assertLarger(0);
        try {
          await Utils.msSleep(60);
        } catch (e) {
          expect(false).assertFail();
        }
        clearTimeout(id);
        expect(matched).assertTrue();
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0800
     * @tc.name testGlobalSetTimeoutTest080
     * @tc.desc setTimeout passes null and undefined as arg values via ...args
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let nullCheck: boolean = false;
        let undefCheck: boolean = false;
        let id: int = setTimeout(
          (a: object | null, b: string | undefined): void => {
            nullCheck = a === null;
            undefCheck = b === undefined;
          },
          15,
          null,
          undefined,
        );
        expect(id).assertLarger(0);
        try {
          await Utils.msSleep(60);
        } catch (e) {
          expect(false).assertFail();
        }
        clearTimeout(id);
        expect(nullCheck).assertTrue();
        expect(undefCheck).assertTrue();
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0810
     * @tc.name testGlobalSetTimeoutTest081
     * @tc.desc 50 setTimeout calls produce 50 unique timer IDs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const ids: int[] = [];
      for (let i: int = 0; i < 50; i++) {
        ids.push(setTimeout((): void => {}, 5000));
      }
      const seen: Set<int> = new Set<int>();
      for (let j: int = 0; j < ids.length; j++) {
        seen.add(ids[j]);
      }
      expect(seen.size).assertEqual(50);
      for (let k: int = 0; k < ids.length; k++) {
        clearTimeout(ids[k]);
      }
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0820
     * @tc.name testGlobalSetTimeoutTest082
     * @tc.desc setTimeout with Promise, fired=true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let fired: boolean = false;
        await new Promise<void>((resolve: (value: void) => void, _reject: (reason: Error) => void): void => {
          setTimeout((): void => {
            fired = true;
            resolve(undefined);
          }, 10);
        });
        expect(fired).assertTrue();
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0830
     * @tc.name testGlobalSetTimeoutTest083
     * @tc.desc nested clearTimeout: outer callback clears inner timer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let nestedFired: boolean = false;
        let outerFired: boolean = false;
        let targetId: int = setTimeout((): void => {
          nestedFired = true;
        }, 100);
        let outerId: int = setTimeout((): void => {
          clearTimeout(targetId);
          outerFired = true;
        }, 20);
        try {
          await Utils.msSleep(200);
        } catch (e) {
          expect(false).assertFail();
        }
        expect(outerFired).assertTrue();
        expect(nestedFired).assertFalse();
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0840
     * @tc.name testGlobalSetTimeoutTest084
     * @tc.desc batch of 20 timers fire sequentially, all count
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let count: int = 0;
        for (let i: int = 0; i < 20; i++) {
          try {
            await new Promise<void>((resolve: (value: void) => void, _reject: (reason: Error) => void): void => {
              setTimeout((): void => {
                count = count + 1;
                resolve(undefined);
              }, 0);
            });
          } catch (e) {
            expect(false).assertFail();
          }
        }
        expect(count).assertEqual(20);
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0850
     * @tc.name testGlobalSetTimeoutTest085
     * @tc.desc setTimeout with delay=50 and one arg, callback captures the arg
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let captured: int = 0;
        try {
          await new Promise<void>((resolve: (value: void) => void, _reject: (reason: Error) => void): void => {
            setTimeout(
              (a: int): void => {
                captured = a;
                resolve(undefined);
              },
              50,
              42,
            );
          });
        } catch (e) {
          expect(false).assertFail();
        }
        expect(captured).assertEqual(42);
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0860
     * @tc.name testGlobalSetTimeoutTest086
     * @tc.desc setTimeout(null as () => void, 0) with null callback via type cast throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        setTimeout(null as () => void, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0870
     * @tc.name testGlobalSetTimeoutTest087
     * @tc.desc setTimeout(undefined as () => void, 0) with undefined callback via type cast throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        setTimeout(undefined as () => void, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0880
     * @tc.name testGlobalSetTimeoutTest088
     * @tc.desc setTimeout with long string message (10000 chars) returns valid timer id
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let longMsg: string = 'a'.repeat(10000);
      let id: int = setTimeout(longMsg, 100);
      expect(id).assertLarger(0);
      clearTimeout(id);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0890
     * @tc.name testGlobalSetTimeoutTest089
     * @tc.desc setTimeout with unicode/emoji string message returns valid timer id
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      const timerId: int = setTimeout('😀🔥👍', 0);
      expect(timerId).assertLarger(0);
      clearTimeout(timerId);
      done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0900
     * @tc.name testGlobalSetTimeoutTest090
     * @tc.desc setTimeout with different delays: shorter delay fires first
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let first: int = -1;
        setTimeout((): void => {
          if (first === -1) {
            first = 1;
          }
        }, 50);
        setTimeout((): void => {
          if (first === -1) {
            first = 2;
          }
        }, 10);
        try {
          await Utils.msSleep(100);
        } catch (e) {
          expect(false).assertFail();
        }
        expect(first).assertEqual(2);
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0910
     * @tc.name testGlobalSetTimeoutTest091
     * @tc.desc Recursive setTimeout: callback chains 3 times, count reaches 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let count: int = 0;
        setTimeout((): void => {
          count++;
          setTimeout((): void => {
            count++;
            setTimeout((): void => {
              count++;
            }, 10);
          }, 10);
        }, 10);
        try {
          await Utils.msSleep(80);
        } catch (e) {
          expect(false).assertFail();
        }
        expect(count).assertEqual(3);
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0920
     * @tc.name testGlobalSetTimeoutTest092
     * @tc.desc setTimeout with object param: callback modifies property, verified externally
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        const obj: Record<string, int> = { 'value': 0 };
        setTimeout(
          (o: Record<string, int>): void => {
            o['value'] = 42;
          },
          10,
          obj,
        );
        await Utils.msSleep(50);
        expect(obj['value']).assertEqual(42);
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0930
     * @tc.name testGlobalSetTimeoutTest093
     * @tc.desc Bulk create 100 setTimeout(fn, 0) and verify all fire
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let count: int = 0;
        for (let i: int = 0; i < 100; i++) {
          setTimeout((): void => {
            count = count + 1;
          }, 0);
        }
        try {
          try {
            await Utils.msSleep(200);
          } catch (e) {
            expect(false).assertFail();
          }
        } catch (e) {
          expect(false).assertFail();
        }
        expect(count).assertEqual(100);
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0940
     * @tc.name testGlobalSetTimeoutTest094
     * @tc.desc setTimeout with byte type delay parameter, callback fires
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let fired: boolean = false;
        const delay: byte = 10;
        const id: int = setTimeout((): void => {
          fired = true;
        }, delay);
        await Utils.msSleep(50);
        clearTimeout(id);
        expect(fired).assertTrue();
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0950
     * @tc.name testGlobalSetTimeoutTest095
     * @tc.desc setTimeout with short type delay parameter, callback fires
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let fired: boolean = false;
        const delay: short = 10;
        const id: int = setTimeout((): void => {
          fired = true;
        }, delay);
        await Utils.msSleep(50);
        clearTimeout(id);
        expect(fired).assertTrue();
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0960
     * @tc.name testGlobalSetTimeoutTest096
     * @tc.desc setTimeout with int type delay parameter, callback fires
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let fired: boolean = false;
        const delay: int = 10;
        const id: int = setTimeout((): void => {
          fired = true;
        }, delay);
        await Utils.msSleep(50);
        clearTimeout(id);
        expect(fired).assertTrue();
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0970
     * @tc.name testGlobalSetTimeoutTest097
     * @tc.desc setTimeout with long type delay parameter, callback fires
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let fired: boolean = false;
        const delay: long = 10;
        let id: int = 0;
        id = setTimeout((): void => {
          fired = true;
        }, Long.toInt(delay));
        await Utils.msSleep(50);
        clearTimeout(id);
        expect(fired).assertTrue();
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0980
     * @tc.name testGlobalSetTimeoutTest098
     * @tc.desc setTimeout with float type delay parameter, callback fires
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let fired: boolean = false;
        const delay: float = 10;
        let id: int = 0;
        id = setTimeout((): void => {
          fired = true;
        }, Float.toInt(delay));
        await Utils.msSleep(50);
        clearTimeout(id);
        expect(fired).assertTrue();
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_0990
     * @tc.name testGlobalSetTimeoutTest099
     * @tc.desc setTimeout with number type delay parameter, callback fires
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let fired: boolean = false;
        const delay: number = 10;
        let id: int = 0;
        id = setTimeout((): void => {
          fired = true;
        }, Double.toInt(delay));
        await Utils.msSleep(50);
        clearTimeout(id);
        expect(fired).assertTrue();
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_1000
     * @tc.name testGlobalSetTimeoutTest100
     * @tc.desc setTimeout with func only, no delay parameter, returns positive timer ID
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let fired: boolean = false;
        const id: int = setTimeout((): void => {
          fired = true;
        });
        expect(id).assertLarger(0);
        await Utils.msSleep(50);
        clearTimeout(id);
        expect(fired).assertTrue();
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_1010
     * @tc.name testGlobalSetTimeoutTest101
     * @tc.desc setTimeout with delayMs=null, callback fires
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let fired: boolean = false;
        const id: int = setTimeout((): void => {
          fired = true;
        }, null);
        expect(id).assertLarger(0);
        await Utils.msSleep(50);
        clearTimeout(id);
        expect(fired).assertTrue();
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_1020
     * @tc.name testGlobalSetTimeoutTest102
     * @tc.desc setTimeout with delayMs=null, callback fires then cleared
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let fired: boolean = false;
        const delayMs: int | null = null;
        const id: int = setTimeout((): void => {
          fired = true;
        }, delayMs);
        expect(id).assertLarger(0);
        try {
          await Utils.msSleep(50);
        } catch (e) {
          expect(false).assertFail();
        }
        clearTimeout(id);
        expect(fired).assertTrue();
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_1030
     * @tc.name testGlobalSetTimeoutTest103
     * @tc.desc setTimeout with negative delayMs, callback still fires (treated as 0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let fired: boolean = false;
        const id: int = setTimeout((): void => {
          fired = true;
        }, -100);
        expect(id).assertLarger(0);
        try {
          await Utils.msSleep(50);
        } catch (e) {
          expect(false).assertFail();
        }
        clearTimeout(id);
        expect(fired).assertTrue();
        done();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SETTIMEOUT_TEST_1040
     * @tc.name testGlobalSetTimeoutTest104
     * @tc.desc clearTimeout on already-fired timer does not throw
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalSetTimeoutTest104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        let fired: boolean = false;
        const id: int = setTimeout((): void => {
          fired = true;
        }, 10);
        try {
          await Utils.msSleep(50);
        } catch (e) {
          expect(false).assertFail();
        }
        const result: void = clearTimeout(id);
        expect(result).assertUndefined();
        expect(fired).assertTrue();
        done();
    });
  });
}
