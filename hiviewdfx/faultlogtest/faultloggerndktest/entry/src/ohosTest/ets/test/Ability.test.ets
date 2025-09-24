import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium';
import testNapi from 'libentry.so';
import { bundleManager } from '@kit.AbilityKit';

export function asyncSleep(time: number): Promise<Object> {
  return new Promise(resolve => setTimeout(resolve, time));
}
let bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE | bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_EXTENSION_ABILITY;

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_DFX_DFR_FaultlogExtension_C_0100
     * @tc.name testFaultlogExtension_0100
     * @tc.desc test testFaultlogExtension_0100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testFaultlogExtension_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      console.info("====> testFaultlogExtension_0100  start");
      try {
        let found = false;
        const bundleinfo = await bundleManager.getBundleInfoForSelf(bundleFlags);
        const hapModulesInfo = bundleinfo.hapModulesInfo;
        const extensionAbilitiesInfo = hapModulesInfo.flatMap(abilityInfo => abilityInfo.extensionAbilitiesInfo || []);
        console.log('====> testFaultlogExtension_0100 extensionAbilitiesInfo:', extensionAbilitiesInfo);
        const extensionAbilityTypes = extensionAbilitiesInfo.map(extensionAbility => extensionAbility.extensionAbilityType);
        console.log('====> testFaultlogExtension_0100 extensionAbilityTypes:', extensionAbilityTypes);
        extensionAbilitiesInfo.forEach((extensionAbility, index) => {
          console.log(`====> testFaultlogExtension_0100 Extension index ${index + 1}:`);
          console.log(`====> testFaultlogExtension_0100  Extension index type: ${extensionAbility.extensionAbilityType}`);
          if (extensionAbility.extensionAbilityType === 33) {
            found = true;
          }
        });
        expect(found).assertTrue();
        console.info("====> testFaultlogExtension_0100 assert end");
        let result = testNapi.add(2, 3)
        console.info("====> testFaultlogExtension_0100 napi result: " + result);
        await asyncSleep(30000);
        console.info("====> testFaultlogExtension_0100  wait end");
        done();
      } catch (err) {
        console.info("====> testFaultlogExtension_0100  catch error: " + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }
    })


  })
}