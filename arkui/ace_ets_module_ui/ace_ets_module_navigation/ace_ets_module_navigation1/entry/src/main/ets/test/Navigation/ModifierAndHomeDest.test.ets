import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/utils/Common';

export default function ModifierAndHomeDestTest() {
  describe('ModifierClearTest', () => {
    beforeEach(async (done: Function) => {
      console.info('ModifierClearTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/ModifierClearPage',
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
        console.error('replaceUrl ModifierClearPage page error:' + err);
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ModifierClear_0100
     * @tc.name   SUB_ARKUI_NAVIGATION_ModifierClear_0100
     * @tc.desc   Test modifier clear with push and pop, verify stack size returns to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_ModifierClear_0100', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_ModifierClear_0100] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageA' });
        await CommonFunc.sleep(1000);
        navPathStack.pop();
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(0);
        console.info('[SUB_ARKUI_NAVIGATION_ModifierClear_0100] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_ModifierClear_0100] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ModifierClear_0200
     * @tc.name   SUB_ARKUI_NAVIGATION_ModifierClear_0200
     * @tc.desc   Test modifier clear with two pushes, verify stack size and path names
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_ModifierClear_0200', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_ModifierClear_0200] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageA' });
        await CommonFunc.sleep(1000);
        navPathStack.pushPath({ name: 'pageB' });
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(2);
        let names: string[] = navPathStack.getAllPathName();
        expect(names.join(',')).assertEqual('pageA,pageB');
        console.info('[SUB_ARKUI_NAVIGATION_ModifierClear_0200] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_ModifierClear_0200] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ModifierClear_0300
     * @tc.name   SUB_ARKUI_NAVIGATION_ModifierClear_0300
     * @tc.desc   Test modifier clear with two pushes and two pops, verify stack size returns to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_ModifierClear_0300', Level.LEVEL1, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_ModifierClear_0300] START');
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
        console.info('[SUB_ARKUI_NAVIGATION_ModifierClear_0300] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_ModifierClear_0300] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_ModifierClear_0400
     * @tc.name   SUB_ARKUI_NAVIGATION_ModifierClear_0400
     * @tc.desc   Test modifier clear with one push, verify getAllPathName returns correct name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_ModifierClear_0400', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_ModifierClear_0400] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageA' });
        await CommonFunc.sleep(1000);
        let names: string[] = navPathStack.getAllPathName();
        expect(names.join(',')).assertEqual('pageA');
        console.info('[SUB_ARKUI_NAVIGATION_ModifierClear_0400] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_ModifierClear_0400] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })
  })

  describe('HomeDestClearTest', () => {
    beforeEach(async (done: Function) => {
      console.info('HomeDestClearTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/HomeDestClearPage',
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
        console.error('replaceUrl HomeDestClearPage page error:' + err);
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_HomeDestClear_0100
     * @tc.name   SUB_ARKUI_NAVIGATION_HomeDestClear_0100
     * @tc.desc   Test home destination clear with push and pop, verify stack size returns to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_HomeDestClear_0100', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_HomeDestClear_0100] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageA' });
        await CommonFunc.sleep(1000);
        navPathStack.pop();
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(0);
        console.info('[SUB_ARKUI_NAVIGATION_HomeDestClear_0100] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_HomeDestClear_0100] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_HomeDestClear_0200
     * @tc.name   SUB_ARKUI_NAVIGATION_HomeDestClear_0200
     * @tc.desc   Test home destination clear with two pushes, verify stack size is 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_HomeDestClear_0200', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_HomeDestClear_0200] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageA' });
        await CommonFunc.sleep(1000);
        navPathStack.pushPath({ name: 'pageB' });
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(2);
        console.info('[SUB_ARKUI_NAVIGATION_HomeDestClear_0200] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_HomeDestClear_0200] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_HomeDestClear_0300
     * @tc.name   SUB_ARKUI_NAVIGATION_HomeDestClear_0300
     * @tc.desc   Test home destination clear with two pushes and two pops, verify path names empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_HomeDestClear_0300', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_HomeDestClear_0300] START');
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
        let names: string[] = navPathStack.getAllPathName();
        expect(names.join(',')).assertEqual('');
        console.info('[SUB_ARKUI_NAVIGATION_HomeDestClear_0300] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_HomeDestClear_0300] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_HomeDestClear_0400
     * @tc.name   SUB_ARKUI_NAVIGATION_HomeDestClear_0400
     * @tc.desc   Test home destination clear with two pushes and two pops, verify stack size returns to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_HomeDestClear_0400', Level.LEVEL1, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_HomeDestClear_0400] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageA' });
        await CommonFunc.sleep(1000);
        navPathStack.pushPath({ name: 'pageB' });
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(2);
        navPathStack.pop();
        await CommonFunc.sleep(1000);
        navPathStack.pop();
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(0);
        console.info('[SUB_ARKUI_NAVIGATION_HomeDestClear_0400] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_HomeDestClear_0400] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })
  })
}
