import abilityTest from './Ability.test';
import hiddebughiperfTest from './HiDebugHiperf.test';
import HidebugTest from './HiDeBugUn.test';

export default function testsuite() {
  abilityTest();
  hiddebughiperfTest();
  HidebugTest();
}