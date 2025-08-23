import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { Foo } from '../ets/Index'

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function exceptionsTest() {

  describe("ActsExceptionsTest", (): void => {
    try {
      loadLibrary("entry")
    } catch(e: Error) {
      console.log('loadFailed', e.message);
    }

    /*
     * @tc.number    : ResetError_0100
     * @tc.name      : ResetError_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("ResetError_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('ResetError_0100 start');
        let cls = new Foo();
        let result = cls.test_ResetError();
        expect(result).assertTrue();
        console.log('ResetError_0100 done');
        done();
        console.log('ResetError_0100 end');
      })
  })
}
