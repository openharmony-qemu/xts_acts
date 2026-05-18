import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { TestRunner } from '@kit.TestKit';
import hilog from '@ohos.hilog';
import { Hypium } from '../../../hypium/index';
import testsuite from '../test/List.test';

let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator;
let abilityDelegatorArguments: abilityDelegatorRegistry.AbilityDelegatorArgs;
let domain: int = 0x0000;
let tag: string = 'testTag';

export class OpenHarmonyTestRunner implements TestRunner {
  public onPrepare: () => void = () => {
    hilog.info(domain, tag, '%{public}s', 'OpenHarmonyTestRunner OnPrepare');
  }

  public onRun: () => void = () => {
    abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
    abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
  }
}
