import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog'

const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
let domain: int = 0x0000;
let tag: String = 'ActsAceEtsModuleImageTextNowearApi18StaticTest';

class UtilsTest {
  static isloadAndSetUpUiTest = false;
  static isStartedAbility = false;

  static async msSleep(count: int): Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, count)
    })
  }

  static async startAbility(bundleName: String, abilityName: String): Promise<boolean> {
    try {
      if (!UtilsTest.isStartedAbility) {
        await abilityDelegator.executeShellCommand(`aa start -b ${bundleName} -a ${abilityName}`);
        hilog.info(domain, tag, `loadAndSetUpUiTest, success`);
        UtilsTest.isStartedAbility = true;
      }
      return true;
    } catch (error) {
      console.error(`UiTestCase, start abilityFailed: ${error}`);
      hilog.info(domain, tag, `UiTestCase, start abilityFailed: ${JSON.stringify(error)}`);
      return false;
    }
  }
}

async function startAbility(bundleName: String, abilityName: String): Promise<boolean> {
  try {
    await abilityDelegator.executeShellCommand(`aa start -b ${bundleName} -a ${abilityName}`);
    console.info(`UiTestCase, start abilityFinished`);
    hilog.info(domain, tag, `UiTestCase, start abilityFinished`);
    return true;
  } catch (error) {
    console.error(`UiTestCase, start abilityFailed: ${error}`);
    hilog.info(domain, tag, `UiTestCase, start abilityFailed: ${JSON.stringify(error)}`);
    return false;
  }
}

async function stopApplication(bundleName: String): Promise<boolean> {
  try {
    await abilityDelegator.executeShellCommand(`aa force-stop ${bundleName} `);
    console.info(`UiTestCase, stop application finished`);
    return true;
  } catch (error) {
    console.error(`UiTestCase,stop application failed: ${JSON.stringify(error)}`);
    return false;
  }
}

export {
  UtilsTest, startAbility, stopApplication
}