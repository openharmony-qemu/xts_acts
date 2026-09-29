'use static';
/**
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
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import { UtilsTest } from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';

export default function subHeaderEndIcon() {
  describe('subHeaderEndIcon', () => {

    beforeAll(async (): Promise<void> => {
      console.info("subHeaderEndIcon beforeAll start");
      await UtilsTest.startAbility("com.acts.arkui.subHeader.nowear.test.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("subHeaderEndIcon beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/subHeader/subHeaderEndIcon',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get subHeaderEndIcon state pages:" + JSON.stringify(pages));
        if (!("subHeaderEndIcon" == pages.name)) {
          console.info("get subHeaderEndIcon pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push subHeaderEndIcon page error:" + err);
      }
      console.info("subHeaderEndIcon beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info('subHeaderEndIcon after each called');
    })

    /**
     * @tc.number   SUB_ARKUI_SUBHEADER_ENDICON_0100
     * @tc.name     subHeaderEndIcon_static_0100
     * @tc.desc     Test SubHeader icon + secondaryTitle + endIcon(image) — scenario 1
     * @tc.level     LEVEL0
     */
    it('subHeaderEndIcon_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[subHeaderEndIcon_static_0100] START');
      let strJson = inspector.getInspectorByKey('subheader_endicon_image');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[subHeaderEndIcon_static_0100] obj is: ' + strJson);
      expect(strJson !== '').assertTrue();
      let endIconValue = obj.getElement('$attrs').getString('endIcon');
      console.info('[subHeaderEndIcon_static_0100] endIcon: ' + endIconValue);
      expect(endIconValue !== '' && endIconValue !== 'undefined' && endIconValue !== 'null').assertTrue();
      console.info('[subHeaderEndIcon_static_0100] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_SUBHEADER_ENDICON_0200
     * @tc.name     subHeaderEndIcon_static_0200
     * @tc.desc     Test SubHeader secondaryTitle + endIcon(Symbol) + endIconSymbolOptions — scenario 4
     * @tc.level     LEVEL0
     */
    it('subHeaderEndIcon_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[subHeaderEndIcon_static_0200] START');
      let strJson = inspector.getInspectorByKey('subheader_endicon_symbol');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[subHeaderEndIcon_static_0200] obj is: ' + strJson);
      expect(strJson !== '').assertTrue();
      let endIconValue = obj.getElement('$attrs').getString('endIcon');
      console.info('[subHeaderEndIcon_static_0200] endIcon: ' + endIconValue);
      expect(endIconValue !== '' && endIconValue !== 'undefined' && endIconValue !== 'null').assertTrue();
      console.info('[subHeaderEndIcon_static_0200] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_SUBHEADER_ENDICON_0300
     * @tc.name     subHeaderEndIcon_static_0300
     * @tc.desc     Test SubHeader primaryTitle + endIcon(image) — scenario 2
     * @tc.level     LEVEL0
     */
    it('subHeaderEndIcon_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[subHeaderEndIcon_static_0300] START');
      let strJson = inspector.getInspectorByKey('subheader_endicon_primary');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[subHeaderEndIcon_static_0300] obj is: ' + strJson);
      expect(strJson !== '').assertTrue();
      let endIconValue = obj.getElement('$attrs').getString('endIcon');
      console.info('[subHeaderEndIcon_static_0300] endIcon: ' + endIconValue);
      expect(endIconValue !== '' && endIconValue !== 'undefined' && endIconValue !== 'null').assertTrue();
      console.info('[subHeaderEndIcon_static_0300] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_SUBHEADER_ENDICON_0400
     * @tc.name     subHeaderEndIcon_static_0400
     * @tc.desc     Test SubHeader primaryTitle + secondaryTitle + endIcon(image) — scenario 3
     * @tc.level     LEVEL0
     */
    it('subHeaderEndIcon_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[subHeaderEndIcon_static_0400] START');
      let strJson = inspector.getInspectorByKey('subheader_endicon_primary_secondary');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[subHeaderEndIcon_static_0400] obj is: ' + strJson);
      expect(strJson !== '').assertTrue();
      let endIconValue = obj.getElement('$attrs').getString('endIcon');
      console.info('[subHeaderEndIcon_static_0400] endIcon: ' + endIconValue);
      expect(endIconValue !== '' && endIconValue !== 'undefined' && endIconValue !== 'null').assertTrue();
      console.info('[subHeaderEndIcon_static_0400] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_SUBHEADER_ENDICON_0500
     * @tc.name     subHeaderEndIcon_static_0500
     * @tc.desc     Test SubHeader endIcon + operationItem coexist — scenario 7
     * @tc.level     LEVEL0
     */
    it('subHeaderEndIcon_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[subHeaderEndIcon_static_0500] START');
      let strJson = inspector.getInspectorByKey('subheader_endicon_operation');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[subHeaderEndIcon_static_0500] obj is: ' + strJson);
      expect(strJson !== '').assertTrue();
      let endIconValue = obj.getElement('$attrs').getString('endIcon');
      console.info('[subHeaderEndIcon_static_0500] endIcon: ' + endIconValue);
      expect(endIconValue !== '' && endIconValue !== 'undefined' && endIconValue !== 'null').assertTrue();
      console.info('[subHeaderEndIcon_static_0500] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_SUBHEADER_ENDICON_0600
     * @tc.name     subHeaderEndIcon_static_0600
     * @tc.desc     Test SubHeader without endIcon — scenario 8, verify endIcon is undefined
     * @tc.level     LEVEL0
     */
    it('subHeaderEndIcon_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[subHeaderEndIcon_static_0600] START');
      let strJson = inspector.getInspectorByKey('subheader_endicon_none');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[subHeaderEndIcon_static_0600] obj is: ' + strJson);
      expect(strJson !== '').assertTrue();
      let endIconValue = obj.getElement('$attrs').getString('endIcon');
      console.info('[subHeaderEndIcon_static_0600] endIcon: ' + endIconValue);
      expect(endIconValue === '' || endIconValue === 'undefined' || endIconValue === 'null').assertTrue();
      console.info('[subHeaderEndIcon_static_0600] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_SUBHEADER_ENDICON_0700
     * @tc.name     subHeaderEndIcon_static_0700
     * @tc.desc     Test SubHeader titleBuilder mode, endIcon not effective — scenario 9
     * @tc.level     LEVEL0
     */
    it('subHeaderEndIcon_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[subHeaderEndIcon_static_0700] START');
      let strJson = inspector.getInspectorByKey('subheader_endicon_titlebuilder');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[subHeaderEndIcon_static_0700] obj is: ' + strJson);
      expect(strJson !== '').assertTrue();
      let endIconValue = obj.getElement('$attrs').getString('endIcon');
      console.info('[subHeaderEndIcon_static_0700] endIcon: ' + endIconValue);
      expect(endIconValue === '' || endIconValue === 'undefined' || endIconValue === 'null').assertTrue();
      console.info('[subHeaderEndIcon_static_0700] END');
      done();
    });
  })
}
