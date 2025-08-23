import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { Foo } from '../ets/Index'

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function EnvOperationsTest() {

  describe("ActsEnvOperationsTest", (): void => {
    try {
      loadLibrary("entry")
    } catch(e: Error) {
      console.log('loadFailed', e.message);
    }

    /*
     * @tc.number    : test_getEnv_0100
     * @tc.name      : test_getEnv_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("test_getEnv_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_getEnv_0100 start');
        let cls = new Foo();
        let result = cls.test_getEnv();
        expect(result).assertTrue();
        console.log('test_getEnv_0100 done');
        done();
        console.log('test_getEnv_0100 end');
      })
  })
}