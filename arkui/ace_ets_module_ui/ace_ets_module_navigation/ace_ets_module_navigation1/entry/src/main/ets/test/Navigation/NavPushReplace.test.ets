import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/utils/Common';

class DestParam {
  id: number = 0;
  label: string = '';
  constructor(id: number, label: string) {
    this.id = id;
    this.label = label;
  }
}

export default function NavPushReplaceTest() {
  describe('NavPushReplaceTest', () => {
    beforeEach(async (done: Function) => {
      console.info('NavPushReplaceTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavPushReplacePage',
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
        console.error('replaceUrl NavPushReplaceTest page error:' + err);
      }
      console.info('NavPushReplaceTest beforeEach end');
      done();
    });

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavPushReplace_0100
     * @tc.name   SUB_ARKUI_NAVIGATION_NavPushReplace_0100
     * @tc.desc   Test pushPath with pageOne, verify stack size is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_NavPushReplace_0100', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_0100] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageOne' });
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(1);
        console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_0100] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_NavPushReplace_0100] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavPushReplace_0200
     * @tc.name   SUB_ARKUI_NAVIGATION_NavPushReplace_0200
     * @tc.desc   Test pushPath with pageOne and param, verify stack size is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_NavPushReplace_0200', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_0200] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageOne', param: new DestParam(1, 'testParam') });
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(1);
        console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_0200] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_NavPushReplace_0200] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavPushReplace_0300
     * @tc.name   SUB_ARKUI_NAVIGATION_NavPushReplace_0300
     * @tc.desc   Test pushPath with STANDARD launchMode, verify stack size is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_NavPushReplace_0300', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_0300] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageOne' }, { launchMode: LaunchMode.STANDARD });
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(1);
        console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_0300] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_NavPushReplace_0300] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavPushReplace_0400
     * @tc.name   SUB_ARKUI_NAVIGATION_NavPushReplace_0400
     * @tc.desc   Test pushPath with MOVE_TO_TOP_SINGLETON launchMode, verify stack size is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_NavPushReplace_0400', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_0400] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageOne' }, { launchMode: LaunchMode.MOVE_TO_TOP_SINGLETON });
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(1);
        console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_0400] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_NavPushReplace_0400] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavPushReplace_0500
     * @tc.name   SUB_ARKUI_NAVIGATION_NavPushReplace_0500
     * @tc.desc   Test pushPath with POP_TO_SINGLETON launchMode, verify stack size is 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_NavPushReplace_0500', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_0500] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageOne' });
        await CommonFunc.sleep(1000);
        navPathStack.pushPath({ name: 'pageTwo' }, { launchMode: LaunchMode.POP_TO_SINGLETON });
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(2);
        console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_0500] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_NavPushReplace_0500] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavPushReplace_0600
     * @tc.name   SUB_ARKUI_NAVIGATION_NavPushReplace_0600
     * @tc.desc   Test pushPath with NEW_INSTANCE launchMode, verify stack size is 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_NavPushReplace_0600', Level.LEVEL1, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_0600] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageOne' });
        await CommonFunc.sleep(1000);
        navPathStack.pushPath({ name: 'pageOne' }, { launchMode: LaunchMode.NEW_INSTANCE });
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(2);
        console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_0600] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_NavPushReplace_0600] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavPushReplace_0700
     * @tc.name   SUB_ARKUI_NAVIGATION_NavPushReplace_0700
     * @tc.desc   Test replacePath with pageTwo, verify stack size is 1 and path name is pageTwo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_NavPushReplace_0700', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_0700] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageOne' });
        await CommonFunc.sleep(1000);
        navPathStack.replacePath({ name: 'pageTwo' });
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(1);
        expect(navPathStack.getAllPathName()[0]).assertEqual('pageTwo');
        console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_0700] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_NavPushReplace_0700] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavPushReplace_0800
     * @tc.name   SUB_ARKUI_NAVIGATION_NavPushReplace_0800
     * @tc.desc   Test replacePath with pageTwo and param, verify stack size is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_NavPushReplace_0800', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_0800] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageOne' });
        await CommonFunc.sleep(1000);
        navPathStack.replacePath({ name: 'pageTwo', param: new DestParam(2, 'replaceParam') });
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(1);
        console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_0800] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_NavPushReplace_0800] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavPushReplace_0900
     * @tc.name   SUB_ARKUI_NAVIGATION_NavPushReplace_0900
     * @tc.desc   Test replacePath with STANDARD launchMode, verify stack size is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_NavPushReplace_0900', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_0900] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageOne' });
        await CommonFunc.sleep(1000);
        navPathStack.replacePath({ name: 'pageTwo' }, { launchMode: LaunchMode.STANDARD });
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(1);
        console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_0900] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_NavPushReplace_0900] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavPushReplace_1000
     * @tc.name   SUB_ARKUI_NAVIGATION_NavPushReplace_1000
     * @tc.desc   Test replacePath with MOVE_TO_TOP_SINGLETON launchMode, verify stack size is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_NavPushReplace_1000', Level.LEVEL1, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_1000] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageOne' });
        await CommonFunc.sleep(1000);
        navPathStack.replacePath({ name: 'pageTwo' }, { launchMode: LaunchMode.MOVE_TO_TOP_SINGLETON });
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(1);
        console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_1000] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_NavPushReplace_1000] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavPushReplace_1100
     * @tc.name   SUB_ARKUI_NAVIGATION_NavPushReplace_1100
     * @tc.desc   Test pushPathByName with null param, verify stack size is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_NavPushReplace_1100', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_1100] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPathByName('pageOne', null);
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(1);
        console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_1100] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_NavPushReplace_1100] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavPushReplace_1200
     * @tc.name   SUB_ARKUI_NAVIGATION_NavPushReplace_1200
     * @tc.desc   Test pushPathByName with param, verify stack size is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_NavPushReplace_1200', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_1200] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPathByName('pageOne', new DestParam(3, 'byNameParam'));
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(1);
        console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_1200] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_NavPushReplace_1200] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavPushReplace_1300
     * @tc.name   SUB_ARKUI_NAVIGATION_NavPushReplace_1300
     * @tc.desc   Test replacePathByName with null param, verify stack size is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_NavPushReplace_1300', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_1300] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPathByName('pageOne', null);
        await CommonFunc.sleep(1000);
        navPathStack.replacePathByName('pageTwo', null);
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(1);
        console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_1300] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_NavPushReplace_1300] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavPushReplace_1400
     * @tc.name   SUB_ARKUI_NAVIGATION_NavPushReplace_1400
     * @tc.desc   Test replacePathByName with param, verify stack size is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_NavPushReplace_1400', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_1400] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPathByName('pageOne', null);
        await CommonFunc.sleep(1000);
        navPathStack.replacePathByName('pageTwo', new DestParam(4, 'replaceByNameParam'));
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(1);
        console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_1400] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_NavPushReplace_1400] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavPushReplace_1500
     * @tc.name   SUB_ARKUI_NAVIGATION_NavPushReplace_1500
     * @tc.desc   Test pushDestination with pageOne, verify result resolved and stack size is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_NavPushReplace_1500', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_1500] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        try {
          await navPathStack.pushDestination({ name: 'pageOne' });
          AppStorage.setOrCreate<string>('pushDestinationResult', 'resolved');
        } catch (err) {
          AppStorage.setOrCreate<string>('pushDestinationResult', 'rejected');
        }
        await CommonFunc.sleep(1000);
        let result = AppStorage.get<string>('pushDestinationResult');
        expect(result).assertEqual('resolved');
        expect(navPathStack.size()).assertEqual(1);
        AppStorage.delete('pushDestinationResult');
        console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_1500] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_NavPushReplace_1500] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavPushReplace_1600
     * @tc.name   SUB_ARKUI_NAVIGATION_NavPushReplace_1600
     * @tc.desc   Test pushDestination with STANDARD launchMode, verify result resolved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_NavPushReplace_1600', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_1600] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        try {
          await navPathStack.pushDestination({ name: 'pageOne' }, { launchMode: LaunchMode.STANDARD });
          AppStorage.setOrCreate<string>('pushDestinationLaunchModeResult', 'resolved');
        } catch (err) {
          AppStorage.setOrCreate<string>('pushDestinationLaunchModeResult', 'rejected');
        }
        await CommonFunc.sleep(1000);
        let result = AppStorage.get<string>('pushDestinationLaunchModeResult');
        expect(result).assertEqual('resolved');
        AppStorage.delete('pushDestinationLaunchModeResult');
        console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_1600] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_NavPushReplace_1600] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavPushReplace_1700
     * @tc.name   SUB_ARKUI_NAVIGATION_NavPushReplace_1700
     * @tc.desc   Test pushDestinationByName with null param, verify result resolved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_NavPushReplace_1700', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_1700] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        try {
          await navPathStack.pushDestinationByName('pageOne', null);
          AppStorage.setOrCreate<string>('pushDestinationByNameResult', 'resolved');
        } catch (err) {
          AppStorage.setOrCreate<string>('pushDestinationByNameResult', 'rejected');
        }
        await CommonFunc.sleep(1000);
        let result = AppStorage.get<string>('pushDestinationByNameResult');
        expect(result).assertEqual('resolved');
        AppStorage.delete('pushDestinationByNameResult');
        console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_1700] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_NavPushReplace_1700] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavPushReplace_1800
     * @tc.name   SUB_ARKUI_NAVIGATION_NavPushReplace_1800
     * @tc.desc   Test pushDestinationByName with param, verify result resolved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_NavPushReplace_1800', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_1800] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        try {
          await navPathStack.pushDestinationByName('pageOne', new DestParam(5, 'asyncByNameParam'));
          AppStorage.setOrCreate<string>('pushDestinationByNameParamResult', 'resolved');
        } catch (err) {
          AppStorage.setOrCreate<string>('pushDestinationByNameParamResult', 'rejected');
        }
        await CommonFunc.sleep(1000);
        let result = AppStorage.get<string>('pushDestinationByNameParamResult');
        expect(result).assertEqual('resolved');
        AppStorage.delete('pushDestinationByNameParamResult');
        console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_1800] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_NavPushReplace_1800] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavPushReplace_1900
     * @tc.name   SUB_ARKUI_NAVIGATION_NavPushReplace_1900
     * @tc.desc   Test pushPath with pageOne, verify getAllPathName returns pageOne
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_NavPushReplace_1900', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_1900] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageOne' });
        await CommonFunc.sleep(1000);
        let names: string[] = navPathStack.getAllPathName();
        expect(names.join(',')).assertEqual('pageOne');
        console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_1900] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_NavPushReplace_1900] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavPushReplace_2000
     * @tc.name   SUB_ARKUI_NAVIGATION_NavPushReplace_2000
     * @tc.desc   Test pushPath with pageOne and pop, verify stack size returns to 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL0
     */
    it('SUB_ARKUI_NAVIGATION_NavPushReplace_2000', Level.LEVEL0, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_2000] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageOne' });
        await CommonFunc.sleep(1000);
        navPathStack.pop();
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(0);
        console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_2000] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_NavPushReplace_2000] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_ARKUI_NAVIGATION_NavPushReplace_2100
     * @tc.name   SUB_ARKUI_NAVIGATION_NavPushReplace_2100
     * @tc.desc   Test pushPath with MOVE_TO_TOP_SINGLETON launchMode twice, verify stack size is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  Level.LEVEL1
     */
    it('SUB_ARKUI_NAVIGATION_NavPushReplace_2100', Level.LEVEL1, async (done: Function): Promise<void> => {
      console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_2100] START');
      try {
        await CommonFunc.sleep(1000);
        let navPathStack: NavPathStack | undefined = AppStorage.get<NavPathStack>('navPathStack') as NavPathStack;
        navPathStack.pushPath({ name: 'pageOne' }, { launchMode: LaunchMode.MOVE_TO_TOP_SINGLETON });
        await CommonFunc.sleep(1000);
        navPathStack.pushPath({ name: 'pageOne' }, { launchMode: LaunchMode.MOVE_TO_TOP_SINGLETON });
        await CommonFunc.sleep(1000);
        expect(navPathStack.size()).assertEqual(1);
        console.info('[SUB_ARKUI_NAVIGATION_NavPushReplace_2100] END');
      } catch (err) {
        console.error('[SUB_ARKUI_NAVIGATION_NavPushReplace_2100] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    })
  })
}
