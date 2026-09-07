import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/utils/Common';

export default function ClearContentStackTest() {
  describe('ClearContentStackTest', () => {
    beforeEach(async (done: Function) => {
      console.info('ClearContentStackTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/ClearContentStackPage',
      }
      try {
        await router.replaceUrl(options);
        await CommonFunc.sleep(2000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        if (navPathStack) {
          navPathStack.clear();
        }
        await CommonFunc.sleep(500);
      } catch (err) {
        console.error('replaceUrl ClearContentStackPage page error:' + err);
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ClearContentStack_0100
     * @tc.name   SUB_ARKUI_NAVIGATION_ClearContentStack_0100
     * @tc.desc   Test clear content stack with two pushes, verify stack size is 2 and delete clearStackSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_ClearContentStack_0100', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_ClearContentStack_0100] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageA' });
        await CommonFunc.sleep(1000);
        navPathStack.pushPath({ name: 'pageB' });
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(2);
        AppStorage.delete('clearStackSize');
        console.info('[SUB_ARKUI_NAVIGATION_ClearContentStack_0100] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_ClearContentStack_0100] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ClearContentStack_0200
     * @tc.name   SUB_ARKUI_NAVIGATION_ClearContentStack_0200
     * @tc.desc   Test clear content stack with two pushes and two pops, verify stack size returns to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_ClearContentStack_0200', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_ClearContentStack_0200] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageA' });
        await CommonFunc.sleep(1000);
        navPathStack.pushPath({ name: 'pageB' });
        await CommonFunc.sleep(1000);
        navPathStack.pop();
        await CommonFunc.sleep(1000);
        navPathStack.pop();
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(0);
        console.info('[SUB_ARKUI_NAVIGATION_ClearContentStack_0200] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_ClearContentStack_0200] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ClearContentStack_0300
     * @tc.name   SUB_ARKUI_NAVIGATION_ClearContentStack_0300
     * @tc.desc   Test clear content stack with one push and one pop, verify stack size returns to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_ClearContentStack_0300', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_ClearContentStack_0300] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageA' });
        await CommonFunc.sleep(1000);
        navPathStack.pop();
        await CommonFunc.sleep(1500);
        expect(navPathStack.size()).assertEqual(0);
        console.info('[SUB_ARKUI_NAVIGATION_ClearContentStack_0300] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_ClearContentStack_0300] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ClearContentStack_0400
     * @tc.name   SUB_ARKUI_NAVIGATION_ClearContentStack_0400
     * @tc.desc   Test clear content stack with two pushes, verify getAllPathName returns pageA,pageB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_ClearContentStack_0400', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_ClearContentStack_0400] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageA' });
        await CommonFunc.sleep(1000);
        navPathStack.pushPath({ name: 'pageB' });
        await CommonFunc.sleep(1000);
        let names: string[] = navPathStack.getAllPathName();
        expect(names.join(',')).assertEqual('pageA,pageB');
        console.info('[SUB_ARKUI_NAVIGATION_ClearContentStack_0400] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_ClearContentStack_0400] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ClearContentStack_0500
     * @tc.name   SUB_ARKUI_NAVIGATION_ClearContentStack_0500
     * @tc.desc   Test clear content stack with two pushes and two pops, verify stack size is 1 then 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_ClearContentStack_0500', Level.LEVEL1, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_ClearContentStack_0500] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageA' });
        await CommonFunc.sleep(1000);
        navPathStack.pushPath({ name: 'pageB' });
        await CommonFunc.sleep(1000);
        navPathStack.pop();
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(1);
        navPathStack.pop();
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(0);
        console.info('[SUB_ARKUI_NAVIGATION_ClearContentStack_0500] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_ClearContentStack_0500] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ClearContentStack_0600
     * @tc.name   SUB_ARKUI_NAVIGATION_ClearContentStack_0600
     * @tc.desc   Test clear content stack with two pushes, verify getAllPathName returns pageA,pageB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_ClearContentStack_0600', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_ClearContentStack_0600] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageA' });
        await CommonFunc.sleep(1000);
        navPathStack.pushPath({ name: 'pageB' });
        await CommonFunc.sleep(1000);
        let names: string[] = navPathStack.getAllPathName();
        expect(names.join(',')).assertEqual('pageA,pageB');
        console.info('[SUB_ARKUI_NAVIGATION_ClearContentStack_0600] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_ClearContentStack_0600] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ClearContentStack_0700
     * @tc.name   SUB_ARKUI_NAVIGATION_ClearContentStack_0700
     * @tc.desc   Test clear content stack with two pushes and clear, verify stack size returns to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_ClearContentStack_0700', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_ClearContentStack_0700] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageA' });
        await CommonFunc.sleep(1000);
        navPathStack.pushPath({ name: 'pageB' });
        await CommonFunc.sleep(1000);
        navPathStack.clear();
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(0);
        console.info('[SUB_ARKUI_NAVIGATION_ClearContentStack_0700] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_ClearContentStack_0700] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })
  })
}
