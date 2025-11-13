import abilityTest from './Ability.test';
import WeakMapTest from './WeakMap.test';
import WeakMixTest from './WeakMix.test';
import WeakRefTest from './WeakRef.test';
import WeakSetTest from './WeakSet.test';

export default function testsuite() {
  abilityTest();
  WeakMapTest();
  WeakMixTest();
  WeakRefTest();
  WeakSetTest();
}