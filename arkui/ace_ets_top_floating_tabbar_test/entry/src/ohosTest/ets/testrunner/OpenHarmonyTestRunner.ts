import TestRunner from '@ohos.application.testRunner';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let abilityDelegator = undefined;
let abilityDelegatorArguments = undefined;

function translateParamsToString(parameters) {
  const keySet = new Set([
    '-s class', '-s notClass', '-s suite', '-s it',
    '-s level', '-s testType', '-s size', '-s timeout',
    '-s dryRun'
  ]);
  let targetParams = '';
  for (const key in parameters) {
    if (keySet.has(key)) {
      targetParams = `${targetParams} ${key} ${parameters[key]}`;
    }
  }
  return targetParams.trim();
}

async function onAbilityCreateCallback() {
  console.log('onAbilityCreateCallback');
}

async function addAbilityMonitorCallback(err) {
  console.info('addAbilityMonitorCallback : ' + JSON.stringify(err));
}

export default class OpenHarmonyTestRunner implements TestRunner {
  constructor() {
  }

  onPrepare() {
    console.info('OpenHarmonyTestRunner OnPrepare ');
  }

  async onRun() {
    console.log('OpenHarmonyTestRunner onRun run');
    abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
    abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    let testAbilityName = abilityDelegatorArguments.bundleName + '.MainAbility';
    let lMonitor = {
      abilityName: testAbilityName,
      onAbilityCreate: onAbilityCreateCallback,
    };
    abilityDelegator.addAbilityMonitor(lMonitor, addAbilityMonitorCallback);
    let cmd = 'aa start -d 0 -a MainAbility' +
    ' -b ' + abilityDelegatorArguments.bundleName;
    cmd += ' ' + translateParamsToString(abilityDelegatorArguments.parameters);
    let user = AbilityDelegatorRegistry.getArguments().parameters["-u"];
    if(user !== undefined){
        cmd += ' -u ' + user;
    }
    let debug = abilityDelegatorArguments.parameters['-D'];
    if (debug == 'true') {
      cmd += ' -D';
    }
    console.info('cmd : ' + cmd);
    abilityDelegator.executeShellCommand(cmd,
      (err, d) => {
        console.info('executeShellCommand : err : ' + JSON.stringify(err));
        console.info('executeShellCommand : data : ' + d.stdResult);
        console.info('executeShellCommand : data : ' + d.exitCode);
      });
    console.info('OpenHarmonyTestRunner onRun end');
  }
}
