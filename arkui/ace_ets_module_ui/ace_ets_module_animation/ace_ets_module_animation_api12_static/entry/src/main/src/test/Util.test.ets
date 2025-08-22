import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog'

const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
let domain: Int = 0x0000;
let tag: string = 'uitestTag';

class UtilsTest {
  static isloadAndSetUpUiTest = false;

  static async msSleep(count: Int): Promise<Int> {
    return new Promise<Int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, count)
    })
  }
}

async function startAbility(bundleName: string, abilityName: string): Promise<boolean> {
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

async function stopApplication(bundleName: string): Promise<boolean> {
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