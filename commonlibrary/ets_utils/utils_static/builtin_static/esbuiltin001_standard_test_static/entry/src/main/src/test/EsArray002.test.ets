/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';
import hilog from '@ohos.hilog'
import Utils from './Util.test';
class A {}
class A_133 {
  valueOf1 = (): number => {
    return 1
  }
  toString1 = (): number => {
    return -2
  }
}
let n_165: number = 0;
class A_165 {
  public toLocaleString(): string {
    n_165++;
    return "";
  }
}
class A_172 {
  valueOf = (): string => {
    return ''
  }
  toString1? = (): string => {
    return ''
  }
}
class AA_172 {
}
class B_172 {
  valueOf = (): string => {
    return ''
  }
  toString1? = (): object => {
    return {} as AA_172
  }
}
class C_172 {
  toString1 = (): string => {
    return ''
  }
}
class D_172 {
  valueOf = (): object => {
    return {} as AA_172
  }
  toString1 = (): string => {
    return ''
  }
}
interface GeneratedTypeLiteralInterface_1 {
  name: string;
  rating: number;
}
export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
export default function EsArrayTest002(){
  describe('EsArrayTest002', ():void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(():void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async ():Promise<void> => {
      await sleep(10);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(():void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(():void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0001
     * @tc.name ESArrayPrototypeTest20001
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20001';
      console.info(`${caseName}, test start`);
      let srcArr: Array<number> = new Array<number>(1, 2, 33, 4, 5);
      let callbackfn = (val: number, idx: int, obj: Array<number>): number => {
        srcArr[2] = 3;
        if (5 < srcArr.length) {
          srcArr[5] = 6;
        }
        return 1;
      }
      let resArr = srcArr.map(callbackfn);

      expect(resArr.length).assertEqual(5);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0002
     * @tc.name ESArrayPrototypeTest20002
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20002';
      console.info(`${caseName}, test start`);
      let srcArr: Array<number> = new Array<number>(1, 2, 3, 4, 5);
      let callbackfn = (val: number, idx: int, obj: Array<number>): number => {
        srcArr[4] = -1;
        if (val > 0) return 1;
        else return 0;
      }
      let resArr = srcArr.map(callbackfn);

      expect(resArr.length).assertEqual(5);
      expect(resArr[4]).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0003
     * @tc.name ESArrayPrototypeTest20003
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20003';
      console.info(`${caseName}, test start`);
      let callCnt = 0;
      let srcArr: Array<number> = new Array<number>(1, 2, 3, 4, 5);
      let callbackfn = (val: number, idx: int, obj: Array<number>): number => {
        srcArr.length = 2;
        callCnt++;
        return 1;
      }
      let resArr = srcArr.map(callbackfn);

      expect(resArr.length).assertEqual(5);
      expect(callCnt).assertEqual(2);
      expect(resArr.toString()).assertEqual('1,1,,,');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0004
     * @tc.name ESArrayPrototypeTest20004
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20004';
      console.info(`${caseName}, test start`);
      let callCnt = 0;
      let srcArr: Array<number> = new Array<number>(10);
      srcArr[1] = 1;
      srcArr[2] = 2;

      let callbackfn = (val: number | undefined, idx: int, obj: Array<number>): number => {
        if (1000 < obj.length) {
          obj[1000] = 3;
        }
        if(val) {
          callCnt++;
          return val!;
        }
      }

      let resArr = srcArr.map<number>(callbackfn);

      expect(resArr.length).assertEqual(10);
      expect(callCnt).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0005
     * @tc.name ESArrayPrototypeTest20005
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20005';
      console.info(`${caseName}, test start`);
      let callCnt = 0;
      let srcArr: Array<undefined> = new Array<undefined>(10);
      srcArr[1] = undefined; // explicitly assigning a value

      let callbackfn = (val: undefined, idx: int, obj: Array<undefined>): number => {
        callCnt++;
        return 1;
      }

      let resArr = srcArr.map(callbackfn);

      expect(resArr.length).assertEqual(10);
      expect(callCnt).assertEqual(10);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0006
     * @tc.name ESArrayPrototypeTest20006
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20006';
      console.info(`${caseName}, test start`);
      let kValue: A = {};
      let callbackfn = (val: object, idx: int, obj: Array<object>): boolean => {
        if (idx === 0) {
          return val === kValue;
        }
        return false;
      }

      let arr: Array<object> = new Array<object>(kValue);
      let newArr = arr.map(callbackfn);

      expect(newArr[0]).assertEqual(true);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0007
     * @tc.name ESArrayPrototypeTest20007
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20007';
      console.info(`${caseName}, test start`);
      let bPar = true;
      let bCalled = false;

      let callbackfn = (val: number, idx: int, obj: Array<number>): boolean => {
        bCalled = true;
        if (obj[idx] !== val) {
          bPar = false;
        }
        return bPar;
      }

      let srcArr: Array<number> = new Array<number>(0, 1);
      if (999999 < srcArr.length) {
        srcArr[999999] = -6.6;
      }
      let resArr = srcArr.map(callbackfn);

      expect(bCalled).assertEqual(true);
      expect(bPar).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0008
     * @tc.name ESArrayPrototypeTest20008
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20008';
      console.info(`${caseName}, test start`);
      let arr: Array<number> = new Array<number>(0, 1, 2, 3, 4, 5);
      let lastIdx = 0;
      let called = 0;
      let result = true;

      let callbackfn = (val: number, idx: int, obj: Array<number>): boolean => {
        called++;
        if (lastIdx !== idx) {
          result = false;
        } else {
          lastIdx++;
        }
        return result;
      }

      arr.map(callbackfn);

      expect(result).assertEqual(true);
      expect(arr.length).assertEqual(called);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0009
     * @tc.name ESArrayPrototypeTest20009
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20009';
      console.info(`${caseName}, test start`);
      let callbackfn = (val: number, idx: int, obj: Array<number>): boolean => {
        if (obj[idx] < 13) {
          //when current position is visited, its previous index should has been visited.
          if (idx !== 0 && typeof obj[idx - 1] === "undefined") {
            return true;
          }
          obj[idx] = 1;
          return false;
        } else {
          return true;
        }
      }

      let srcArr: Array<number> = new Array<number>(11, 12, 13, 14);
      let testResult = srcArr.map(callbackfn);

      expect(testResult.length).assertEqual(4);
      expect(testResult[0]).assertEqual(false);
      expect(testResult[1]).assertEqual(false);
      expect(testResult[2]).assertEqual(true);
      expect(testResult[3]).assertEqual(true);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0010
     * @tc.name ESArrayPrototypeTest20010
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20010';
      console.info(`${caseName}, test start`);
      let callbackfn = (val: number): boolean => {
        return val > 10;
      }
      let srcArr: Array<number> = new Array<number>();
      srcArr.push(11);
      let testResult = srcArr.map(callbackfn);

      expect(testResult[0]).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0011
     * @tc.name ESArrayPrototypeTest20011
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20011';
      console.info(`${caseName}, test start`);
      let callbackfn = (val: number, idx: int, obj: Array<number>): boolean => {
        return true;
      }
      let srcArr: Array<number> = new Array<number>();
      srcArr.push(11);
      let testResult = srcArr.map(callbackfn);

      expect(testResult[0]).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0012
     * @tc.name ESArrayPrototypeTest20012
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20012';
      console.info(`${caseName}, test start`);
      let callbackfn = (val: number, idx: int, obj: Array<number>): boolean => {
        return (val > 10 && obj[idx] === val);
      }

      let srcArr: Array<number> = new Array<number>();
      srcArr.push(11);
      let testResult = srcArr.map(callbackfn);

      expect(testResult[0]).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0013
     * @tc.name ESArrayPrototypeTest20013
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20013';
      console.info(`${caseName}, test start`);
      let callbackfn = (val: number, idx: int, obj: Array<number>): boolean => {
        return true;
      }
      let srcArr: Array<number> = new Array<number>(1, 2, 3, 4, 5);
      srcArr.map(callbackfn);

      expect(srcArr[0]).assertEqual(1);
      expect(srcArr[1]).assertEqual(2);
      expect(srcArr[2]).assertEqual(3);
      expect(srcArr[3]).assertEqual(4);
      expect(srcArr[4]).assertEqual(5);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0014
     * @tc.name ESArrayPrototypeTest20014
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20014';
      console.info(`${caseName}, test start`);
      let callbackfn = (val: number, idx: int, obj: Array<number>): number => {
        return val + 10;
      }
      let srcArr: Array<number> = new Array<number>(1, 2, 3, 4, 5);
      let resArr = srcArr.map(callbackfn);

      expect(resArr[0]).assertEqual(11);
      expect(resArr[1]).assertEqual(12);
      expect(resArr[2]).assertEqual(13);
      expect(resArr[3]).assertEqual(14);
      expect(resArr[4]).assertEqual(15);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0015
     * @tc.name ESArrayPrototypeTest20015
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20015';
      console.info(`${caseName}, test start`);
      let callCnt = 0;
      let callbackfn = (val: number, idx: int, obj: Array<number>): number => {
        callCnt++;
        return val;
      }
      let srcArr: Array<number> = new Array<number>(1, 2, 3, 4, 5);

      let resArr = srcArr.map(callbackfn);

      expect(callCnt).assertEqual(5);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0016
     * @tc.name ESArrayPrototypeTest20016
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20016';
      console.info(`${caseName}, test start`);
      let called = 0;
      let callbackfn = (val: number, idx: int, obj: Array<number>): boolean => {
        called++;
        return val > 2;
      }
      let arr: Array<number> = new Array<number>(1, 2, 3, 4);

      arr.map(callbackfn);

      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(called).assertEqual(4);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0017
     * @tc.name ESArrayPrototypeTest20017
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20017';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>();
      let pop1 = x.pop();
      expect(pop1).assertEqual(undefined);
      expect(x.length).assertEqual(0);

      let x2: Array<number> = new Array<number>(1, 2, 3);
      x2.length = 0;
      let pop2 = x2.pop();
      expect(pop2).assertEqual(undefined);
      expect(x2.length).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0018
     * @tc.name ESArrayPrototypeTest20018
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20018';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>(0, 1, 2, 3);
      let pop1 = x.pop();
      expect(Number(pop1)).assertEqual(3);
      expect(x.length).assertEqual(3);
      expect(x[2]).assertEqual(2);

      x = new Array<number>(4);
      x[0] = 0;
      x[3] = 3;
      let pop2 = x.pop();
      expect(Number(pop2)).assertEqual(3);
      expect(x.length).assertEqual(3);

      x.length = 1;
      let pop3 = x.pop();
      expect(Number(pop3)).assertEqual(0);
      expect(x.length).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0019
     * @tc.name ESArrayPrototypeTest20019
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20019';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>();
      let push1 = x.push(1);
      expect(push1).assertEqual(1);
      expect(x[0]).assertEqual(1);

      let push2 = x.push();
      expect(push2).assertEqual(1);

      let push3 = x.push(-1);
      expect(push3).assertEqual(2);
      expect(x[1]).assertEqual(-1);
      expect(x.length).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0020
     * @tc.name ESArrayPrototypeTest20020
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20020';
      console.info(`${caseName}, test start`);
      let x: Array<number> = new Array<number>();
      expect(x.length).assertEqual(0);

      x = new Array<number>(1);
      x[0] = 0;
      let push1 = x.push(1, Number.POSITIVE_INFINITY, 2, 3, 4);
      expect(push1).assertEqual(6);
      expect(x[0]).assertEqual(0);
      expect(x[1]).assertEqual(1);
      expect(x[2]).assertEqual(Number.POSITIVE_INFINITY);
      expect(x[3]).assertEqual(2);
      expect(x[4]).assertEqual(3);
      expect(x[5]).assertEqual(4);
      expect(x.length).assertEqual(6);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0021
     * @tc.name ESArrayPrototypeTest20021
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20021';
      console.info(`${caseName}, test start`);
      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        return 1;
      }
      let srcArr: Array<number> = new Array<number>(12, 11);
      expect(srcArr.reduce(callbackfn, 1)).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0022
     * @tc.name ESArrayPrototypeTest20022
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20022';
      console.info(`${caseName}, test start`);
      let accessed = false;

      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        accessed = true;
        return curVal;
      }
      let arr: Array<number> = new Array<number>(11, 9);

      expect(arr.reduce(callbackfn, 1)).assertEqual(9);
      expect(accessed).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0023
     * @tc.name ESArrayPrototypeTest20023
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20023';
      console.info(`${caseName}, test start`);
      let accessed = false;

      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        accessed = true;
        return 1;
      }
      let arr: Array<number> = new Array<number>();

      expect(arr.reduce(callbackfn, 3)).assertEqual(3);
      expect(accessed).assertEqual(false);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0024
     * @tc.name ESArrayPrototypeTest20024
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20024';
      console.info(`${caseName}, test start`);
      let cb = (): number => {
        return 0;
      }
      let arr: Array<number> = new Array<number>();
      expect(arr.reduce(cb, 1)).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0025
     * @tc.name ESArrayPrototypeTest20025
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20025';
      console.info(`${caseName}, test start`);
      let str = "initialValue is present";
      let callbackfn = (): string => {
        return '';
      }
      let arr: Array<number> = new Array<number>();
      expect(arr.reduce(callbackfn, str)).assertEqual(str);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0026
     * @tc.name ESArrayPrototypeTest20026
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20026';
      console.info(`${caseName}, test start`);
      let str = "initialValue is not present";
      let callbackfn = (): string => {
        return '';
      }
      let arr: Array<string> = new Array<string>(str);
      expect(arr.reduce(callbackfn)).assertEqual(str);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0027
     * @tc.name ESArrayPrototypeTest20027
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20027';
      console.info(`${caseName}, test start`);
      let testResult = false;

      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        if (idx === 1) {
          testResult = (prevVal === 0);
        }
        return 1;
      }
      let arr: Array<number> = new Array<number>(0, 1, 2);
      arr.reduce(callbackfn);

      expect(testResult).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0028
     * @tc.name ESArrayPrototypeTest20028
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20028';
      console.info(`${caseName}, test start`);
      let arr: Array<number> = new Array<number>(1, 2, 33, 4, 5);
      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        arr[2] = 3;
        return prevVal + curVal;
      }
      expect(arr.reduce(callbackfn)).assertEqual(15);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0029
     * @tc.name ESArrayPrototypeTest20029
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20029';
      console.info(`${caseName}, test start`);
      let arr: Array<number> = new Array<number>(1, 2, 3, 4, 5);
      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        arr[3] = -2;
        arr[4] = -1;
        return prevVal + curVal;
      }
      expect(arr.reduce(callbackfn)).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0030
     * @tc.name ESArrayPrototypeTest20030
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20030';
      console.info(`${caseName}, test start`);
      let arr: Array<number> = new Array<number>(1, 2, 3, 4, 5);
      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        arr.splice(3, 1);
        arr.splice(4, 1);
        return prevVal + curVal;
      }
      expect(arr.reduce(callbackfn)).assertEqual(6);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0031
     * @tc.name ESArrayPrototypeTest20031
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20031';
      console.info(`${caseName}, test start`);
      let arr: Array<number> = new Array<number>(1, 2, 3, 4, 5);
      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        arr.length = 2;
        return prevVal + curVal;
      }
      expect(arr.reduce(callbackfn)).assertEqual(3);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0032
     * @tc.name ESArrayPrototypeTest20032
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20032';
      console.info(`${caseName}, test start`);
      let callCnt = 0;

      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        callCnt++;
        return 2;
      }
      let arr: Array<number> = new Array<number>();
      arr.push(1);

      expect(arr.reduce(callbackfn)).assertEqual(1);
      expect(callCnt).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0033
     * @tc.name ESArrayPrototypeTest20033
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20033';
      console.info(`${caseName}, test start`);
      let arr: Array<number> = new Array<number>(1, 2, 33, 4, 5);
      let callbackfn = (prevVal: string, curVal: number, idx: int, obj: Array<number>): string => {
        arr[2] = 3;
        return prevVal + curVal;
      }
      expect(arr.reduce(callbackfn, "")).assertEqual("12345");
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0034
     * @tc.name ESArrayPrototypeTest20034
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20034';
      console.info(`${caseName}, test start`);
      let arr: Array<number> = new Array<number>();
      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        return 0;
      }
      expect(arr.reduce(callbackfn, 5)).assertEqual(5);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0035
     * @tc.name ESArrayPrototypeTest20035
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20035';
      console.info(`${caseName}, test start`);
      let threw = false;
      let callCnt = 0;
      let callbackfn = (prevVal: undefined, curVal: undefined, idx: int, obj: Array<undefined>): undefined => {
        callCnt++;
        return curVal;
      }
      let arr: Array<undefined> = new Array<undefined>(10);
      arr[0] = undefined;
      arr[1] = undefined;
      arr.reduce(callbackfn);
      expect(callCnt).assertEqual(9);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0036
     * @tc.name ESArrayPrototypeTest20036
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20036';
      console.info(`${caseName}, test start`);
      let testResult = false;
      let initialValue = 0;

      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        if (idx === 1) {
          testResult = (curVal === 1);
        }
        return 0;
      }

      let arr: Array<number> = new Array<number>(0, 1);
      arr.reduce(callbackfn, initialValue);

      expect(testResult).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0037
     * @tc.name ESArrayPrototypeTest20037
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20037';
      console.info(`${caseName}, test start`);
      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        if (idx > 0 && obj[idx] === curVal && obj[idx - 1] === prevVal) {
          return curVal;
        } else {
          return 11;
        }
      }
      let arr: Array<number> = new Array<number>(0, 1);

      expect(arr.reduce(callbackfn)).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0038
     * @tc.name ESArrayPrototypeTest20038
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20038';
      console.info(`${caseName}, test start`);
      let bParCorrect = false;
      let initialValue = 5.5;
      let callbackfn = (prevVal: number | boolean | null | object | string, curVal: number | boolean | null | object | string,
        idx: int, obj: Array<number | boolean | null | object | string>): number | boolean | null | object | string => {
        if (idx === 0 && obj[idx] === curVal && prevVal === initialValue)
          return curVal;
        else if (idx > 0 && obj[idx] === curVal && obj[idx - 1] === prevVal)
          return curVal;
        else
          return false;
      }
      let arr = new Array<number | boolean | null | object | string>(0, 1, true, null, new Object(), "five");

      expect( arr.reduce(callbackfn, initialValue)).assertEqual("five");
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0039
     * @tc.name ESArrayPrototypeTest20039
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20039';
      console.info(`${caseName}, test start`);
      let bCalled = false;

      let callbackfn = (prevVal: boolean, curVal: number, idx: int, obj: Array<number>): boolean => {
        bCalled = true;
        if (prevVal === true)
          return true;
        else
          return false;
      }

      let arr: Array<number> = new Array<number>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);

      expect(arr.reduce(callbackfn, true)).assertEqual(true);
      expect(bCalled).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0040
     * @tc.name ESArrayPrototypeTest20040
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20040';
      console.info(`${caseName}, test start`);
      let innerThisCorrect = false;

      let callbackfn = (prevVal: boolean, curVal: number, idx: int, obj: Array<number>): boolean => {
        innerThisCorrect = true;
        return true;
      }

      let arr: Array<number> = new Array<number>();
      arr.push(0);

      arr.reduce(callbackfn, true);

      expect(innerThisCorrect).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0041
     * @tc.name ESArrayPrototypeTest20041
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20041';
      console.info(`${caseName}, test start`);
      let arr: Array<number> = new Array<number>(0, 1, 2);
      let lastIdx = 0;
      let result = true;
      let accessed = false;

      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        accessed = true;
        if (lastIdx !== idx) {
          result = false;
        } else {
          lastIdx++;
        }
        return 0;
      }

      arr.reduce(callbackfn, 11);

      expect(result).assertEqual(true);
      expect(accessed).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0042
     * @tc.name ESArrayPrototypeTest20042
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20042';
      console.info(`${caseName}, test start`);
      let arr: Array<number> = new Array<number>(11, 12, 13, 14);
      let called = 0;

      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        if (curVal > 12) {
          obj[idx] = prevVal;
        } else {
          called++;
        }
        return prevVal;
      }

      arr.reduce(callbackfn, 2);

      expect(called).assertEqual(2);
      expect(arr[0]).assertEqual(11);
      expect(arr[1]).assertEqual(12);
      expect(arr[2]).assertEqual(2);
      expect(arr[3]).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0043
     * @tc.name ESArrayPrototypeTest20043
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20043';
      console.info(`${caseName}, test start`);
      let called = 0;

      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        called++;
        return curVal;
      }

      let arr: Array<number> = new Array<number>(11, 12);
      arr.reduce(callbackfn, 1);

      expect(called).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0044
     * @tc.name ESArrayPrototypeTest20044
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20044';
      console.info(`${caseName}, test start`);
      let result = false;

      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        result = (prevVal === 1);
        return curVal;
      }

      let arr: Array<number> = new Array<number>();
      arr.push(11);
      arr.reduce(callbackfn, 1);

      expect(result).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0045
     * @tc.name ESArrayPrototypeTest20045
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20045';
      console.info(`${caseName}, test start`);
      let result = false;

      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        result = (curVal > 10 && 1 === prevVal);
        return curVal;
      }

      let arr: Array<number> = new Array<number>();
      arr.push(11);
      arr.reduce(callbackfn, 1);

      expect(result).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0046
     * @tc.name ESArrayPrototypeTest20046
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20046';
      console.info(`${caseName}, test start`);
      let result = false;

      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        result = (prevVal === 1);
        return curVal;
      }

      let arr: Array<number> = new Array<number>();
      arr.push(11);
      arr.reduce(callbackfn, 1);

      expect(result).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0047
     * @tc.name ESArrayPrototypeTest20047
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20047';
      console.info(`${caseName}, test start`);
      let result = false;

      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        result = (prevVal === 1 && obj[idx] === curVal);
        return curVal;
      }

      let arr: Array<number> = new Array<number>();
      arr.push(11);
      arr.reduce(callbackfn, 1);

      expect(result).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0048
     * @tc.name ESArrayPrototypeTest20048
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20048';
      console.info(`${caseName}, test start`);
      let result = true;
      let accessed = false;
      let preIteration = 1.0;

      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        accessed = true;
        if (preIteration !== prevVal) {
          result = false;
        }
        preIteration = curVal;
        return curVal;
      }

      let arr: Array<number> = new Array<number>(11, 12, 13);
      arr.reduce(callbackfn, 1);

      expect(result).assertEqual(true);
      expect(accessed).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0049
     * @tc.name ESArrayPrototypeTest20049
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20049';
      console.info(`${caseName}, test start`);
      let called = 0;
      let result = false;

      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        called++;
        if (idx === 1) {
          result = (prevVal === 11) && curVal === 9;
        }
        return curVal;
      }

      let arr: Array<number> = new Array<number>(11, 9);
      arr.reduce(callbackfn);

      expect(result).assertEqual(true);
      expect(called).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0050
     * @tc.name ESArrayPrototypeTest20050
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20050';
      console.info(`${caseName}, test start`);
      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        return 1;
      }

      let srcArr: Array<number> = new Array<number>(1, 2, 3, 4, 5);
      srcArr.reduce(callbackfn);

      expect(srcArr[0]).assertEqual(1);
      expect(srcArr[1]).assertEqual(2);
      expect(srcArr[2]).assertEqual(3);
      expect(srcArr[3]).assertEqual(4);
      expect(srcArr[4]).assertEqual(5);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0051
     * @tc.name ESArrayPrototypeTest20051
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20051';
      console.info(`${caseName}, test start`);
      let callbackfn = (prevVal: string, curVal: string, idx: int, obj: Array<string>): string => {
        return prevVal + curVal;
      }

      let srcArr: Array<string> = new Array<string>('1', '2', '3', '4', '5');

      expect(srcArr.reduce(callbackfn, '0')).assertEqual('012345');
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0052
     * @tc.name ESArrayPrototypeTest20052
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20052';
      console.info(`${caseName}, test start`);
      let callCnt = 0;

      let callbackfn = (prevVal: string, curVal: string, idx: int, obj: Array<string>): string => {
        callCnt++;
        return curVal;
      }

      let srcArr: Array<string> = new Array<string>('1', '2', '3', '4', '5');

      srcArr.reduce(callbackfn);

      expect(callCnt).assertEqual(4);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0053
     * @tc.name ESArrayPrototypeTest20053
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20053';
      console.info(`${caseName}, test start`);
      let accessed = false;

      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        accessed = true;
        return 2;
      }

      let arr: Array<number> = new Array<number>(12, 11);

      expect(arr.reduceRight(callbackfn, 11)).assertEqual(2);
      expect(accessed).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0054
     * @tc.name ESArrayPrototypeTest20054
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20054';
      console.info(`${caseName}, test start`);
      let initialValue = 0;

      let callbackfn = (accum: number, val: number, idx: int, obj: Array<number>): number => {
        accum += val;
        return accum;
      }

      let arr: Array<number> = new Array<number>(11, 9);

      expect(arr.reduceRight(callbackfn, initialValue)).assertEqual(20);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0055
     * @tc.name ESArrayPrototypeTest20055
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20055';
      console.info(`${caseName}, test start`);
      let initialValue = 10;
      let arr: Array<number> = new Array<number>();
      let callbackfn = (): number => {
        return 0;
      }

      expect(arr.reduceRight(callbackfn, initialValue)).assertEqual(initialValue);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0056
     * @tc.name ESArrayPrototypeTest20056
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20056';
      console.info(`${caseName}, test start`);
      let cb = (): number => {
        return 0;
      }
      let arr: Array<number> = new Array<number>();
      expect(arr.reduceRight(cb, 1)).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0057
     * @tc.name ESArrayPrototypeTest20057
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20057';
      console.info(`${caseName}, test start`);
      let str = "initialValue is present";
      let callbackfn = (): string => {
        return '';
      }
      let arr: Array<string> = new Array<string>();
      expect(arr.reduceRight(callbackfn, str)).assertEqual(str);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0058
     * @tc.name ESArrayPrototypeTest20058
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20058';
      console.info(`${caseName}, test start`);
      let str = "initialValue is not present";
      let callbackfn = (): string => {
        return '';
      }
      let arr: Array<string> = new Array<string>(str);
      expect(arr.reduceRight(callbackfn)).assertEqual(str);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0059
     * @tc.name ESArrayPrototypeTest20059
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20059';
      console.info(`${caseName}, test start`);
      let testResult = false;
      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        if (idx === 1) {
          testResult = (prevVal === 2);
        }
        return 0;
      }
      let arr: Array<number> = new Array<number>(0, 1, 2);
      arr.reduceRight(callbackfn);

      expect(testResult).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0060
     * @tc.name ESArrayPrototypeTest20060
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20060';
      console.info(`${caseName}, test start`);
      let arr: Array<number> = new Array<number>(1, 2, 3, 4, 5);
      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        arr[3] = -2;
        arr[0] = -1;
        return prevVal + curVal;
      }

      expect(arr.reduceRight(callbackfn)).assertEqual(13);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0061
     * @tc.name ESArrayPrototypeTest20061
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20061';
      console.info(`${caseName}, test start`);
      let arr: Array<number | string> = new Array<number | string>('1', 2, 3, 4, 5);
      let callbackfn = (
        prevVal: number | string,
        curVal: number | string,
        idx: int,
        obj: Array<number | string>
      ): string => {
        arr.splice(1, 1);
        arr.splice(4, 1);
        return String(prevVal) + curVal;
      }
      expect(arr.reduceRight(callbackfn)).assertEqual("54441");
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0062
     * @tc.name ESArrayPrototypeTest20062
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20062';
      console.info(`${caseName}, test start`);
      let arr: Array<number> = new Array<number>();
      let callCnt = 0;
      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        callCnt++;
        return 2;
      }
      arr.push(1);

      expect(arr.reduceRight(callbackfn)).assertEqual(1);
      expect(callCnt).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0063
     * @tc.name ESArrayPrototypeTest20063
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20063';
      console.info(`${caseName}, test start`);
      let arr: Array<number> = new Array<number>(10);
      let callbackfn = (prevVal: number, curVal: number|undefined, idx: int, obj: Array<number>): number => { return 0 }

      expect(arr.reduceRight(callbackfn, 5)).assertEqual(0)
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0064
     * @tc.name ESArrayPrototypeTest20064
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20064';
      console.info(`${caseName}, test start`);
      let callCnt = 0;
      let callbackfn = (prevVal: undefined, curVal: undefined, idx: int, obj: Array<undefined>): undefined
      => { callCnt++; return curVal };
      let arr: Array<undefined> = new Array<undefined>(10);
      arr[0] = undefined;
      arr[1] = undefined;
      arr.reduceRight(callbackfn);
      expect(callCnt).assertEqual(9);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0065
     * @tc.name ESArrayPrototypeTest20065
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20065';
      console.info(`${caseName}, test start`);
      let testResult = false;

      let callbackfn = (prevVal: number, curVal: number, idx: int, obj: Array<number>): number => {
        if (idx === 1) testResult = (curVal === 1);
        return 0
      }

      let arr: Array<number> = new Array<number>(0, 1, 2);
      arr.reduceRight(callbackfn, 0);

      expect(testResult).assertEqual(true)
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0066
     * @tc.name ESArrayPrototypeTest20066
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20066';
      console.info(`${caseName}, test start`);
      let callbackfn = (prevVal: number | boolean | null | object | string, curVal: number | boolean | null | object | string, idx: int, obj: Array<number | boolean | null | object | string>): number | object => {
        if (idx + 1 < obj.length && obj[idx] === curVal && obj[idx + 1] === prevVal) {
          if (curVal == null || typeof curVal === "object") {
            return 0;
          }
          return curVal!;
        } else {
          return 1;
        }
      }

      let arr: Array<number | boolean | null | object | string> =
        new Array<number | boolean | null | object | string>(0, 1, true, null, new Object(), "five");

      expect(arr.reduceRight(callbackfn)).assertEqual(0)
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0067
     * @tc.name ESArrayPrototypeTest20067
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20067';
      console.info(`${caseName}, test start`);
      let bParCorrect = false;
      let arr = new Array<number | boolean | null | object | string>(0, 1, true, null, new Object(), "five");
      let initialValue = 5.5;
      let callbackfn =
        (prevVal: number | boolean | null | object | string, curVal: number | boolean | null | object | string,
          idx: int, obj: Array<number | boolean | null | object | string>): number | boolean | null | object | string => {
          if (idx === obj.length - 1 && obj[idx] === curVal && prevVal === initialValue) {
            return curVal;
          } else if (idx + 1 < obj.length && obj[idx] === curVal && obj[idx + 1] === prevVal) {
            return curVal;
          } else {
            return false;
          }
        }
      expect(arr.reduceRight(callbackfn, initialValue)).assertEqual(0);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0068
     * @tc.name ESArrayPrototypeTest20068
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20068';
      console.info(`${caseName}, test start`);
      let bCalled = false;

      let callbackfn = (prevVal: boolean, curVal: number, idx: int, obj: Array<number>): boolean => {
        bCalled = true;
        if (Boolean(prevVal) === true)
          return true;
        else
          return false;
      }

      let arr: Array<number> = new Array<number>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);

      expect(arr.reduceRight(callbackfn, true)).assertEqual(true);
      expect(bCalled).assertEqual(true);

      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE2_0069
     * @tc.name ESArrayPrototypeTest20069
     * @tc.desc Test ES Builtins-Api in Array.Prototype
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('ESArrayPrototypeTest20069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      const caseName = 'ESArrayPrototypeTest20069';
      console.info(`${caseName}, test start`);
      let innerThisCorrect = false;

      let callbackfn = (prevVal: boolean, curVal: number, idx: int, obj: Array<number>): boolean => {
        innerThisCorrect = true;
        return true;
      }

      let arr: Array<number> = new Array<number>();
      arr.push(0);
      arr.reduceRight(callbackfn, true);

      expect(innerThisCorrect).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

  })
}