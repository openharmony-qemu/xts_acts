import abilityTest from './Ability.test';
import WeakMapTest from './WeakMap.test';
import WeakMixTest from './WeakMix.test';
import WeakRefTest from './WeakRef.test';
import WeakSetTest from './WeakSet.test';

import keyedCollections03Test from './WeakMap/KeyedCollections_03.test';
import keyedCollections04Test from './WeakMap/KeyedCollections_04.test';
import keyedCollections10Test from './WeakSet/KeyedCollections_10.test';
import keyedCollections13Test from './WeakMap/KeyedCollections_13.test';
import keyedCollections14Test from './WeakMap/KeyedCollections_14.test';
import keyedCollections15Test from './WeakMap/KeyedCollections_15.test';
import keyedCollections16Test from './WeakMap/KeyedCollections_16.test';
import keyedCollections18Test from './WeakMap/KeyedCollections_18.test';
import keyedCollections19Test from './WeakSet/KeyedCollections_19.test';

export default function testsuite() {
  abilityTest();
  WeakMapTest();
  WeakMixTest();
  WeakRefTest();
  WeakSetTest();

  keyedCollections03Test();
  keyedCollections04Test();
  keyedCollections10Test();
  keyedCollections13Test();
  keyedCollections14Test();
  keyedCollections15Test();
  keyedCollections16Test();
  keyedCollections18Test();
  keyedCollections19Test();
}