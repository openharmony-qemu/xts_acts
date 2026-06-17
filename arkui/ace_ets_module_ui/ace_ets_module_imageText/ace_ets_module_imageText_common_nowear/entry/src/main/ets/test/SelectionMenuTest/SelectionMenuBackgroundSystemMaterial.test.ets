import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';

export default function SelectionMenuBackgroundSystemMaterialTest() {
  describe('SelectionMenuBkgSysMatTest', () => {
    beforeEach(async (done: Function) => {
      console.info('SelectionMenuBkgSysMatTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SelectionMenu/SelectionMenuBackgroundSystemMaterial',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info('get SelectionMenuBkgSysMatTest state pages:' + JSON.stringify(pages));
        let result = await router.replaceUrl(options);
        await CommonFunc.sleep(2000);
        console.info('push SelectionMenuBkgSysMatTest page result:' + JSON.stringify(result));
        if (!('SelectionMenuBackgroundSystemMaterial' == pages.name)) {
          console.info('get SelectionMenuBkgSysMatTest pages.name:' + JSON.stringify(pages.name));
        }
      } catch (err) {
        console.error('push SelectionMenuBkgSysMatTest page error:' + err);
      }
      console.info('SelectionMenuBkgSysMatTest beforeEach end');
      done();
    });

    /**
     * @tc.name   selectionMenuBkgSysMat_0100
     * @tc.number SUB_ARUI_SELECTIONMENU_BGDSYSMAT_PARAM_0100
     * @tc.desc   Test SelectionMenu backgroundSystemMaterial with ImmersiveStyle ULTRA_THIN (boundary min value)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('selectionMenuBkgSysMat_0100', Level.LEVEL2, async (done: Function) => {
      console.info('selectionMenuBkgSysMat_0100 START');
      let strJson: string = getInspectorByKey('richEditor_bkgSysMat_ultraThin');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionMenuBkgSysMat_0100] obj is: ' + JSON.stringify(obj));
      expect(obj.$type).assertEqual('RichEditor');
      console.info('selectionMenuBkgSysMat_0100 END');
      done();
    });

    /**
     * @tc.name   selectionMenuBkgSysMat_0200
     * @tc.number SUB_ARUI_SELECTIONMENU_BGDSYSMAT_PARAM_0200
     * @tc.desc   Test SelectionMenu backgroundSystemMaterial with ImmersiveStyle ULTRA_THICK (boundary max value)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('selectionMenuBkgSysMat_0200', Level.LEVEL2, async (done: Function) => {
      console.info('selectionMenuBkgSysMat_0200 START');
      let strJson: string = getInspectorByKey('richEditor_bkgSysMat_ultraThick');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionMenuBkgSysMat_0200] obj is: ' + JSON.stringify(obj));
      expect(obj.$type).assertEqual('RichEditor');
      console.info('selectionMenuBkgSysMat_0200 END');
      done();
    });

    /**
     * @tc.name   selectionMenuBkgSysMat_0300
     * @tc.number SUB_ARUI_SELECTIONMENU_BGDSYSMAT_PARAM_0300
     * @tc.desc   Test SelectionMenu backgroundSystemMaterial with ImmersiveMaterial default options (ImmersiveStyle REGULAR)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('selectionMenuBkgSysMat_0300', Level.LEVEL2, async (done: Function) => {
      console.info('selectionMenuBkgSysMat_0300 START');
      let strJson: string = getInspectorByKey('richEditor_bkgSysMat_regular');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionMenuBkgSysMat_0300] obj is: ' + JSON.stringify(obj));
      expect(obj.$type).assertEqual('RichEditor');
      console.info('selectionMenuBkgSysMat_0300 END');
      done();
    });

    /**
     * @tc.name   selectionMenuBkgSysMat_0400
     * @tc.number SUB_ARUI_SELECTIONMENU_BGDSYSMAT_PARAM_0400
     * @tc.desc   Test SelectionMenu backgroundSystemMaterial with ImmersiveMaterial multiple non-default options
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('selectionMenuBkgSysMat_0400', Level.LEVEL2, async (done: Function) => {
      console.info('selectionMenuBkgSysMat_0400 START');
      let strJson: string = getInspectorByKey('richEditor_bkgSysMat_multiOpts');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionMenuBkgSysMat_0400] obj is: ' + JSON.stringify(obj));
      expect(obj.$type).assertEqual('RichEditor');
      console.info('selectionMenuBkgSysMat_0400 END');
      done();
    });

    /**
     * @tc.name   selectionMenuBkgSysMat_0600
     * @tc.number SUB_ARUI_SELECTIONMENU_BGDSYSMAT_PARAM_0600
     * @tc.desc   Test SelectionMenu backgroundSystemMaterial with undefined, should behave same as default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('selectionMenuBkgSysMat_0600', Level.LEVEL2, async (done: Function) => {
      console.info('selectionMenuBkgSysMat_0600 START');
      let strJsonDefault: string = getInspectorByKey('richEditor_bkgSysMat_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      let strJsonUndefined: string = getInspectorByKey('richEditor_bkgSysMat_undefined');
      let objUndefined: Record<string, ESObject> = JSON.parse(strJsonUndefined);
      console.info('[selectionMenuBkgSysMat_0600] objDefault is: ' + JSON.stringify(objDefault));
      console.info('[selectionMenuBkgSysMat_0600] objUndefined is: ' + JSON.stringify(objUndefined));
      expect(objUndefined.$type).not().assertUndefined();
      expect(objUndefined.$type).assertEqual(objDefault.$type);
      console.info('selectionMenuBkgSysMat_0600 END');
      done();
    });

    /**
     * @tc.name   selectionMenuBkgSysMat_0700
     * @tc.number SUB_ARUI_SELECTIONMENU_BGDSYSMAT_PARAM_0700
     * @tc.desc   Test SelectionMenu backgroundSystemMaterial with Material.empty, should disable immersive material
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('selectionMenuBkgSysMat_0700', Level.LEVEL2, async (done: Function) => {
      console.info('selectionMenuBkgSysMat_0700 START');
      let strJson: string = getInspectorByKey('richEditor_bkgSysMat_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info('[selectionMenuBkgSysMat_0700] obj is: ' + JSON.stringify(obj));
      expect(obj.$type).assertEqual('RichEditor');
      console.info('selectionMenuBkgSysMat_0700 END');
      done();
    });
  });
}
