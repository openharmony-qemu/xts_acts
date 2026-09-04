import UIAbility from '@ohos.app.ability.UIAbility';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../test/List.test';

export default class TestAbility extends UIAbility {
  onCreate(): void {
    const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
    const args = AbilityDelegatorRegistry.getArguments();
    Hypium.hypiumTest(delegator, args, testsuite);
  }
}
