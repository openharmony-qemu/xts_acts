import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import accessibility from '@ohos.accessibility'
let domain: int = 0x0000;
let tag: string = 'testTag';

export default function abilityTest() {
  describe("AccessibleRegisterStateStatic", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.name   SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0200
     * @tc.number SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0200
     * @tc.desc   onTouchGuideStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0200', TestType.FUNCTION | Size.MEDIUMTEST| Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0200');
      let callbackdata = (data:boolean) => {
        expect(data).assertEqual(false);
      }
      try {
        accessibility.onTouchGuideStateChange(callbackdata);
        accessibility.offTouchGuideStateChange(callbackdata);
        done();
      } catch (error) {
        hilog.info(domain, tag, 'SUB_BASIC_BARRIERFREE_API_AccessibleRegisterState_static_0200 failed');
        expect(null).assertFail();
        done();
      }
    })
  })
}