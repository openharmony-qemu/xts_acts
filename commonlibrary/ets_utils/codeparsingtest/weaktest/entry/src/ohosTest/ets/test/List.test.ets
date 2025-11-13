import WeakMapTest from './weak/WeakMap.test';
import WeakMixTest from './weak/WeakMix.test';
import WeakRefTest from './weak/WeakRef.test';
import WeakSetTest from './weak/WeakSet.test';

export default function testsuite() {
  WeakMapTest();
  WeakMixTest();
  WeakRefTest();
  WeakSetTest();
}