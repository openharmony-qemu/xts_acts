import resourceManager from '@ohos.resourceManager';
import Ability from '@ohos.app.ability.UIAbility'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import { GlobalContext } from '../test/global';

export default function SixPointZeroResMgrStageTest() {
  describe("SixPointZeroResMgrStageTest", () => {
    console.log('*************start SixPointZeroResMgrStageTest*************');
    let resContext: Context;
    let res: resourceManager.ResourceManager;

    beforeAll(async () => {
      console.info("beforeAll case");
    });
    beforeEach(() => {
      console.info("beforeEach case");
      resContext = (GlobalContext.getContext().getObject('yq') as Context)
      res = resContext.resourceManager
    });
    afterEach(async () => {
      console.info("afterEach case");
    });
    afterAll(() => {
      console.info("afterAll case");
    });

    /**
     * @tc.name   resourceManager_test_getSysResourceManager_0100
     * @tc.number SUB_GLOBAL_ResourceManager_getSysResourceManager_0100
     * @tc.desc   getSysResourceManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('resourceManager_test_getSysResourceManager_0100', Level.LEVEL0, () => {
      let value = resourceManager.getSysResourceManager();
      console.log('resourceManager_test_getSysResourceManager_0100:' + value);
      expect(value != null).assertTrue();
    })

    /**
     * @tc.name dateTimeFormat_resolvedOptions_test_0100
     * @tc.number dateTimeFormat_resolvedOptions_test_0100
     * @tc.desc with resolvedOptions
     * @tc.type FUNCTION
     * @tc.size MEDIUM
     * @tc.level LEVEL3
     */
    it('dateTimeFormat_resolvedOptions_test_0100', Level.LEVEL3, () => {
      let date: Date = new Date(2020, 11, 20, 14, 23, 16);
      let option: intl.DateTimeOptions = {dateStyle: 'medium', timeStyle: 'medium'};
      let datefmt = new intl.DateTimeFormat('zh-CN', option);
      console.log('dateTimeFormat_resolvedOptions_test_0100 value:', datefmt.resolvedOptions().dateStyle);
      expect(datefmt.resolvedOptions().dateStyle).assertEqual('medium');
      expect(datefmt.format(date)).assertContain('2020年12月20日');
    })


  })
}