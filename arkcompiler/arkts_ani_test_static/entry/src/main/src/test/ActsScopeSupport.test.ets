import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { Foo } from '../ets/Index'

let domain: number = 0x0000;
let tag: string = 'testTag';

export default function ScopeSupportTest() {

  describe("ActsScopeSupportTest", (): void => {
    try {
      loadLibrary("entry")
    } catch(e: Error) {
      console.log('loadFailed', e.message);
    }

    /*
     * @tc.number    : test_create_local_scope_0100
     * @tc.name      : test_create_local_scope_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("test_create_local_scope_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_create_local_scope_0100 start');
        let cls = new Foo();
        let result = cls.test_create_local_scope();
        expect(result).assertTrue();
        console.log('test_create_local_scope_0100 done');
        done();
        console.log('test_create_local_scope_0100 end');
      })

    /*
     * @tc.number    : test_create_escape_local_scope_0100
     * @tc.name      : test_create_escape_local_scope_0100
     * @tc.desc      : MediumTest
     * @tc.size      : Function
     * @tc.type      : Function test
     * @tc.level     : Level 0
     */
    it("test_create_escape_local_scope_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_create_escape_local_scope_0100 start');
        let cls = new Foo();
        let result = cls.test_create_escape_local_scope();
        expect(result).assertTrue();
        console.log('test_create_escape_local_scope_0100 done');
        done();
        console.log('test_create_escape_local_scope_0100 end');
      })
  })
}