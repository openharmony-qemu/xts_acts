import { describe, expect, it, Level, Size, TestType } from "../../../hypium/index";
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
} from "../../../hypium/index";
import Utils from './Util.test';
export default function promiseTest() {

  describe('PromiseTest', (): void => {
    afterEach(() => {
      await Utils.msSleep(20);
    })
    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PROMISE_00100
     * @tc.name       : testPromise0001
     * @tc.desc       : Test the function by promise
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPromise0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let flag = true;
        let array: Array<string> = await dealPromise(flag);
        expect(array[0]).assertEqual('resolve result : success');
        expect(array[1]).assertEqual('resolve');
        done();
      })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PROMISE_00200
     * @tc.name       : testPromise0002
     * @tc.desc       : Test the function by promise
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPromise0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let flag = false;
        let array: Array<string> = await dealPromise(flag);
        expect(array[0]).assertEqual('reject result : success');
        expect(array[1]).assertEqual('reject');
        expect(array[2]).assertEqual('reject');
        done();
      })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PROMISE_00300
     * @tc.name       : testPromise0003
     * @tc.desc       : Test the function by promise
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPromise0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let flag = false;
        let array: Array<string> = new Array<string>();
        try {
          const result = await new Promise<string>((resolve, reject): void => {
            if (flag) {
              resolve("success");
              array.push("resolve result : success")
            } else {
              reject(new Error("reject"))
              array.push("reject result : success")
            }
          });
          array.push(result);
        } catch (error) {
          array.push("reject");
        }
        expect(array[0]).assertEqual('reject result : success');
        expect(array[1]).assertEqual('reject')
        done();
      })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PROMISE_00400
     * @tc.name       : testPromise0004
     * @tc.desc       : Test the function by promise
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPromise0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let flag = true;
        let array: Array<string> = new Array<string>();
        try {
          const result = await new Promise<string>((resolve, reject) => {
            if (flag) {
              resolve("resolve");
              array.push("resolve result : success");
            } else {
              reject(new Error("reject"));
              array.push("reject result : success");
            }
          });
          array.push(result);
        } catch (error) {
          array.push("reject");
        }
        expect(array[0]).assertEqual('resolve result : success');
        expect(array[1]).assertEqual('resolve')
        done();
      })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PROMISE_00500
     * @tc.name       : testPromise0005
     * @tc.desc       : Test the function by promise
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPromise0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let flag = true;
        let array: Array<string> = new Array<string>();
        try {
          const result = await new Promise<string>((resolve, reject) => {
            if (flag) {
              resolve("resolve");
              array.push("resolve result : success");
            } else {
              reject(new Error("reject"));
              array.push("reject result : success");
            }
          });
          array.push(result);
          array.push('then2');
          array.push('then3');
          array.push('then4');
          array.push('then5');
          array.push('then6');
          array.push('then7');
        } catch (error) {
          array.push("reject");
        } finally {
          array.push('finally1');
        }
        expect(array[0]).assertEqual('resolve result : success');
        expect(array[1]).assertEqual('resolve')
        expect(array[2]).assertEqual('then2');
        expect(array[3]).assertEqual('then3');
        expect(array[4]).assertEqual('then4');
        expect(array[5]).assertEqual('then5');
        expect(array[6]).assertEqual('then6');
        expect(array[7]).assertEqual('then7');
        expect(array[8]).assertEqual('finally1');
        done();
      })

    // /**
    //  * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PROMISE_00600
    //  * @tc.name       : testPromise0006
    //  * @tc.desc       : Test the function by promise
    //  * @tc.size       : MediumTest
    //  * @tc.type       : Function
    //  * @tc.level      : Level 1
    //  */
    // it('testPromise0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   let flag = false;
    //   let array: Array<string> = new Array<string>();
    //   try {
    //     const result = await new Promise<string>((resolve, reject) => {
    //       if (flag) {
    //         resolve("resolve");
    //         array.push("resolve result : success");
    //       } else {
    //         reject("reject");
    //         array.push("reject result : success");
    //       }
    //     });
    //     array.push(result);
    //     array.push('then2');
    //     array.push('then3');
    //     array.push('then4');
    //     array.push('then5');
    //     array.push('then6');
    //     array.push('then7');
    //   } catch {
    //     array.push("reject");
    //   } finally {
    //     array.push('finally1');
    //   };
    //   expect(array[0]).assertEqual('reject result : success');
    //   expect(array[1]).assertEqual('reject')
    //   expect(array[2]).assertEqual('finally1');
    //   done();
    // })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PROMISE_00700
     * @tc.name       : testPromise0007
     * @tc.desc       : Test the function by promise
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPromise0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let flag = true;
        let array: Array<string> = new Array<string>();
        try {
          const result = await new Promise<string>((resolve, reject) => {
            if (flag) {
              resolve("resolve");
              array.push("resolve result : success");
            } else {
              reject(new Error("reject"));
              array.push("reject result : success");
            }
          });
          array.push(result);
          array.push('then2');
          await new Promise<string>((resolve, reject) => {
            array.push('then3');
            reject(new Error());
          });
          array.push('then4');
          array.push('then5');
          array.push('then6');
          array.push('then7');
        } catch (e) {
          array.push("reject");
        } finally {
          array.push('finally1');
        }
        ;
        expect(array[0]).assertEqual('resolve result : success');
        expect(array[1]).assertEqual('resolve')
        expect(array[2]).assertEqual('then2');
        expect(array[3]).assertEqual('then3');
        expect(array[4]).assertEqual('reject');
        expect(array[5]).assertEqual('finally1');
        done();
      })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PROMISE_00800
     * @tc.name       : testPromise0008
     * @tc.desc       : Test the function by promise
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testPromise0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let flag = true;
        let array: Array<string> = new Array<string>();
        try {
          const result = await new Promise<string>((resolve, reject) => {
            if (flag) {
              resolve("resolve");
              array.push("resolve result : success");
            } else {
              reject(new Error("reject"));
              array.push("reject result : success");
            }
          });
          array.push(result);
          array.push('then2');
          array.push('then3');
          throw new Error('Error');
          array.push('then4');
          array.push('then5');
          array.push('then6');
          array.push('then7');
        } catch (e) {
          if (e instanceof Error) {
            array.push(e.message);
          }
        } finally {
          array.push('finally1');
        }
        ;
        expect(array[0]).assertEqual('resolve result : success');
        expect(array[1]).assertEqual('resolve')
        expect(array[2]).assertEqual('then2');
        expect(array[3]).assertEqual('then3');
        expect(array[4]).assertEqual('Error');
        expect(array[5]).assertEqual('finally1');
        done();
      })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PROMISE_00900
     * @tc.name       : testPromise0009
     * @tc.desc       : Test the function by promise
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it('testPromise0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   let flag = true;
    //   let array: Array<string> = new Array<string>();
    //   await new Promise<string>((resolve, reject): void => {
    //     if (flag) {
    //       resolve("resolve");
    //       array.push("resolve result : success")
    //     } else {
    //       reject(new Error("reject"))
    //       array.push("reject result : success")
    //     }
    //   }).then((res): void => {
    //     array.push(res);
    //   })
    //     .then((): void => {
    //       array.push('then2')
    //     })
    //     .then((): Promise<string> => {
    //       array.push('then3')
    //       return new Promise<string>((resolve, reject)=> {
    //         resolve('res');
    //         array.push('resolve11');
    //       }).then((): void => {
    //         array.push('then11')
    //       }).then((): void => {
    //         array.push('then12')
    //         throw Error('Error11')
    //       }).then((): void => {
    //         array.push('then13')
    //       }).then((): void => {
    //         array.push('then14')
    //       })
    //     })
    //     .then((): void => {
    //       array.push('then4')
    //     })
    //     .then((): void => {
    //       array.push('then5')
    //     })
    //     .then((): void => {
    //       array.push('then6')
    //     })
    //     .then((): void => {
    //       array.push('then7')
    //     })
    //     .catch((e: Error): void => {
    //       array.push(e.message);
    //     })
    //     .finally((): void => {
    //       array.push('finally1')
    //     });
    //   expect(array[0]).assertEqual('resolve result : success');
    //   expect(array[1]).assertEqual('resolve')
    //   expect(array[2]).assertEqual('then2');
    //   expect(array[3]).assertEqual('then3');
    //   expect(array[4]).assertEqual('resolve11');
    //   expect(array[5]).assertEqual('then11');
    //   expect(array[6]).assertEqual('then12');
    //   expect(array[7]).assertEqual('Error11');
    //   expect(array[8]).assertEqual('finally1');
    //   done();
    // })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PROMISE_01000
     * @tc.name       : testPromise0010
     * @tc.desc       : Test the function by promise
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it('testPromise0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   let flag = true;
    //   let array: Array<string> = new Array<string>();
    //   await new Promise<string>((resolve, reject) => {
    //     if (flag) {
    //       resolve("resolve");
    //       array.push("resolve result : success")
    //     } else {
    //       reject(new Error("reject"))
    //       array.push("reject result : success")
    //     }
    //   }).then((res): void => {
    //     array.push(res);
    //   })
    //     .then((): void => {
    //       array.push('then2')
    //       throw Error('Error1')
    //     })
    //     .then(() => {
    //       array.push('then3')
    //       return new Promise<string>((resolve, reject) => {
    //         resolve('res');
    //         array.push('resolve11');
    //       }).then((): void => {
    //         array.push('then11')
    //       }).then((): void => {
    //         array.push('then12')
    //         throw Error('Error11')
    //       }).then((): void => {
    //         array.push('then13')
    //       }).then((): void => {
    //         array.push('then14')
    //       })
    //     })
    //     .then((): void => {
    //       array.push('then4')
    //     })
    //     .then((): void => {
    //       array.push('then5')
    //     })
    //     .then((): void => {
    //       array.push('then6')
    //     })
    //     .then((): void => {
    //       array.push('then7')
    //     })
    //     .catch((e: Error): void => {
    //       array.push(e.message);
    //     })
    //     .finally((): void => {
    //       array.push('finally1')
    //     });
    //   expect(array[0]).assertEqual('resolve result : success');
    //   expect(array[1]).assertEqual('resolve')
    //   expect(array[2]).assertEqual('then2');
    //   expect(array[3]).assertEqual('Error1');
    //   expect(array[4]).assertEqual('finally1');
    //   done();
    // })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PROMISE_01100
     * @tc.name       : testPromise0011
     * @tc.desc       : Test the function by promise
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it('testPromise0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   let flag = true;
    //   let array: Array<string> = new Array<string>();
    //   await new Promise<string>((resolve, reject) => {
    //     if (flag) {
    //       resolve("resolve");
    //       array.push("resolve result : success")
    //     } else {
    //       reject(new Error("reject"))
    //       array.push("reject result : success")
    //     }
    //   }).then((res: string):void => {
    //     array.push(res);
    //   })
    //     .then(():void => {
    //       array.push('then2')
    //     }).then(():void => {
    //       array.push('then3')
    //       new Promise<string>((resolve, reject) => {
    //         resolve('res');
    //         array.push('resolve31-1');
    //       }).then(():void => {
    //         array.push('then31-2')
    //       }).then(():void => {
    //         array.push('then31-3')
    //       }).then(():void => {
    //         array.push('then31-4')
    //       }).then(():void => {
    //         array.push('then31-5')
    //       })
    //       new Promise<string>((resolve, reject) => {
    //         resolve('res');
    //         array.push('resolve32-1');
    //       }).then(():void => {
    //         array.push('then32-2')
    //       }).then(():void => {
    //         array.push('then32-3')
    //       }).then(():void => {
    //         array.push('then32-4')
    //       }).then(():void => {
    //         array.push('then32-5')
    //       })
    //     }).then(():void => {
    //       array.push('then4')
    //     }).then(():void => {
    //       array.push('then5')
    //     }).then(():void => {
    //       array.push('then6')
    //     }).then(():void => {
    //       array.push('then7')
    //     })
    //     .catch((e: Error):void => {
    //       array.push(e.message);
    //     })
    //     .finally(():void => {
    //       array.push('finally1')
    //     });
    //   expect(array[0]).assertEqual('resolve result : success');
    //   expect(array[1]).assertEqual('resolve')
    //   expect(array[2]).assertEqual('then2');
    //   expect(array[3]).assertEqual('then3');
    //   expect(array[4]).assertEqual('resolve31-1');
    //   expect(array[5]).assertEqual('resolve32-1');
    //   expect(array[6]).assertEqual('then31-2');
    //   expect(array[7]).assertEqual('then32-2');
    //   expect(array[8]).assertEqual('then4');
    //   expect(array[9]).assertEqual('then31-3');
    //   expect(array[10]).assertEqual('then32-3');
    //   expect(array[11]).assertEqual('then5');
    //   expect(array[12]).assertEqual('then31-4');
    //   expect(array[13]).assertEqual('then32-4');
    //   expect(array[14]).assertEqual('then6');
    //   expect(array[15]).assertEqual('then31-5');
    //   expect(array[16]).assertEqual('then32-5');
    //   expect(array[17]).assertEqual('then7');
    //   expect(array[18]).assertEqual('finally1');
    //   done();
    // })

    /**
     * @tc.number     : SUB_COMMONLIBRARY_UTIL_BASE_PROMISE_01200
     * @tc.name       : testPromise0012
     * @tc.desc       : Test the function by promise
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    // it('testPromise0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
    //   let flag = true;
    //   let array: Array<string> = new Array<string>();
    //   setTimeout((): void => {
    //     array.push("setTimeout1")
    //   })
    //   async1(array);
    //   new Promise<void>((resolve) => {
    //     array.push("promise1");
    //     resolve();
    //   }).then((): void => {
    //     array.push('then1');
    //   })
    //   await sleep(3000);
    //   expect(array[0]).assertEqual('async2');
    //   expect(array[1]).assertEqual('promise1')
    //   expect(array[2]).assertEqual('async1')
    //   expect(array[3]).assertEqual('then1')
    //   expect(array[4]).assertEqual('setTimeout1')
    //   done();
    // })
  })
}

async function async1(array: Array<string>) {
  await async2(array);
  array.push("async1")
}

async function async2(array: Array<string>) {
  array.push('async2')
}

async function dealPromise(flag: boolean): Promise<Array<string>> {
  let array: Array<string> = new Array<string>();
  const p: Promise<string> = new Promise<string>((resolve, reject) => {
    if (flag) {
      resolve("resolve");
      array.push("resolve result : success")
    } else {
      reject(new Error("reject"))
      array.push("reject result : success")
    }
  });
  p.then((res: string) => {
    array.push(res);
  })

  p.catch((e: Error): string => {
    array.push('reject');
    array.push(e.message);
  })
  return array;
}