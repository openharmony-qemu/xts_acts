import type TestRunner from '@ohos.application.testRunner';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

export default class OpenHarmonyTestRunner implements TestRunner {
  onPrepare(): void {
    console.info('OpenHarmonyTestRunner onPrepare');
  }

  async onRun(): Promise<void> {
    const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
    const args = AbilityDelegatorRegistry.getArguments();
    const command = `aa start -d 0 -a TestAbility -b ${args.bundleName}`;
    delegator.executeShellCommand(command, () => {});
  }
}
