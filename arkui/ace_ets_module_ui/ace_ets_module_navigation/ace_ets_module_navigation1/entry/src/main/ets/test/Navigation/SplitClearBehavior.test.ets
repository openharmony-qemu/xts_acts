import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/utils/Common';

export default function SplitClearBehaviorTest() {
  describe('SplitClearTest', () => {
    beforeEach(async (done: Function) => {
      console.info('SplitClearTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/SplitClearPage',
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
        console.error('replaceUrl SplitClearPage page error:' + err);
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_SplitClear_0100
     * @tc.name   SUB_ARKUI_NAVIGATION_SplitClear_0100
     * @tc.desc   Test split clear with three pushes, verify stack size and path name is pageC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_SplitClear_0100', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_SplitClear_0100] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageA' });
        await CommonFunc.sleep(1000);
        navPathStack.pushPath({ name: 'pageB' });
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(2);
        navPathStack.pushPath({ name: 'pageC' });
        await CommonFunc.sleep(1000);
        let names: string[] = navPathStack.getAllPathName();
        expect(names.join(',')).assertEqual('pageA,pageB,pageC');
        console.info('[SUB_ARKUI_NAVIGATION_SplitClear_0100] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_SplitClear_0100] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_SplitClear_0200
     * @tc.name   SUB_ARKUI_NAVIGATION_SplitClear_0200
     * @tc.desc   Test split clear with two pushes, verify stack size and path name is pageB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_SplitClear_0200', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_SplitClear_0200] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageA' });
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(1);
        navPathStack.pushPath({ name: 'pageB' });
        await CommonFunc.sleep(1000);
        let names: string[] = navPathStack.getAllPathName();
        expect(names.join(',')).assertEqual('pageA,pageB');
        console.info('[SUB_ARKUI_NAVIGATION_SplitClear_0200] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_SplitClear_0200] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_SplitClear_0300
     * @tc.name   SUB_ARKUI_NAVIGATION_SplitClear_0300
     * @tc.desc   Test split clear with one push, verify stack size and path name is pageA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_SplitClear_0300', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_SplitClear_0300] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageA' });
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(1);
        let names: string[] = navPathStack.getAllPathName();
        expect(names.join(',')).assertEqual('pageA');
        console.info('[SUB_ARKUI_NAVIGATION_SplitClear_0300] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_SplitClear_0300] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_SplitClear_0400
     * @tc.name   SUB_ARKUI_NAVIGATION_SplitClear_0400
     * @tc.desc   Test split clear with three pushes, verify path names are pageB and pageC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_SplitClear_0400', Level.LEVEL1, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_SplitClear_0400] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageA' });
        await CommonFunc.sleep(1000);
        navPathStack.pushPath({ name: 'pageB' });
        await CommonFunc.sleep(1000);
        navPathStack.pushPath({ name: 'pageC' });
        await CommonFunc.sleep(1000);
        let names: string[] = navPathStack.getAllPathName();
        expect(names.join(',')).assertEqual('pageA,pageB,pageC');
        console.info('[SUB_ARKUI_NAVIGATION_SplitClear_0400] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_SplitClear_0400] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_SplitClear_0500
     * @tc.name   SUB_ARKUI_NAVIGATION_SplitClear_0500
     * @tc.desc   Test split clear with two pushes and one pop, verify path name is pageA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_SplitClear_0500', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_SplitClear_0500] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageA' });
        await CommonFunc.sleep(1000);
        navPathStack.pushPath({ name: 'pageB' });
        await CommonFunc.sleep(1000);
        navPathStack.pop();
        await CommonFunc.sleep(1000);
        let names: string[] = navPathStack.getAllPathName();
        expect(names.join(',')).assertEqual('pageA');
        console.info('[SUB_ARKUI_NAVIGATION_SplitClear_0500] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_SplitClear_0500] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })
  })

  describe('SplitNoClearTest', () => {
    beforeEach(async (done: Function) => {
      console.info('SplitNoClearTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/SplitNoClearPage',
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
        console.error('replaceUrl SplitNoClearPage page error:' + err);
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_SplitNoClear_0100
     * @tc.name   SUB_ARKUI_NAVIGATION_SplitNoClear_0100
     * @tc.desc   Test split no clear with three pushes, verify stack size and path names are pageA,pageB,pageC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_SplitNoClear_0100', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_SplitNoClear_0100] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageA' });
        await CommonFunc.sleep(1000);
        navPathStack.pushPath({ name: 'pageB' });
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(2);
        navPathStack.pushPath({ name: 'pageC' });
        await CommonFunc.sleep(1000);
        let names: string[] = navPathStack.getAllPathName();
        expect(names.join(',')).assertEqual('pageA,pageB,pageC');
        console.info('[SUB_ARKUI_NAVIGATION_SplitNoClear_0100] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_SplitNoClear_0100] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_SplitNoClear_0200
     * @tc.name   SUB_ARKUI_NAVIGATION_SplitNoClear_0200
     * @tc.desc   Test split no clear with two pushes, verify stack size and path names are pageA,pageB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_SplitNoClear_0200', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_SplitNoClear_0200] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageA' });
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(1);
        navPathStack.pushPath({ name: 'pageB' });
        await CommonFunc.sleep(1000);
        let names: string[] = navPathStack.getAllPathName();
        expect(names.join(',')).assertEqual('pageA,pageB');
        console.info('[SUB_ARKUI_NAVIGATION_SplitNoClear_0200] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_SplitNoClear_0200] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_SplitNoClear_0300
     * @tc.name   SUB_ARKUI_NAVIGATION_SplitNoClear_0300
     * @tc.desc   Test split no clear with push, pop, push, verify path names are pageA,pageC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_SplitNoClear_0300', Level.LEVEL1, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_SplitNoClear_0300] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageA' });
        await CommonFunc.sleep(1000);
        navPathStack.pushPath({ name: 'pageB' });
        await CommonFunc.sleep(1000);
        navPathStack.pop();
        await CommonFunc.sleep(1000);
        navPathStack.pushPath({ name: 'pageC' });
        await CommonFunc.sleep(1000);
        let names: string[] = navPathStack.getAllPathName();
        expect(names.join(',')).assertEqual('pageA,pageC');
        console.info('[SUB_ARKUI_NAVIGATION_SplitNoClear_0300] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_SplitNoClear_0300] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })
  })

  describe('SplitReplaceClearTest', () => {
    beforeEach(async (done: Function) => {
      console.info('SplitReplaceClearTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/SplitReplaceClearPage',
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
        console.error('replaceUrl SplitReplaceClearPage page error:' + err);
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_SplitReplaceClear_0100
     * @tc.name   SUB_ARKUI_NAVIGATION_SplitReplaceClear_0100
     * @tc.desc   Test split replace clear with push and replacePath, verify path name is pageC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_SplitReplaceClear_0100', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_SplitReplaceClear_0100] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageA' });
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(1);
        navPathStack.replacePath({ name: 'pageC' });
        await CommonFunc.sleep(1000);
        let names: string[] = navPathStack.getAllPathName();
        expect(names.join(',')).assertEqual('pageC');
        console.info('[SUB_ARKUI_NAVIGATION_SplitReplaceClear_0100] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_SplitReplaceClear_0100] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_SplitReplaceClear_0200
     * @tc.name   SUB_ARKUI_NAVIGATION_SplitReplaceClear_0200
     * @tc.desc   Test split replace clear with two pushes and replacePathByName, verify path name is pageC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_SplitReplaceClear_0200', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_SplitReplaceClear_0200] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageA' });
        await CommonFunc.sleep(1000);
        navPathStack.pushPath({ name: 'pageB' });
        await CommonFunc.sleep(1000);
        navPathStack.replacePathByName('pageC', null);
        await CommonFunc.sleep(1000);
        let names: string[] = navPathStack.getAllPathName();
        expect(names.join(',')).assertEqual('pageA,pageC');
        console.info('[SUB_ARKUI_NAVIGATION_SplitReplaceClear_0200] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_SplitReplaceClear_0200] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_SplitReplaceClear_0300
     * @tc.name   SUB_ARKUI_NAVIGATION_SplitReplaceClear_0300
     * @tc.desc   Test split replace clear with two pushes and replacePath, verify path name is pageC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_SplitReplaceClear_0300', Level.LEVEL1, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_SplitReplaceClear_0300] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageA' });
        await CommonFunc.sleep(1000);
        navPathStack.pushPath({ name: 'pageB' });
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(2);
        navPathStack.replacePath({ name: 'pageC' });
        await CommonFunc.sleep(1000);
        let names: string[] = navPathStack.getAllPathName();
        expect(names.join(',')).assertEqual('pageA,pageC');
        console.info('[SUB_ARKUI_NAVIGATION_SplitReplaceClear_0300] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_SplitReplaceClear_0300] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })
  })

  describe('StackNoEffectTest', () => {
    beforeEach(async (done: Function) => {
      console.info('StackNoEffectTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/StackNoEffectPage',
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
        console.error('replaceUrl StackNoEffectPage page error:' + err);
      }
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_StackNoEffect_0100
     * @tc.name   SUB_ARKUI_NAVIGATION_StackNoEffect_0100
     * @tc.desc   Test stack no effect with three pushes, verify stack size and path names are pageA,pageB,pageC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_StackNoEffect_0100', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_StackNoEffect_0100] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageA' });
        await CommonFunc.sleep(1000);
        navPathStack.pushPath({ name: 'pageB' });
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(2);
        navPathStack.pushPath({ name: 'pageC' });
        await CommonFunc.sleep(1000);
        let names: string[] = navPathStack.getAllPathName();
        expect(names.join(',')).assertEqual('pageA,pageB,pageC');
        console.info('[SUB_ARKUI_NAVIGATION_StackNoEffect_0100] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_StackNoEffect_0100] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_StackNoEffect_0200
     * @tc.name   SUB_ARKUI_NAVIGATION_StackNoEffect_0200
     * @tc.desc   Test stack no effect with two pushes, verify stack size and path names are pageA,pageB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_StackNoEffect_0200', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_StackNoEffect_0200] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageA' });
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(1);
        navPathStack.pushPath({ name: 'pageB' });
        await CommonFunc.sleep(1000);
        let names: string[] = navPathStack.getAllPathName();
        expect(names.join(',')).assertEqual('pageA,pageB');
        console.info('[SUB_ARKUI_NAVIGATION_StackNoEffect_0200] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_StackNoEffect_0200] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_StackNoEffect_0300
     * @tc.name   SUB_ARKUI_NAVIGATION_StackNoEffect_0300
     * @tc.desc   Test stack no effect with two pushes and replacePath, verify path names are pageA,pageC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_StackNoEffect_0300', Level.LEVEL1, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_StackNoEffect_0300] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageA' });
        await CommonFunc.sleep(1000);
        navPathStack.pushPath({ name: 'pageB' });
        await CommonFunc.sleep(1000);
        navPathStack.replacePath({ name: 'pageC' });
        await CommonFunc.sleep(1000);
        let names: string[] = navPathStack.getAllPathName();
        expect(names.join(',')).assertEqual('pageA,pageC');
        console.info('[SUB_ARKUI_NAVIGATION_StackNoEffect_0300] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_StackNoEffect_0300] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })
  })
}
