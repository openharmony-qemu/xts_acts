import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { Foo } from '../ets/Index'

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function versionInfoTest() {

  describe("ActsVersionInfoTest", (): void => {
    try {
      loadLibrary("entry")
    } catch(e: Error) {
      console.log('loadFailed', e.message);
    }

    /*
     * @tc.number    : getVersionInfo_static_0100
     * @tc.name      : getVersionInfo_static_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("getVersionInfo_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('getVersionInfo_static_0100 start');
      let cls = new Foo();
      let result = cls.test_GetVersion();
      expect(result).assertEqual(1);
      console.log('getVersionInfo_static_0100 done');
      done();
      console.log('getVersionInfo_static_0100 end');
    })
  })
}